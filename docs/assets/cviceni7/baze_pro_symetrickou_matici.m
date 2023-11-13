%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Konstrukce baze Krylovova prostoru pro A symetrickou: 
%        Arnoldiho proces, Lanczosova tridiagonalizace
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = rand(100);
A = A + A';                              % generator symetricke matice
norm(A-A')                               % overeni symetrie 

x = rand(100,1);                         % startovni vektor

% konstrukce baze K_10(A, x) Arnoldiho procesem

[V,H] = Arnoldimgs(A,x,10);              % OG dobre zachovana

% jsou koeficienty v pravem hornim rohu H nulove?

spy(H)                                 % nejsou
pause;
surf(H)                                % sleduj velikost prvku ... je mala
pause;

H1 = H(1:9,:);                           % zahozeni posledniho radku H
norm(H1-H1')                             % odchylka H1 od symetrie ... je mala 
pause;

% konstrukce baze K_10(A, x) Lanc. tridiagonalizaci

help lanc                                % porovnej kod s Arnoldim

[V,T] = lanc(A,x,10);                    % ztrata OG v matici V   
pause;
[V,T] = lanc(A,x,100);                   % OG zcela ztracena  