function prob=gaussian2d(X,Y,x0,y0,sigma);
prefactor=1/(sqrt(2*pi)*(sigma/2));

prob=prefactor*exp(-1*((X-x0).^2+(Y-y0).^2)/(1.2011*(sigma/2)).^2);
prob=prob/max(max(prob));
%prob=prob/max(prob);