% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% zvol vetsi ulohu

n = 1000;

A = rand(n,n); 
x = rand(n,1);

[V,H] = Arnoldicgs(A,x,n); 

% Ukol: vykresli ||I - V_k'*V_k|| pro k=1,2, ...,1000 a sleduj ztratu OG v ArnoldiCGS

% reseni:

Acgs_ztrataog =      % inicializace
for i = 1:n,
    Acgs_ztrataog(i)  =   % dopln 
end;

semilogy(Acgs_ztrataog,'*') 