%zadani
n = 25;
x = linspace(0,5,n)'; %hodnoty x_1
f = 3*sin(4*x) + 4*x - exp(0.6*x); %hodnoty f(x_i)
k = 5;
%zde napiste reseni
A =  fliplr(vander(x)); A = A(:,1:k+1);
c = A\f;
plot(x,f,'rx'), hold on,
plot(x,A*c,'g-'), hold off

cond(A)
norm(A.'*(A*c-f))
norm(A*c-f)
dot(A*c,A*c-f)
