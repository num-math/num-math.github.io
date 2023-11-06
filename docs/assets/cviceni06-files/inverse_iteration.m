function [lambda, v, history] = inverse_iteration(A,v,mu,niter)

% funkce provadejici inverzni iterace v_k+1 = inv(A - mu*I)*v_k/norm(-"-)
%
% vstup: matice A, pocatecni vektor v, "shift" mu, pocet iterace niter
% vystup: aproximace vlastniho cisla a vektoru, historie aproximaci
% vlastniho cisla
%





lambda = history(end);