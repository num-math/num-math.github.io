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

spy(H);                                  % nejsou
surf(H);                                 % sleduj velikost prvku ... je mala

H1 = H(1:9,:);                           % zahozeni posledniho radku H
norm(H1-H1')                             % odchylka H1 od symetrie ... je mala      

% konstrukce baze K_10(A, x) Lanc. tridiagonalizaci

help lanc                                % porovnej kod s Arnoldim

[V,T] = lanc(A,x,10);                    % ztrata OG v matici V                                         
[V,T] = lanc(A,x,100);                   % OG zcela ztracena


%% Ukol: vykresli ||I - V_k'*V_k|| pro k=1,2, ... a sleduj ztratu OG v lanc  

% reseni:

[V2,H] = Arnoldimgs(A,x,100);

lanc_ztrataog = zeros(1,100);
Amgs_ztrataog = zeros(1,100);
for i = 1:100,
    lanc_ztrataog(i)  = norm(eye(i)-V(:,1:i)'*V(:,1:i));
    Amgs_ztrataog(i)  = norm(eye(i)-V2(:,1:i)'*V2(:,1:i));
end;

figure(1)
semilogy(lanc_ztrataog,'r-'), hold on;
semilogy(Amgs_ztrataog,'b-.'), hold off;
 
legend('Lanczos', 'Arnoldi');

%% konec ukolu


% zkus vice nez N kroku 

[V,T] = lanc(A,x,150);                   % algoritmus stale pocita
surf(T)                                  % poddiagonalni prvky se ani
                                         % neblizi nule


