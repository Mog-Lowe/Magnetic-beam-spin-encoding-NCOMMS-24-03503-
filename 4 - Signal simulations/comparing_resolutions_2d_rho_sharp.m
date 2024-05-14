close all
%figure
clear all
stats=1;
zoom_factors_vec=[1 2 4 6 8];
CRF=100;

% imagetype='wide';run=1; %comment line which is not in use
imagetype='narrow';run=2;%comment line which is not in use


%imagetype='mixed'

for index_ext=1:length(zoom_factors_vec)
    zoom_factor=zoom_factors_vec(index_ext)    
    
    
    %%% UN-COMMENT OTHER VARIABLE FOR SAME FIGURES IN FIG.6

    %     Shorten_measurement=zoom_factor^2;
    Shorten_measurement=1

%FOV=20/zoom_factor;  %shrinking FOV
FOV=10; %fixed FOV
Res=1/zoom_factor;
N=floor((FOV/2)/Res);
Res=FOV/N/2
%Feature_width=1.3;
%Feature_width=1.3
%Feature_centre=2.0;
dx=0.05;  %resolution used to create sample
dy=dx;


% for index3=1:stats
% if mod(index3,100)==0
%   ['run ' num2str(index3) ' out of ' num2str(stats)]
% end

noise_in_FT_imaging8
%end

[Xscale2,Yscale2]=meshgrid(Xscale,Yscale);

%subplot(6,2,run)

if index_ext==1
figure
    pcolor(X,Y,Nxy)

view(0,90);shading flat; axis square; axis([-5 5 -5 5]);
xlim([-5.1, 5.1])
ylim([-5.1, 5.1])
c=colormap(bone);c2=flipud(c);colormap(c2)
ax = gca; 
ax.FontSize = 16; 
eval(['saveas(gcf,''Figure6new_' num2str(run) '_' num2str(index_ext) ''',''tiffn'')']);
%title('Original distribution')
end

%subplot(6,2,2*index_ext+run)
%title(num2str(index_ext+1))
%subplot(2,1,2)
figure
pcolor(Xscale2,Yscale2,abs(Spec))
view(90,-90);shading flat; axis square; axis([-5 5 -5 5])
xlim([-5.1, 5.0])
ylim([-5.1, 5.0])
c=colormap(bone);c2=flipud(c);colormap(c2)
ax = gca; 
ax.FontSize = 16; 
eval(['saveas(gcf,''Figure6new_' num2str(run) '_' num2str(index_ext) ''',''tiffn'')']);
%title(['Pixel size=' num2str(Res)])
% subplot(length(zoom_factors_vec)+1,2,2*index_ext+2)
% 
% plot(Kvec,real(Sig(round(length(Kvec)/2+1),:)))
% axis square

figure
[Kx Ky]=meshgrid(Kvecx,Kvecy);
plot3(Kx,Ky,ones(size(Kx,1),size(Kx,2)),'k.')
view(0,90);shading flat; axis square; axis equal; axis([-4 4 -4 4 ])
xlim([-4.0, 4.1])
ylim([-4.0, 4.1])
ax = gca; 
ax.FontSize = 16; 

end
% 



%figure(101);
figure
%subplot(3,2,run)
pcolor(X,Y,Nxy)
view(0,90);shading flat; axis square; axis equal; axis([-5 5 -5 5])
c=colormap(bone);c2=flipud(c);colormap(c2)
ax = gca; 
ax.FontSize = 16; 
%title('Original distribution')
colorbar;
figure
%subplot(3,2,run+2)
pcolor(Kvec,Kvec,real(Sig))
c=colormap(bone);c2=flipud(c);colormap(c2)
ax = gca; 
ax.FontSize = 16; 
shading flat
axis square; axis equal; axis([-4 4 -4 4])
xlim([-4.0, 4.1])
ylim([-4.0, 4.1])
colorbar

%subplot(3,2,run+4)
figure
pcolor(Kvec,Kvec,real(Sig2))
c=colormap(bone);c2=flipud(c);colormap(c2)
ax = gca; 
ax.FontSize = 16; 
shading flat
axis square; axis equal; ; axis([-4 4 -4 4])
xlim([-4.0, 4.1])
ylim([-4.0, 4.1])
colorbar

% subplot(2,1,1)
% plot(Kvec,real(Sig(round(length(Kvec)/2+1),:)),'b');hold on; plot(Kvec,imag(Sig(round(length(Kvec)/2+1),:)),'r')
% % yline(-max(Kvec)/(8/6))
%  xline(-max(Kvec)/(8/6),'r--')
%  xline(-max(Kvec)/(8/4),'g--')
%  xline(-max(Kvec)/(8/2),'b--')
% xline(-max(Kvec)/(8/1),'k--')
% xline(max(Kvec)/(8/1),'k--')
% xline(max(Kvec)/(8/2),'b--')
% xline(max(Kvec)/(8/4),'g--')
% xline(max(Kvec)/(8/6),'r--')
% %xline(max(Kvec)/(8/8))
% subplot(2,1,2)
% plot(Kvec,real(Sig2(round(length(Kvec)/2+1),:)),'b');hold on; plot(Kvec,imag(Sig2(round(length(Kvec)/2+1),:)),'r')
% 
% 
% % Sig2all(:,index3)=Sig2;
% % Spec2all(:,index3)=Spec2;
% % Slitscan2all(:,index3)=Slitscan2;
% % end
% % Spec2all_avg=mean(Spec2all,2);
% % Slitscan2_avg=mean(Slitscan2all,2);
% % 
% % Spec2all_er=std(abs(Spec2all),1,2)/sqrt(size(Spec2all,2));
% % Slitscan_er=std(abs(Slitscan2all),1,2)/sqrt(size(Slitscan2all,2));
% 
% % 
% % figure 
% % subplot(3,1,1)
% % plot(xfine,Nxfine)
% % subplot(3,1,2)
% % hold on
% % plot(Kvec,imag(Sig),'g-');plot(Kvec,real(Sig),'b-');
% % subplot(3,1,3)
% % %errorbar(Xscale(1:end-1),Slitscan2_avg/mean(Slitscan2_avg),Slitscan_er/mean(Slitscan2_avg),'-o')
% % hold on
% % errorbar(Xscale,abs(Spec2all_avg)/max(abs(Spec2all_avg)),Spec2all_er/max(abs(Spec2all_avg)),'rs-')
% % 
% % [a,b]=max(abs(Spec2all_avg)/max(abs(Spec2all_avg)));
% % 
% % SNR=max(abs(Spec2all_avg)/max(abs(Spec2all_avg)))/(Spec2all_er(b)/max(abs(Spec2all_avg)))
% % Number_of_measurements=length(Kvec)