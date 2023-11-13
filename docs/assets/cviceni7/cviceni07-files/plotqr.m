function plotqr(A,Q,R,comment)

[m,n] = size(A);

m1 = Q'*Q-eye(min(m,n))
m2 = Q*Q'-eye(m);
m3 = A-Q*R;

a = norm(m1,2);
b = norm(m1,'fro');
c = norm(m2,2);
d = norm(m2,'fro');
e = norm(m3,2);
f = norm(m3,'fro');

fprintf('\n');
fprintf('|Q^TQ-I|_2 = %e,   |Q^TQ-I|_F = %e\n',a,b);
%fprintf('|QQ^T-I|_2 = %e,   |QQ^T-I|_F = %e\n',c,d);
fprintf('|A-QR|_2   = %e,   |A-QR|_F   = %e\n',e,f);
fprintf('\n');

subplot(1,2,1), spy(Q), title(sprintf('%s: matrix Q',comment));
subplot(1,2,2), spy(R), title(sprintf('%s: matrix R',comment));
pause;
subplot(1,1,1), surf(m1), title(sprintf('%s: Q^TQ-I',comment));
pause;
%subplot(1,1,1), surf(m2), title(sprintf('%s: QQ^T-I',comment));
%pause;
subplot(1,1,1), surf(m3), title(sprintf('%s: A-QR',comment));
pause;
