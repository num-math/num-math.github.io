function [Q,R] = givens(A)
% funkce vraci ekonomicky tvar QR rozkladu
% vypocet pomoci Givensovych rotaci

% funkce vyuziva vestavenou Matlabovskou funkci
% planerot: vstup je vektor (2x1) a vraci matici 2x2 Givensovy rotace jez
%           nuluje druhou slozku vektoru
  [m,n] = size(A);
  Q = eye(m);
  R = A;

  for j = 1:n
    for i = m:-1:(j+1)
      % primocara, ale vypocetne neefektivni implementace
      %G = eye(m);
      %G([i-1, i],[i-1, i]) = planerot([R(i-1,j); R(i,j)]);
      %R = G*R;
      %Q = Q*G';
      
      % efektivnejsi implementace, vyuzije se struktura matice Givensovy rotace
      % a prepocitavaji se pouze radky a sloupce, ktere se skutecne meni
      rot = planerot([R(i-1,j); R(i,j)]);   % vypocet elem. Givensovy rotace
      R([i-1,i],:) = rot*R([i-1,i],:);      % aplikace na sloupce - vynuluje prvek na pozici [i,j]
      Q(:,[i-1,i]) = Q(:,[i-1,i])*rot';     % slozeni s predchozimi Giv. rotacemi
      
      
    end
  end
% chceme mit jako vystup ekomociky tvar QR rozkladu
R = R(1:min(m,n),1:n);
Q = Q(:,1:min(m,n));
 
end
