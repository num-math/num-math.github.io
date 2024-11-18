function vlastnost_qr_rozkladu(A,Q,R,comment)

[~,n] = size(Q);

% ztrata ortogonality
m1 = Q'*Q-eye(n);
% (ne)splneni rozkladu
m2 = A-Q*R;

a = norm(m1,2);
b = norm(m1,'fro');
e = norm(m2,2);
f = norm(m2,'fro');

fprintf('ROZKLAD POMOCI %s: \n', comment);
fprintf('|Q^TQ-I|_2 = %e,   |Q^TQ-I|_F = %e\n',a,b);
fprintf('|A-QR|_2   = %e,   |A-QR|_F   = %e\n',e,f);
fprintf('\n');
