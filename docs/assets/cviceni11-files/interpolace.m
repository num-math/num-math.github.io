clear, clc, close all; % vymazani promennych, vymazani Command window, zavreni obrazku

% interpolovana funkce
 f = @(x) sin(3*x); 
% f = @(x) abs(x); 
% f = @(x) sign(x);

% uvazovaný interval
a = -1;
b = 1;
r = linspace(a,b,100);

k = 5;                     % pocet uzlu
x = (a:((b-a)/(k-1)):b)' ;  % uzly rovnomerneho deleni
y = f(x);                   % hodnoty interpolovane fce v uzlech


%% Lagrangeova interpolace na pravidelnem deleni

lagr_pol = lagrangepoly(x,y);

figure;
subplot(221); hold on;
title(sprintf('Lagrangeova interpolace, rovnomerne deleni s %i uzly', k))

plot(r, f(r), 'k--');% vykresleni interpolovane fce
plot(r,polyval(lagr_pol,r), 'b-', 'LineWidth', 2); % vykresleni Lagr. polynomu
plot(x, y, 'r*');

axis auto;
hold off;


%% Lagrangeova interpolace v Cebysevovych uzlech

% tzv. Cebysevovy uzly - soustredene vice ke krajum intervalu
x_cheb = (cos(pi* (2*(1:k) - 1)/(2*k)))';
y_cheb = f(x_cheb);

lagr_pol_cheb = lagrangepoly(x_cheb,y_cheb);

subplot(222); hold on;
plot(r, f(r), 'k--');     % vykresleni interpolovane fce
plot(r,polyval(lagr_pol_cheb,r), 'b-', 'LineWidth', 2); % vykresleni Lagr. polynomu
plot(x_cheb, y_cheb, 'r*');

title(sprintf('Lagrangeova interpolace v %i Cebysevovych bodech', k))
axis auto;
hold off;


%% Interpolace pomoci kubickeho splinu

spline_pol = spline(x,y); % vestavena fce v MATLABu

subplot(223); hold on; 
plot(r, f(r), 'k--');% vykresleni interpolovane fce
plot(r,ppval(spline_pol,r), 'b-', 'LineWidth', 2); % vykresleni interpolacniho splinu
plot(x, y, 'r*');

title(sprintf('Interpolace kubickym splinem, rovnomerne deleni s %i uzly', k))
axis auto;
hold off;


%% Chyba jednotlivych interpolaci

subplot(224);  hold on;
plot(r,polyval(lagr_pol,r) - f(r), 'r-', 'LineWidth', 2);
plot(r,ppval(spline_pol,r) - f(r), 'b--', 'LineWidth', 2);
plot(r,polyval(lagr_pol_cheb,r) - f(r), 'k-.', 'LineWidth', 2);
title('Chyby jednotlivych interpolaci')

legend('Lagrange (rovn.)', 'spline (rovn.)', 'Lagrange (Cheb.)');
hold off;