function [p,iter]=bisection(f,a,b,tol,sol)
% Bisection method - finds solution to f=0 over the interval [a,b]
% Input parameters- f is the function, a,b represent the interval of search
% parameter tol is the desired tolerance (accuracy), 
% sol is the exact solution 

if f(a)*f(b)>=0 %% Check input correctness
  disp('Špatná volba poèáteèního intervalu: f(a)*f(b)>=0');
return;  
end

interval=(b-a);

iter=0;
values = [];
p=(a+b)/2;
 
while (p-a)>tol

 values = [values,[p;a;b]];% store results for further visualization
 
 if f(a)*f(p)>0
    a=p;
 else
    b=p;
 end
 
 p=(a+b)/2;
 iter=iter+1;
 
end %while 

% Result and convergence visualization
subplot(121)
semilogy([1:iter],interval*(0.5*ones(1,iter)).^[1:iter],'k:');
hold on
semilogy([1:iter],abs(values(1,:)-sol*ones(1,iter)),'r*-');
hold off
legend('polovina délky intervalu = maximální chyba','|x_n - sol|')
subplot(122)
plot([1:iter],sol*ones(1,iter),'k-')
hold on
plot([1:iter],values(2,:),'r-')
plot([1:iter],values(3,:),'b-')
hold off
legend('øešení','a','b')

drawnow
jFig = get(handle(gcf), 'JavaFrame'); 
jFig.setMaximized(true);

end
