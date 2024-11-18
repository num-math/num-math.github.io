function [V,H] = Arnoldicgs(A,s,m)

V = zeros(length(s),m);
H = zeros(m, m-1);

V(:,1) = s/norm(s);
for i = 1:m-1
     z = A*V(:,i);
     for j = 1:i
         H(j,i) = V(:,j)'*z;
     end
     for j = 1:i
         z = z - V(:,j) * H(j,i);
     end
     H(i+1,i) = norm(z);
     V(:,i+1) = z/H(i+1,i);
end
