%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Komprese digitalniho obrazu pomoci SVD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = double(imread('sipka.bmp'));              % nacti obrazek jako matici

[U,S,V] = svd(A);                            % singularni rozklad A
s = diag(S);                                 % singularni cisla A

for k = [500,400,300,200,100,70,40,20,10,5], % k = # pouzitych komponent sing. rozkladu
    
    X = zeros(size(A));
    for i=1:k,
        X = X + U(:,i)*S(i,i)*V(:,i)';       % konstrukce dat
    end;
    
    subplot(1,2,1), imagesc(X),              % vykresleni
    axis image, colormap(gray), 
    title(sprintf('SVD compressed image\n used %d of %d singular values',k,length(s)));
    
    n_doubles = (size(U,1)+size(V,1)+1)*k;
    n_kbytes = n_doubles*8/1024; 
    subplot(1,2,2), semilogy(1:k,s(1:k),'.r',k+1:length(s),s(k+1:length(s)),'.k'), 
    axis([0,length(s),s(length(s)),s(1)]), axis square, 
    title(sprintf('signular values\n economic SVD: %d [doubles] = %1.2f [kB]',n_doubles,n_kbytes)),
%    legend('used','unused',4);
    pause;
    
end;

pause;