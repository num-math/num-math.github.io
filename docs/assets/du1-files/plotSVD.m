function plotSVD(A,U,S,V)
% plotSVD(A,U,S,V)

[n,m] = size(U);
m1 = U'*U-eye(m);
m2 = U*U'-eye(n);

[n,m] = size(V);
n1 = V'*V-eye(m);
n2 = V*V'-eye(n);

m3 = A-U*S*V';

a = norm(m1,2);
b = norm(m1,'fro');
c = norm(m2,2);
d = norm(m2,'fro');

g = norm(n1,2);
h = norm(n1,'fro');
i = norm(n2,2);
j = norm(n2,'fro');

e = norm(m3,2);
f = norm(m3,'fro');

fprintf('\n');
fprintf('|U^TU-I|_2 = %e,   |U^TU-I|_F = %e\n',a,b);
fprintf('|UU^T-I|_2 = %e,   |UU^T-I|_F = %e\n',c,d);
fprintf('|V^TV-I|_2 = %e,   |V^TV-I|_F = %e\n',g,h);
fprintf('|VV^T-I|_2 = %e,   |VV^T-I|_F = %e\n',i,j);
fprintf('|A-USV^T|_2= %e,   |A-USV^T|_F= %e\n',e,f);
fprintf('\n');

subplot(1,3,1), spy(U), title(sprintf('Matrix U'));
subplot(1,3,2), spy(S), title(sprintf('Matrix S'));
subplot(1,3,3), spy(V'), title(sprintf('Matrix V^T'));
pause;
