%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vypocet baze Krylovova prostoru
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = rand(100,100);          % data rozumnych vlastnosti
x = rand(100,1);

help gallery                % matice 'krylov' = Krylovova posloupnost

A3 = gallery('krylov',A,x,10);

cond(A3)                    % spatne podminena matice
rank(A3)                    % velmi mala numericka hodnost ->
                            % -> co to znamena ?
 
help rank                   % pocet sing. cisel matice vetsich nez tolerance

s = svd(A3);
semilogy(s,'*')             % sing. cisla nejsou sama o sobe mala, ale 
                            % dochazi k jejich prudkemu radovemu poklesu
                            % -> numericky se blizi linearni zavislosti   

%cgs(A3);                    % pozoruj ztratu OG i presnost rozkladu
%mgs(A3); 
%icgs(A3,2);                   

%Arnoldicgs(A,x,10);         
%Arnoldimgs(A,x,10);