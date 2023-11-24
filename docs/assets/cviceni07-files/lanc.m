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
