%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vypocet baze Krylovova prostoru
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = rand(100,100);          % data rozumnych vlastnosti
x = rand(100,1);

help gallery                % matice 'krylov' = Krylovova posloupnost

A3 = gallery('krylov',A,x,10);

% Pomoci vestavenych funkci spoctete cislo podminenosti a hodnost matice A3

% Jak MATLAB pocita hodnost matice? Najdete v napovede a vykreslete
% sigularni cisla matice A3.


% Pozorujte ztratu OG i presnost rozkladu
[Q,R] = cgs(A3);                    
vlastnost_qr_rozkladu(A3, Q, R, 'cgs');
[Q,R] = mgs(A3); 
vlastnost_qr_rozkladu(A3, Q, R, 'mgs');
[Q,R] = icgs(A3,2);                 
vlastnost_qr_rozkladu(A3, Q, R, 'icgs');
% icgs neboli iterovany klasicky GS je ztratou ortogonality srovnatelny s
% Givensovymi rotacemi a Householderovymi reflexemi

% Totez jako pro Gram-Schmidta nyni pro Arnoldiho algoritmus
[V,H] = Arnoldicgs(A,x,10);
vlastnost_Arnoldi(A, V, H, 'Arnoldi cgs');
[V,H] = Arnoldimgs(A,x,10);
vlastnost_Arnoldi(A, V, H, 'Arnoldi mgs');