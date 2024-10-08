%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Komprese digitalniho obrazu pomoci SVD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = double(imread('sipka.bmp'));             % nacti vybrany obrazek jako matici


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zde doplňtě výpočet SVD a uložení singulárních čísel

                                             % singularni rozklad A
                                             % singularni cisla A

                                             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


k = 300;                                     % k = # pouzitych komponent sing. rozkladu

X = zeros(size(A));
for i=1:k
    X = X + U(:,i)*S(i,i)*V(:,i)';           % konstrukce dat
end

figure(1)
imagesc(X)                  % vykresleni
axis image
colormap(gray)
title(sprintf('obrazek po SVD kompresi \n pouzito %d z %d sing. cisel',k,length(s)));

n_doubles = (size(U,1)+size(V,1)+1)*k;       % vypocet velikosti komprimovaneho obrazku
n_kbytes = n_doubles*8/1024;
fprintf('Pro ulozeni obrazku je pouzito %d [doubles] = %1.2f [kB]',n_doubles,n_kbytes)

figure(2)
semilogy(1:k,s(1:k),'.r',k+1:length(s),s(k+1:length(s)),'.k')
title('singularni cisla')