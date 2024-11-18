function vlastnost_Arnoldi(A,V,H,comment)

[~,n] = size(V);

% ztrata ortogonality
m1 = V'*V-eye(n);
% (ne)splneni rozkladu
m2 = A*V(:,1:n-1)-V*H(:,1:n-1);

a = norm(m1,2);
b = norm(m1,'fro');
e = norm(m2,2);
f = norm(m2,'fro');

fprintf('ROZKLAD POMOCI %s: \n', comment);
fprintf('|Q^TQ-I|_2 = %e,   |Q^TQ-I|_F = %e\n',a,b);
fprintf('|AV-VH|_2   = %e,   |AV-VH|_F   = %e\n',e,f);
fprintf('\n');
