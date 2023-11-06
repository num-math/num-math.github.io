function [mu,v,res_2norm] = power_method(A,v0,niter)

mu = zeros(niter+1,1);         % posloupnost approximaci nejvetsiho vl. cisla
v = zeros(length(v0),niter+1); % posloupnost approximaci prislusneho vlastniho vektoru
res_2norm = zeros(niter+1,1);  % normy residua || Av_k - mu_kv_k ||

v0 = v0/norm(v0);
w = A*v0;
v(:,1) = w/norm(w);
mu(1) = v(:,1)'*A*v(:,1);
res_2norm(1) = norm(A*v(:,1)-mu(1)*v(:,1));

for k = 2:niter+1
    w = 		% A*v_{k-1}
    v(:,k) =	% normalizace vektoru w
    mu(k) = 	% Rayleighuv podil 		
    res_2norm(k) = norm(A*v(:,k)-mu(k)*v(:,k));
end
end