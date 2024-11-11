close all;


% matice
A = diag([4,3,2,1]);

% pocatecni vektor
v0 = [1,1,1,1]';


% pocet iteraci
niter = 35;

[mu,v,res_2norm] = power_method_reseni(A,v0,niter); 

err_eigval = nan(1,size(v,2)); err_eigvec = nan(1,size(v,2)); % inicializace
[eigvec_dom,eigval_dom] = eigs(A,1);    % dominantni vlastni cislo spoctene Matlabem
for k = 1:size(v,2)
    err_eigval(k) = abs(mu(k)-eigval_dom);  % chyba approximace vl. c.
    err_eigvec(k) = norm(eigvec_dom-v(:,k));  % chyba approximace vl. v.
end

figure(1)
subplot(221);
plot(0:niter,mu,LineWidth=2);
title('Aproximace $\mu_k$ dominantniho vlastniho cisla $\lambda_1$','FontSize',16, 'interpreter', 'latex');
xlabel('iterace $k$','FontSize',14, 'interpreter', 'latex');  xlim([-0.5,niter+1]);

subplot(223);
semilogy(0:niter,res_2norm,LineWidth=2);
title('Norma residua $\|Av_k - \mu_k v_k\|$','FontSize',16, 'interpreter', 'latex');
xlabel('iterace $k$','FontSize',14, 'interpreter', 'latex');  xlim([-0.5,niter+1]);


subplot(222);
plot(0:niter,v(1,:),'.-',MarkerSize=20,LineWidth=2);
hold on
plot(0:niter,v(2,:),'.-',MarkerSize=20,LineWidth=2);
hold on
plot(0:niter,v(3,:),'.-',MarkerSize=20,LineWidth=2);
hold on
plot(0:niter,v(4,:),'.-',MarkerSize=20,LineWidth=2);
hold on
title('Aproximace $v_k$ vlastniho vektoru $s_1$','FontSize',16, 'interpreter', 'latex');
xlabel('iterace $k$','FontSize',14, 'interpreter', 'latex'); xlim([-0.5,niter+1]);
legend('$(v_k)_1$','$(v_k)_2$','$(v_k)_3$','$(v_k)_4$','FontSize',14, 'interpreter', 'latex');

subplot(224);
semilogy(0:niter,err_eigvec,LineWidth=2);
title('Chyba aproximace $\|v_k - s_1\|$','FontSize',16, 'interpreter', 'latex');
xlabel('iterace $k$','FontSize',14, 'interpreter', 'latex');  xlim([-0.5,niter+1]);

