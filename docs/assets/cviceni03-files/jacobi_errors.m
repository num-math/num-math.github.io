function [err_2norm,err_1norm,err_Infnorm,x] = jacobi_errors(A,b,x_ex,x0,niter)
%% funkce pro vypocet aproximace a chyb Jakobihho metody
% vstup
% A - matice
% b - prava strana
% x0 - pocatecni aproximace
% x_ex - (presne) reseni A*x_ex = b
% x - aproximace reseni x_ex

% vystup
% normy || x-x_j ||_*, kde * je postupnì 2, 1, nekonecno
% vysledna aproximace x_niter

x = x0;

% DOPLNIT STEPENI MATICE


err_2norm = zeros(1, niter+1);
err_1norm = zeros(1, niter+1);
err_Infnorm = zeros(1, niter+1);

% vypocet norem chyby pocatecniho reseni
err_2norm(1) = norm(x_ex-x);
err_1norm(1) = norm(x_ex-x,1);
err_Infnorm(1) = norm(x_ex-x,"inf");

for j = 1:niter
    x = DOPLNIT;
    
    % vypocet norem chyby aproximace x_j
    err_2norm(j+1) = norm(x_ex-x);
    err_1norm(j+1) = norm(x_ex-x,1);
    err_Infnorm(j+1) = norm(x_ex-x,"inf");
end
end