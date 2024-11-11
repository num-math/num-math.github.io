function [mu,v,res_2norm] = power_method(A,v0,niter)

mu = nan(niter+1,1);         % posloupnost approximaci nejvetsiho vl. cisla
v = nan(length(v0),niter+1); % posloupnost approximaci prislusneho vlastniho vektoru
res_2norm = nan(niter+1,1);  % normy residua || Av_k - mu_kv_k ||

%%% prvni ulozena data odpovidaji hodnotam pocatecniho vektoru
v(:,1) = v0/norm(v0);
mu(1) = v(:,1)'*A*v(:,1);
res_2norm(1) = norm(A*v(:,1)-mu(1)*v(:,1));

%%% nasledne postupujeme jako u Algoritmu 1 ze cviceni
for k = 2:niter+1
    w =  		     % A*v_{k-1}
    v(:,k) =	     % normalizace vektoru w
    mu(k) =          % Rayleighuv podil 		
    res_2norm(k) =    norm(A*v(:,k)-mu(k)*v(:,k)); % reziduum
end
end