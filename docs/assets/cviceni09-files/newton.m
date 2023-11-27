function [x,iter]=newton(f,fp,x0,eps,sol)
% Newton's metod for finding solution of f=0;
% Input parameters: function f, function fp must be the derivative of f
% x0 is the initial estimate, eps is tolerance parameter

maxIter = 100; 
maxval = 1e100000; % define value for divergence
x=x0;
conv = abs(x0-sol);

iter=0;
while (iter<maxIter)
    
    xn = x-f(x)/fp(x) % one step of Newtons method
    iter=iter+1;
    conv = [conv,abs(xn-sol)]; % store intermediate results
    
    if abs(f(xn))<eps %% end iterations if the function value is small
        x=xn;
        break;
    end
    if abs(f(x))>maxval %% end iterations if the function value is huge
        disp('Solution diverges');
        break;
    end
    x = xn;
      
end

x=xn;
%% Convergence visualization
disp(['iterations = ',num2str(iter)]);
semilogy([0:iter],conv,"*-");
end