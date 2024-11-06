degrees = 24; % max 24

show_perturbation = true;

res = zeros(2,degrees);
resN = zeros(2,degrees);
btoImA = zeros(2,degrees);
for kk=[1:24] 
%for kk=[24,24,24,24] % pouzit pro ruzne perturbace stupnì 24
    %zadani
    k = kk;
    n = 25;
    % horizontalni skalovani: funkce je def. na intervalu [0,xend],
    % prodlouzeni intervalu zhorsuje spatnou podminenost ulohy: pro cca
    % [0,1.3] je nejmensi
    xend = 5;
    x = linspace(0,xend,n)'; %hodnoty x_i
    xx = linspace(0,xend,n*100)'; % pro pøesneji vykreslenou funkci
    
    %f a f_exact musi byt stejne!    
    
    %f = sin(60*x) + exp(3*x);% %hodnoty f(x_i)
    %f = sin(20*x) + exp(3*x);% %hodnoty f(x_i)
    %f = 2*sin(20*x) + 20*x - exp(3*x);% %hodnoty f(x_i)
    %f = .5*sin(20*x) + exp(x) + 10*x.^4;  % puvodni zadani
    
    % zadaná funkce (2018)
    f = 3*sin(20*x/xend) + 20*x/xend - exp(3*x/xend);% %hodnoty f(x_i)
    %f = 3*sin(4*x) + 4*x - exp(0.6*x);
    
    % nespojitost:
    %f = 3*sin(20*x/xend) + 20*x/xend - exp(3*x/xend) + double(x>xend/2);% %hodnoty f(x_i)
    
    %hladká neanalytická funkce
    %f = zeros(n,1) + 10*double(x>0.2*xend).*exp(-1./(x-0.2*xend));% %hodnoty f(x_i)
    %funkce se singularitou/nespojitoti v derivacich
    %f = 5 + double(x>xend/2).*5.*sqrt((x-xend/2)/xend) - double(x<xend/2).*5.*sqrt((xend/2-x)/xend);
    %f = 5*abs(x-xend/2);
    %f = 5+(x-xend/2).*abs(x-xend/2);

    %f_exact = sin(60*xx) + exp(3*xx); %hodnoty f(x_i)
    %f_exact = sin(20*xx) + exp(3*xx); %hodnoty f(x_i)
    %f_exact = 2*sin(20*xx) + 20*xx - exp(3*xx); %hodnoty f(x_i)
    %f_exact = .5*sin(20*xx) + exp(xx) + 10*xx.^4; %hodnoty f(x_i)  % puvodni zadani
        
    % zadaná funkce (2018)
    f_exact = 3*sin(20*xx/xend) + 20*xx/xend - exp(3*xx/xend); %hodnoty f(x_i)
    % nespojitost:
    %f_exact = 3*sin(20*xx/xend) + 20*xx/xend - exp(3*xx/xend) + double(xx>xend/2); %hodnoty f(x_i)
    
    %hladká neanalytická funkce
    %f_exact = zeros(100*n,1) + 10*double(xx>0.2*xend).*exp(-1./(xx-0.2*xend));% %hodnoty f(x_i)
    %funkce se singularitou/nespojitoti v derivacich
    %f_exact = 5+ double(xx>xend/2).*5.*sqrt((xx-xend/2)/xend) - double(xx<xend/2).*5.*sqrt((xend/2-xx)/xend);
    %f_exact = 5*abs(xx-xend/2);
    %f_exact = 5+(xx-xend/2).*abs(xx-xend/2);

    A =  fliplr(vander(x));
    B = A(:,1:k+1);
    c = B\f;
    %figure(1);
    subplot(121);
    plot(xx,f_exact,'b-','LineWidth',3), hold on,
    plot(x,B*c,'kx','MarkerSize',10),
    plot(xx,polyval(c(end:-1:1),xx),'k-','LineWidth',1);
    axis([0 xend -1 10]);
    legend('f','LS reseni','polynom','location','southoutside')
    hold off
    
    podm = cond(B)
    res(1,k) = norm(f-B*c)/norm(f);
%     resN(1,k) = norm(B'*(f-B*c))/norm(B'*f);
%     [U,S,V]=svd(B);
%     r = rank(S);
%     Pf = U(:,1:r)*U(:,1:r)'*f;
%     btoImA(1,k) = norm(Pf-f)/norm(f);  
    if show_perturbation
        % nahodna perturbace prave strany (pro vizualizaci citlivosti na zmeny prave strany)
        ff = f + (1e-1).*randn(n,1);
        %ff = f + (1e-1).*randn(n,1);
        cc = B\ff;
        hold on;
        plot(x,ff,'bx','MarkerSize',10);
        plot(x,B*cc,'rx','MarkerSize',10);
        plot(xx,polyval(cc(end:-1:1),xx),'k-','LineWidth',1);
        legend('f','LS reseni','polynom','f +perturbace','LS reseni (perturbace)','polynom (perturbace)','location','southoutside')
        axis([0 xend -1 10]);
        hold off
        res(2,k) = norm(f-B*cc);

        rozdil_reseni = norm(c-cc)
        rozdil_pr_stran = norm(f-ff)
    end
    
    title(sprintf('k = %d, hodnost = %d, podmínìnost = %.1e norma rezidua %.1e',k,rank(B),podm,res(1,k)));
    subplot(122);
    semilogy([1:degrees],res(1,:),'r-+','MarkerSize',8);hold on;
    if show_perturbation
        semilogy([1:degrees],res(2,:),'b-x','MarkerSize',8);
    end
    %semilogy([1:degrees],resN(1,:),'g-x');
    %semilogy([1:degrees],abs(btoImA(1,:)-res(1,:)),'b-+');
    %semilogy([1:degrees],btoImA(1,:),'k-x');
    hold off;
    legend('reziduum','location','southoutside')
    if show_perturbation
        legend('reziduum', 'reziduum (pert)','location','southoutside')
    end
    title('norma rezidua')
    pause
end


% figure(3);
% semilogy(x,abs(f-B*c),'g-'), hold on;
% semilogy(x,abs(ff-B*cc),'r-'), hold off;

% figure(4);
% y = ones(k+1,1);
% ff = B*y;
% sol = B\ff;
% % plot(x,ff,'rx'), hold on,
% plot(x,abs(ff-B*sol),'g-'), hold off
% diff = norm(sol-y)
% res_diff = norm(ff-B*sol)
