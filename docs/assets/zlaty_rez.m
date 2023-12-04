function [x,fx] = zlaty_rez(f,a,b,iter)
% ZLATY_REZ implementace metody zlateho rezu pro hledani lokalniho minima
% spojite funkce f na intervalu [a,b]
%
% Vstupy:
% f - spojita funkce
% a,b - krajni body intervalu
% iter - pocet iteraci
%
% Vystupy:
% x - appoximace argumentu minima f
% fx - f(x)

rho = (3-sqrt(5))/2;
u = a+rho*(b-a);
v = b-rho*(b-a);
fu = f(u);
fv = f(v);

for i = 1:iter
    if (fu<fv)
       % doplnte definici bodu a vypocet funkcnich hodnot
        
    else 
        % doplnte definici bodu a vypočet funkcnich hodnot

    end
end

points = [u,v];
[fx,i] = min([fu, fv]);
x = points(i);

end

