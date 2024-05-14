%clear all
%close all
%zoom_factor=2;
%FOV=10/zoom_factor;
%Res=0.5/zoom_factor;
%N=floor((FOV/2)/Res);
%Res=FOV/N/2
%Feature=0.4;

%dx=0.05;
plotmode=0;
reducemean=1;
interpolate0=1;




Kmax=1/(2*Res);
DK=1/FOV;
Nelements=floor(FOV/Res);
if mod(Nelements,2)==1
    Nelements=Nelements-1;
end

%Kvec=-Kmax+(0:(Nelements-1))*DK;
Kvec=-Kmax+(1:(Nelements))*DK;
Kvecx=Kvec; Kvecy=Kvec;
Xscale=(-FOV/2)+(0:(length(Kvecx)-1))*Res;
Yscale=(-FOV/2)+(0:(length(Kvecy)-1))*Res;


x=(-FOV/2):dx:(FOV/2-dx);
y=(-FOV/2):dy:(FOV/2-dy);
%Nx=30*floor(40*rand(length(x),1));
%Nx=0*30*ones(length(Nx),1);
%Nx(15)=Nx(15)+30; %narrow dist
%Nx(10:90)=30;%wide dist
%Nx=10*(gaussian(x,Feature_centre,Feature_width));
[X,Y]=meshgrid(x,y);
%Nx=10*(gaussian(x,Feature_centre,Feature_width)+gaussian(x,Feature_centre+1.5,Feature_width/10)+gaussian(x,Feature_centre-4,Feature_width/5)+gaussian(x,Feature_centre-5,Feature_width/10)+0*1);
if strcmp(imagetype,'narrow')
%Nxy=10*(0.0*gaussian2dN(X,Y,2,2,2.5)+gaussian2dN(X,Y,-1,1.5,0.3)+gaussian2dN(X,Y,-3,-3,0.3));
Nxy=10*(0*0.7*gaussian2dN(X,Y,2,2,3.5)+0.7*circ2dN(X,Y,-2,-2,2.5,0.075)+0.7*gaussian2dN(X,Y,-2,-2,0.3)+0*circ2dN(X,Y,-2.5,2.5,2,0.075));
elseif strcmp(imagetype,'wide')
%Nxy=10*(gaussian2dN(X,Y,1.5,1.5,3.5)+0*gaussian2dN(X,Y,-1,1.5,0.3)+0*gaussian2dN(X,Y,-3,-3,0.3));
Nxy=10*(0.7*gaussian2dN(X,Y,2,2,3.5)+0*circ2dN(X,Y,-2,-2,2.5,0.075)+0*gaussian2dN(X,Y,-2,-2,0.3)+0*circ2dN(X,Y,-2.5,2.5,2,0.075));
elseif strcmp(imagetype,'mixed')
    %Nxy=10*(0.7*gaussian2dN(X,Y,2,2,3.5)+gaussian2dN(X,Y,-2,-2,0.25)+0*gaussian2dN(X,Y,-3,-3,0.3));
    Nxy=10*(0.7*gaussian2dN(X,Y,2,2,3.5)+circ2dN(X,Y,-2,-2,2.5,0.075)+gaussian2dN(X,Y,-2,-2,0.3)+0*circ2dN(X,Y,-2.5,2.5,2,0.075));
end


