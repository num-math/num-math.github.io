function [V,T] = lanc(A,v,m)
%function [V,T] = lanc(A,v,m)

[n,n] = size(A);
V = zeros(n,m);
T = zeros(m,m-1);

V(:,1) = v/norm(v);

for i = 1:m-1,
    
    if (i == 1), 
       w = A*V(:,i); 
    else     
       w = A*V(:,i) - T(i,i-1)*V(:,i-1);
    end;
    
	T(i,i)= w'*V(:,i);
	w = w - T(i,i)*V(:,i);
    
    T(i+1,i) = norm(w);
    T(i,i+1)=T(i+1,i);                 % pouze pro testovani doplnime symetricky
    
	V(:,i+1) = w / T(i+1,i);
end;

% part of plotqr

m1 = V'*V-eye(m);
m3=A*V(:,1:m-1)-V*T(:,1:m-1);

a = norm(m1,2);
b = norm(m1,'fro');
e = norm(m3,2);
f = norm(m3,'fro');

fprintf('\n');
fprintf('|V^TV-I|_2 = %e,   |V^TV-I|_F = %e\n',a,b);
fprintf('|AV-VH|_2   = %e,   |AV-VH|_F = %e\n',e,f);
fprintf('\n');

%subplot(1,2,1), spy(V), title(sprintf('%s: matrix V','Lanczos'));
%subplot(1,2,2), spy(T), title(sprintf('%s: matrix H','Lanczos'));
%pause;
%subplot(1,1,1), surf(m1), title(sprintf('%s: V^TV-I','Lanczos'));
%pause;
