function [Q,R] = mgs(A)

[m,n] = size(A);
Q = zeros(m,min(m,n));
R = zeros(min(m,n),n);

for i = 1:n
    z = A(:,i);
    for j = 1:min(m,i-1)
        R(j,i) = Q(:,j)'*z;

        
        z = z-Q(:,j)*R(j,i);
    end
    if i<=m
        R(i,i) = norm(z);
        Q(:,i) = z/R(i,i);
    end
end
