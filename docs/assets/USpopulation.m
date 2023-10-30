% populace v minulosti
t = (1790:10:1990)';
y = 100000*[39,53,72,96,129,171,231,314,386,502,629,760,920,1057,1228,1317,1507,1790,2050,2265,2487]';
n = length(t);

% vypočtení pravé strany b
b = log(y);

% definice matice A (prvni sloupec odpovida parametru r, druhy log(x_0))
A = [t, ones(n,1)];


% řešení pomocí QR rozkladu

        % sem napište své řešení problému LS pomocí QR rozkladu, vysledek
        % uložte do vektoru x_ls

% vypočtení x_0
x0 = exp(x_ls(2));
r = x_ls(1);

% vypočtení hodnot funkce x0*exp(r*t)
y_ls = x0*exp(r*t);

figure;
plot(t,y,'*-');
hold on;
plot(t,y_ls,'o-');
legend('skutecna data', 'LS aproximace' )


% populace v roce 2020
y2020_skutecnost = 331.5e6;
y2020_LS = "ZDE DOPLNTE VZOREC";
