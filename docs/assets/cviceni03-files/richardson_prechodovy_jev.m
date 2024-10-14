%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prechodovy jev Richardsonova metoda
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
niter = 2000;

for k = 1:4
    switch k
        case 1
            A = [0.01, -0.4; 0, 0.01];   % matice
            b = [1; 0.001];              % prava strana
            x0 = [0; 100];               % pocatecni aproximace
        case 2
            A = [0.01, -0.04; 0, 0.01];
            b = [1; 0.001];
            x0 = [0; 100];
        case 3
            A = [0.01, -0.4; 0, 0.01];
            b = [1; 0.1];
            x0 = [0; 100];
        case 4
            A = [0.01, -0.4; 0, 0.01];
            b = [100; 0];
            x0 = [0; 100];
    end
    
    err_norm = zeros(1,niter);
    T_pow_norm = zeros(1,niter+1); T_norm_pow = zeros(1,niter+1); T_sp_pow = zeros(1,niter+1);
    x = x0;  % approximace 
    x_ex = A\b;        % presne reseni
    err_init = norm(x_ex-x);

    T = eye(2) - A;            % iteracni matice T = I-A
    T_norm = norm(T);     % ||I-A||
    T_sp = max(abs(eig(T))); % rho(I-A)
    T_pow_norm(1) = 1;    % ||(I-A)^j||
    T_norm_pow(1) = 1;    % ||I-A||^j
    T_sp_pow(1) = 1;      % \rho(I-A)^j
    T_pow = eye(size(T));   % (I-A)^j

    
    for j = 1:niter
        x = x + (b - A*x) ;            % vypocet apoximace
        err_norm(j) = norm(x_ex - x)/err_init; % relativni norma chyby

        T_pow = T_pow*T;
        T_pow_norm(j+1) = norm(T_pow);  
        T_norm_pow(j+1) = T_norm_pow(j)*T_norm;   
        T_sp_pow(j+1) = T_sp_pow(j)*T_sp;         
    end

    figure(1)
    subplot(2,2,k)
    semilogy(0:length(err_norm)-1,err_norm,'LineWidth',1.5,'DisplayName','$\|x - x_k\|/\|x - x_0\|$')
    hold on
    semilogy(0:length(T_pow_norm)-1,T_pow_norm,'LineWidth',1.5,'DisplayName','$\|(I-A)^k\|$')
    hold on
    semilogy(0:29,T_norm_pow(1:30),'LineWidth',1.5,'DisplayName','$\|I-A\|^k$')
    hold on
    semilogy(T_sp_pow,'LineWidth',1.5,'DisplayName','$(\rho(I-A))^k$')
    hold on
    legend('Interpreter','latex')
    xlim = [0,length(err_norm)];

    set(gca, 'FontSize', 18)
end

