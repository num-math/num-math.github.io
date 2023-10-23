function [Q,R] = cgs(A)
% funkce vraci ekonomicky tvar QR rozkladu
% vypocet pomoci klasickeho Gram-Schmidtova algoritmu

[n,m] = size(A);
Q = zeros(n,min(m,n));
R = zeros(min(m,n),m);

for i = 1:m,
    z = A(:,i);                 % budeme ortogonalizovat i-ty sloupec matice
    for j = 1:min(n,i-1),
        R(j,i) = Q(:,j)'*z;     % vypocet OG koeficientu
    end;
    for j = 1:min(n,i-1),
        z = z-Q(:,j)*R(j,i);    % odecteni OG projekci
    end;
    if i<=n,
        R(i,i) = norm(z);
        Q(:,i) = z/R(i,i);
    end;
end;

