%% testovani inverse iteration na 6. cviceni ZNM, 2023/24

%% priklad 1

A = diag(2:21);
v = rand(size(A,2),1);

mu = 0;
niter = 20;

[lambda, v, history] = inverse_iteration(A,v,mu,niter);

% vypsani spoctene aproximace a rezidua
disp(lambda)
disp(norm(A*v-lambda*v))

% vykresleni konvergence
figure(1)
plot(history)

% misto konvergence muze byt vhodnejsi vykreslit chybu mezi aproximaci a
% ocekavanou hodnotou (idealne v logaritmicke skale)
figure(2)
semilogy(abs(history-2))


%% priklad 2

A = diag(-20:21);
v = rand(size(A,2),1);

mu = 1.1;
niter = 20;

[lambda, v, history] = inverse_iteration(A,v,mu,niter);

disp(lambda)
disp(norm(A*v-lambda*v))

figure(3)
plot(history)


%% priklad 3

A = diag(-20:21);
v = rand(size(A,2),1);

mu = 10.5;
niter = 20;

% pred spustenim rozmyslete, kam by mela lambda konvergovat; vyzkousejte
% spustit funkci nekolikrat

[lambda, v, history] = inverse_iteration(A,v,mu,niter);

disp(lambda)
disp(norm(A*v-lambda*v))

figure(4)
plot(history)

