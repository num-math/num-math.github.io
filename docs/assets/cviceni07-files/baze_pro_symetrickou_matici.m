%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Konstrukce baze Krylovova prostoru pro A symetrickou: 
%        Arnoldiho proces, Lanczosova tridiagonalizace
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = rand(100);
A = A + A';                              % generator symetricke matice
norm(A-A')                               % overeni symetrie 

x = rand(100,1);                         % startovni vektor

% Konstrukce báze K_10(A, x) Arnoldiho procesem

[V,H] = Arnoldimgs(A,x,10);              % OG dobre zachovana

% Jsou koeficienty v pravém horním rohu H nulové?
% Vytvoøte z H ètvercovou matici a ovìøte její symetrii pomocí normy
