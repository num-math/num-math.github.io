function [x,iter]=newton_convergence(f,fp,x0,eps)
% newton-raphson algorithm
N = 100; %eps = 1.e-6; % define max. no. iterations and error
maxval = 1e100000; % define value for divergence
xx = x0;
it = x0;
range = 1;
xval = linspace(x0-range,x0+range,1001);
subplot(121);
plot(xval, f(xval))
hold on
plot(x0,f(x0),'x')
hold off
subplot(122);
plot(xval, f(xval))
hold on
plot(x0,f(x0),'x')
hold off
pause
while (N>0)
    N = N - 1;
    xn = xx-f(xx)/fp(xx);
    it = [it, xn];
    range = abs(xn-xx);
    xval = linspace(min(xn,xx)-range, max(xn,xx)+range,1001);
    subplot(121);
    plot([xx,xn],[f(xx),0],'r-')
    hold on
    plot([xx,xn],[f(xx),f(xn)],'rx')
    plot([xn,xn],[0,f(xn)],'r:')
    plot([min(xn,xx)-range, max(xn,xx)+range],[0,0],'k:')
    plot(xval, f(xval))
    hold off
    axis([min(xn,xx)-range, max(xn,xx)+range, min([f(xn),f(xx),0])-range, max([f(xn),f(xx),0])+range])
    subplot(122);
    xval = linspace(min(it)-1,max(it)+1,1001);
    plot(xval,f(xval))
    hold on
    plot(it,f(it),'rx-')
    hold off
    axis([min(it)-1, max(it)+1, min([f(it),0])-1, max([f(it),0])+1]);
    pause
if abs(f(xn))<eps
    x=xn;iter=100-N;
    hold off
    return;
end;
if abs(f(xx))>maxval
    iter=100-N;
    disp(['iterations = ',num2str(iter)]);
    error('Solution diverges');
    break;
end;
 xx = xn;
end;
error('No convergence');
hold off