%xfine=linspace(min(x),max(x),500*length(x));
%Nxfine=interp1(x,Nx,xfine,'Spline');  %smooth
%Nxfine=interp1(x,Nx,xfine); %sharp
%Nxfine=mean(Nx)*Nxfine./Nxfine; %flat
%Nxfine(1,5000)=2*mean(Nxfine);
%dxfine=xfine(2)-xfine(1);
Sig=zeros(length(Kvec),1);
Sig2=zeros(length(Kvec),1);
%Sig=Nxfine-Nxfine; %creating a zeros vector the right size
for index1=1:length(Kvecx);
     for index2=1:length(Kvecy)

         e1=exp(sqrt(-1)*2*pi*X);
        Sig(index1,index2)=CRF*sum(sum(Nxy*dx*dy.*((1+sqrt(-1))+exp(2*pi*sqrt(-1)*Kvecx(index1)*X).*exp(2*pi*sqrt(-1)*Kvecy(index2)*Y))))/Shorten_measurement; 
        Sig2(index1,index2)=Sig(index1,index2)+sqrt(Sig(index1,index2))*randn(1,"like",1i);
         %      %   Sig(index1)=Sig(index1)+(Nxfine(index2)*dxfine*(1+exp(2*pi*sqrt(-1)*Kvec(index1)*xfine(index2))));
         %Sig(index1)=sum(Nxy*dx*dy.*((1+sqrt(-1))+exp(2*pi*sqrt(-1)*Kvec(index1)*xfine)))/Shorten_measurement;
%     %end
%     Sig2(index1)=Sig(index1)+sqrt(Sig(index1))*randn(1,"like",1i);
     
     end
     end






% 
% for index=1:(length(Kvec)-1)
%     %if index==1 
%     Npartial=sum(xfine<Xscale(index+1)&(xfine>=Xscale(index)));
%     average_dxfine=Res/sum(xfine<Xscale(index+1)&(xfine>=Xscale(index)));
%     %Slitscan(index)=sum(Nxfine((xfine<Xscale(index+1)&(xfine>=Xscale(index)))))*dxfine;
%     Slitscan(index)=sum(2*Nxfine((xfine<Xscale(index+1)&(xfine>=Xscale(index)))))*average_dxfine; % the factor two is to compensate for the fact that the fourier domain has both real and imaginary measurements so takes double the time
%         Slitscan2(index)=max(Slitscan(index)+sqrt(Slitscan(index))*randn(1),0);
%     %end
% 
% end

[a b]=find(Xscale==0);

f=fft2(Sig2);
t1=fftshift(f,1);
Spec=fftshift(t1,2);

Spec(b,b)=nan;


% if reducemean
% Spec1=(fftshift(fft(Sig-mean(Sig))));
% else
%  Spec1=(fftshift(fft(Sig)));   
% end
% 
% 
% if interpolate0
% Spec1(b)=0.5*(Spec1(b-1)+Spec1(b+1)); %interpolate to find value at frequency zero
% else
%     Spec1(b)=nan;
% end
% 
% if reducemean
% Spec2=(fftshift(fft(Sig2-mean(Sig2))));
% else
%  Spec2=(fftshift(fft(Sig2)));   
% end
% 
% 
% 
% if interpolate0
% Spec2(b)=0.5*(Spec2(b-1)+Spec2(b+1)); %interpolate to find value at frequency zero
% else
%     Spec2(b)=nan;
% 
% end
% 
% if plotmode==1
% 
% 
% subplot(5,1,1)
% plot(xfine,Nxfine)
% axis([-FOV/2 FOV/2 min(Nxfine) max(Nxfine)])
% 
% subplot(5,1,2)
% 
% plot(Xscale,abs(Spec1),'ko-')
% axis([-FOV/2 FOV/2 min(abs(Spec1))-0.1 max(abs(Spec1))+0.1])
% subplot(5,1,3)
% 
% plot(Xscale,abs(Spec2),'rs-')
% axis([-FOV/2 FOV/2 min(abs(Spec2))-0.1 max(abs(Spec2))+0.1])
% subplot(5,1,4)
% plot(Xscale(1:(end-1)),Slitscan,'kd-')
% axis([-FOV/2 FOV/2 min(Slitscan)-0.1 max(Slitscan)+0.1])
% subplot(5,1,5)
% plot(Xscale(1:(end-1)),Slitscan2,'rx-')
% axis([-FOV/2 FOV/2 min(Slitscan2)-0.1 max(Slitscan2)+0.1])
% end





