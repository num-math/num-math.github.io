x=linspace(-5,5,200);
plot(x,1.2+2*x.^2 - x -exp(-x),x,0*x,'LineWidth',3);
axis([-5,5,-5,5]);set(gca, 'FontSize', 16);