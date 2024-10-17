close all;
clear;

volba_ulohy = 1;

switch volba_ulohy
    
    case 1
        % ostre diagonalne dominantni matice
        n = 10;
        A = n*diag(ones(n,1)) + 1/n*(rand(n));
        b = ones(n,1);
        x0 = zeros(n,1);
        x_ex = A\b;
        niter = 15;
        
    case 2
        n = 3;
        A = [1 2 -2 ;1 1 1; 2 2 1];
        x_ex = ones(3,1);
        b = A*x_ex;
        x0 = randn(3,1);
        niter = 6;
        
    case 3
        n = 3;
        A = [3 2 2; 2 3 2; 2 3 3];
        x_ex = ones(3,1);
        b = A*x_ex;
        x0 = randn(3,1);
        niter = 30;
        
    case 4
        B = rand(100);
        A = B'*B + 3*eye(100);
        n = size(A,1);
        x_ex = ones(n,1);
        b = A*x_ex;
        x0 = randn(n,1);
        niter = 20;
        
    otherwise
        A = [1 (1e-1)/4; 2e1 1];
        x_ex = [100;0];
        b = A*x_ex;
        x0 = [0 ; 1];
        n = 2;
        niter = 30;
        
end

% vlastni vypocet

[jac_err_2norm,jac_err_1norm,jac_err_Infnorm] = jacobi_errors(A,b,x_ex,x0,niter);
[gs_err_2norm,gs_err_1norm,gs_err_Infnorm] = gs_errors(A,b,x_ex,x0,niter);

% vypocet maticovych norem a spektralniho polomeru
T_jac = eye(n) - (diag(diag(A)))\A;
T_jac_2norm = norm(T_jac);
T_jac_1norm = norm(T_jac,1);
T_jac_Infnorm = norm(T_jac,Inf);
T_jac_sp = max(abs(eig(T_jac)));

T_gs = eye(n) - tril(A)\A;
T_gs_2norm = norm(T_gs);
T_gs_1norm = norm(T_gs,1);
T_gs_Infnorm = norm(T_gs,Inf);
T_gs_sp = max(abs(eig(T_gs)));

% vykresleni
figure(1)
display(['Spektralni polomer it. matice Jacobiho metody:        \rho(I-D^{-1}A) =  ' num2str(T_jac_sp) newline])
display(['Spektralni polomer it. matice Gauss-Seidelovy metody: \rho(I - (D-L)^{-1}A) =  ' num2str(T_gs_sp) newline])

subplot(311)
semilogy(0:length(jac_err_2norm)-1,jac_err_2norm,'DisplayName','Jacobi')
grid on
hold on
semilogy(0:length(gs_err_2norm)-1,gs_err_2norm,'DisplayName','GS')
my_title = ['1norm, $\|I - D^{-1}A\|_1 = $ ',num2str(T_jac_1norm),'; $\|I - (D-L)^{-1}A\|_1 = $ ',num2str(T_gs_1norm)];
title(my_title,'Interpreter','latex')
legend()

subplot(312)
semilogy(0:length(jac_err_1norm)-1,jac_err_1norm,'DisplayName','Jacobi')
grid on
hold on
semilogy(0:length(gs_err_1norm)-1,gs_err_1norm,'DisplayName','GS')
legend()
my_title = ['2norm, $\|I - D^{-1}A\|_2 = $ ',num2str(T_jac_2norm),'; $\|I - (D-L)^{-1}A\|_2 = $ ',num2str(T_gs_2norm)];
title(my_title,'Interpreter','latex');

subplot(313)
semilogy(0:length(jac_err_Infnorm)-1,jac_err_Infnorm,'DisplayName','Jacobi')
grid on
hold on
semilogy(0:length(gs_err_Infnorm)-1,gs_err_Infnorm,'DisplayName','GS')
legend()
my_title = ['Inf norm, $\|I - D^{-1}A\|_{\infty} = $ ',num2str(T_jac_Infnorm),'; $\|I - (D-L)^{-1}A\|_{\infty} = $ ',num2str(T_gs_Infnorm)];
title(my_title,'Interpreter','latex');
