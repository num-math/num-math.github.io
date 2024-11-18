function [Q,R] = icgs(A,cnt)

if nargin == 1
    cnt = 2;
end

[m,n] = size(A);
Q = zeros(m,min(m,n));
r = zeros(min(m,n),n);
R = zeros(min(m,n),n);

for i = 1:n
    z = A(:,i);
    for k = 1:cnt
        for j = 1:min(m,i-1)
            r(j,i) = Q(:,j)'*z;
        end
        for j = 1:min(m,i-1)
            z = z-Q(:,j)*r(j,i);
            R(j,i) = R(j,i)+r(j,i);
        end
    end
    if i<=m
        R(i,i) = norm(z);
        Q(:,i) = z/R(i,i);
    end
end

