% porovnání iterpolace Lagrange rovnomerne deleni, Lagrange Chebyshevovy
% body, kubicky spline

close all; clear all;

% interpolovana funkce
 f = @(x) sin(3*x); 
% f = @(x) abs(x); 
%f = @(x) sign(x);

a = -1;
b = 1;

n = 5;     % pocet uzlu

vykresliChybuLagrangeRovnomerne = false;
vykresliChybuLagrangeChebyschev = true;
vykresliChybuSpline = true;


bodyVykresleni = linspace(a,b,500);
funkcniHodnotyVykresleni = f(bodyVykresleni);
bodyRovnomerneDeleni = linspace(a,b,n);  
funkcniHodnotyRovnomerneDeleni = f(bodyRovnomerneDeleni);           
bodyChebyshev = cos((2*(0:n-1)+1).*(pi/(2*n)));
funcniHodnotyChebyshev = f(bodyChebyshev);

lagrangeRovnomerneDeleni = lagrange(bodyRovnomerneDeleni,funkcniHodnotyRovnomerneDeleni,bodyVykresleni);
lagrangeChebyshev = lagrange(bodyChebyshev,funcniHodnotyChebyshev,bodyVykresleni);
splineRovnomerneDeleni = spline(bodyRovnomerneDeleni,funkcniHodnotyRovnomerneDeleni,bodyVykresleni);

barvy = lines(6);

figure
subplot(221)
plot(bodyRovnomerneDeleni,funkcniHodnotyRovnomerneDeleni,LineStyle="none",Marker="x",MarkerSize=10,Color="red"); 
hold on
plot(bodyVykresleni,funkcniHodnotyVykresleni,LineStyle="--",LineWidth=2,Color=barvy(1,:)); 
hold on
plot(bodyVykresleni,lagrangeRovnomerneDeleni,LineWidth=2,Color=barvy(2,:));
title(sprintf('Lagrangeova interpolace, rovnomerne deleni s %i uzly', n))


subplot(222)
plot(bodyChebyshev, funcniHodnotyChebyshev,LineStyle="none",Marker="x",MarkerSize=10,Color="red"); 
hold on
plot(bodyVykresleni,funkcniHodnotyVykresleni,LineStyle="--",LineWidth=2,Color=barvy(1,:)); 
hold on
plot(bodyVykresleni,lagrangeChebyshev,LineWidth=2,Color=barvy(3,:));
title(sprintf('Lagrangeova interpolace v  %i  Chebyschevovych bodech', n))



subplot(223)
plot(bodyRovnomerneDeleni,funkcniHodnotyRovnomerneDeleni,LineStyle="none",Marker="x",MarkerSize=10,Color="red"); 
hold on
plot(bodyVykresleni,funkcniHodnotyVykresleni,LineStyle="--",LineWidth=2,Color=barvy(1,:)); 
hold on
plot(bodyVykresleni,splineRovnomerneDeleni,LineWidth=2,Color=barvy(4,:)); % vykresleni interpolacniho splinu
title(sprintf('Interpolace kubickym splinem, rovnomerne deleni s %i uzly', n))


subplot(224);
if (vykresliChybuLagrangeRovnomerne)
    plot(bodyVykresleni, lagrangeRovnomerneDeleni - funkcniHodnotyVykresleni,LineWidth=2,Color=barvy(2,:),LineStyle="-",DisplayName='Lagrange (rovn.)');
    hold on
end
if (vykresliChybuLagrangeChebyschev)
    plot(bodyVykresleni, lagrangeChebyshev - funkcniHodnotyVykresleni,LineWidth=2,Color=barvy(3,:),LineStyle="--",DisplayName='Lagrange (Cheb.)');
    hold on
end
if(vykresliChybuSpline)
    plot(bodyVykresleni,splineRovnomerneDeleni - funkcniHodnotyVykresleni,LineWidth=2,Color=barvy(4,:),LineStyle=":",DisplayName='spline (rovn.)');
end
title('Chyby jednotlivych interpolaci')
legend();

