% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vypocet baze Krylovova prostoru II - pro vetsi matici
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = 1000;

A = rand(n,n); 
x = rand(n,1);

[V,H] = Arnoldicgs(A,x,n); 

% Úkol: vykresli ||I - V_k'*V_k|| pro k=1,2, ...,1000 a sleduj ztratu OG v ArnoldiCGS

Acgs_ztrataog = zeros(1,n);     % inicializace
for i = 1:n
    Acgs_ztrataog(i)  =   % doplò 
end

semilogy(Acgs_ztrataog,'*') 