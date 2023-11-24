function [V,H] = Arnoldimgs(A,s,m)

V(:,1) = s/norm(s);
for i = 1:m-1
    z = A*V(:,i);
    for j = 1:i,
        H(j,i) = V(:,j)'*z;            
        z = z - V(:,j) * H(j,i);
    end
    H(i+1,i) = norm(z);
    V(:,i+1) = z/H(i+1,i);
end

% part of plotqr

m1 = V'*V-eye(m);
m3 = A*V(:,1:m-1)-V*H(:,1:m-1);

a = norm(m1,2);
b = norm(m1,'fro');
e = norm(m3,2);
f = norm(m3,'fro');

fprintf('\n');
fprintf('|V^TV-I|_2 = %e,   |V^TV-I|_F = %e\n',a,b);
fprintf('|AV-VH|_2   = %e,   |AV-VH|_F = %e\n',e,f);
fprintf('\n');

subplot(1,2,1), spy(V), title(sprintf('%s: matrix V','ArnoldiMGS'));
subplot(1,2,2), spy(H), title(sprintf('%s: matrix H','ArnoldiMGS'));
pause;
subplot(1,1,1), surf(m1), title(sprintf('%s: V^TV-I','ArnoldiMGS'));
pause;