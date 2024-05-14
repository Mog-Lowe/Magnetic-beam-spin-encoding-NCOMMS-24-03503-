function prob=circ2dN(X,Y,x0,y0,rad,width);

prob=ones(size(X,1),size(X,2));
r=sqrt((X-x0).^2+(Y-y0).^2);
prob(r<(rad-width))=0;
prob(r>(rad+width))=0;

%prob(r<(rad-width)||r>(rad-width))=1;
%prefactor=1/(sqrt(2*pi)*(sigma/2));

%prob=prefactor*exp(-1*((X-x0).^2+(Y-y0).^2)/(1.2011*(sigma/2)).^2);
%prob=prob/max(max(prob));
%prob=prob/max(prob);