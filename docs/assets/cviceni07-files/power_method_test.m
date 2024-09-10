close all;
 A = diag([4,3,2,1]);        
% A = diag([4,1.2,1.1,1]);    
% A = diag([4,3.9,2,1]);      
% A = diag([4,-3.9,2,1]);     
% A = diag([-4,3,2,1]);       
% A = diag([4,4,2,1]);        
% A = diag([4,-4,2,1]);       
% A = rand(4);

% pocatecni vektor
 v0 = [1,1,1,1]';
% v0 = [0.01,1,1,1]';       
% v0 = rand(4,1);

% pocet iteraci
niter = 25;

[mu,v,res_2norm] = power_method(A,v0,niter); 

eig_dom = eigs(A,1);    % dominantni vlastni cislo spoctene Matlabem
err = abs(mu-eig_dom);  % chyba approximace


figure(1)
subplot(221);
plot(0:niter,mu,LineWidth=2);
title('Aproximace vlastniho cisla','FontSize',14);
xlabel('iterace');

subplot(223);
semilogy(0:niter,err,LineWidth=2);
title('Chyba aproximace vlastniho cisla ','FontSize',14);
xlabel('iterace');

subplot(224);
semilogy(0:niter,res_2norm,LineWidth=2);
title('Norma residua','FontSize',14);
xlabel('iterace');

subplot(222);
plot(0:niter,v(1,:),'.-',MarkerSize=20,LineWidth=2);
hold on
plot(0:niter,v(2,:),'.-',MarkerSize=20,LineWidth=2);
hold on
plot(0:niter,v(3,:),'.-',MarkerSize=20,LineWidth=2);
hold on
plot(0:niter,v(4,:),'.-',MarkerSize=20,LineWidth=2);
hold on
title('Aproximace vlastniho vektoru','FontSize',14);
xlabel('iterace');
ylabel('slozky vektoru','FontSize',14);
legend('1','2','3','4');
