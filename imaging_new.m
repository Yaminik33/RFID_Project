clc; clear; 
%% Read and PLOT data real time

path1 = '009-43-371005';
% path1 = 'D:\2018\Zhiyi\EC\validation\valid_100x100';
% path1 = 'D:\2018\Zhiyi\EC\Magna\Gap_1_2_front_100x100'
% path1 = 'D:\2018\Zhiyi\circular_coil\validation_100x50'
nx = 250;
nlines =250;
speed = 5; %mm/s
sampling = 1000; %sampling frequency
freq=10000000;
stepsize=1;
str_speed=num2str(speed);
str_freq=num2str(freq); 
fname1 = [path1 '.txt'];
%path='D:\2017\test\test_cCRFP4_170x170';
pausetime=nx/speed;
line=ones(2*nlines*sampling*nx/speed,1);
x=0:speed/sampling:nx-speed/sampling;
y=0:stepsize:stepsize*nlines-stepsize;
[X,Y]=meshgrid(x,y);
% lineim=zeros(ny*sampling*nx/speed,1);
fig1= figure('position',[50 400 1500 500]);
%figure(2);
k=0;
   
    
    try
        exd=load(fname1);
    catch
        
       
      end
    disp(size(exd(:,1)));
    line=padarray(exd(:,1),length(line(:,1))-length(exd(:,1)),'post');
    disp(length(line(:,1))-length(exd(:,1)))
    sd2ch=reshape(line,[],nlines);
    re=sd2ch(1:length(sd2ch)/2,:);
    im=sd2ch(length(sd2ch)/2+1:end,:);
    
    for t=1:1;
       
    re(:,t)=re(:,2);
    im(:,t)=im(:,2);
    end

%     for t=1:100;
%        
%     re(t,:)=re(101,:);
%     im(t,:)=im(101,:);
%     end

% % %     re=re+1;
%     for h=1:nx*sampling/speed
%         re(h,:)=re(h,:)-mean(re(h,:));
%         im(h,:)=im(h,:)-mean(im(h,:));
%     end
%     
%     line_re=re(200,:);
%     line_im=im(200,:);
%     for h=1:(sampling*nx/speed)
%         re(h,:)=re(h,:)-line_re;
%         im(h,:)=im(h,:)-line_im;
%     end
%     for h=1:nlines
%         re(:,h)=re(:,h)-mean(re(:,h));
%         im(:,h)=im(:,h)-mean(im(:,h));
%     end
    
    amp=sqrt((im').^2+(re').^2);
    phase=atan2(re',im').*180./pi;
% %     
%     re=detrend(re','linear')';
%     im=detrend(im','linear')';
%     amp=detrend(amp','linear')';
%     phase=detrend(phase','linear')';
%     
    re(re==0)=NaN;
    im(im==0)=NaN;
    amp(amp==0)=NaN;
    phase(phase==0)=NaN;
    
    subplot(2,2,1)
%     Data =re;
%     N = numel(Data);
%     list = sort(datasample(reshape(Data,[],1),N),'descend');
%     ConfidenceLevel = 0.99;
%     L = floor((ConfidenceLevel+1)/2*N);
%     U = floor((1 - ConfidenceLevel)/2*N);
%     L = list(L);
%     U = list(U);
%     Data1 = Data;
%     Data1 = (Data1 -min(min(Data1)))/(max(max(Data1))-min(min(Data1)));
%     
%     Data1 (Data1 > U) = U;
%     Data1 (Data1 < L) = L;
%     Data1 = (Data1 - L)/(U - L);
%     re = Data1;
    surf(X,Y,re'); view(2); shading interp; colormap jet; axis equal; axis tight
    colorbar
    xlabel('x [mm]','fontsize',16)
    ylabel('y [mm]','fontsize',16)
    title('Real','fontsize',16)
    caxis([min(min(re(re~=0))) max(max(re(re~=0)))])
    set(gca,'color','none')
    %if (line((end-100),1)==0); caxis([min(re(100:(end-100),1)) max(re(100:(end-100),1))]);end
    drawnow   
    
    
    subplot(2,2,2)
    surf(X,Y,im');view(2);shading interp; colormap jet; axis equal;axis tight
%     colorbar
    xlabel('x [mm]','fontsize',16)
    ylabel('y [mm]','fontsize',16)
    title('Imaginary','fontsize',16)
    caxis([min(min(im(im~=0))) max(max(im(im~=0)))])
    set(gca,'color','none')
%     if (line((end-100),1)==0); caxis([min(im(100:(end-100),1)) max(im(100:(end-100),1))]); end
    drawnow
    
    subplot(2,2,3)
    
   
    surf(X,Y,amp);view(2);shading interp; colormap jet; axis equal;axis tight
%     colorbar
    xlabel('x [mm]','fontsize',16)
    ylabel('y [mm]','fontsize',16)
    title('Amplitude','fontsize',16)
    caxis([min(min(amp(amp~=0))) max(max(amp(amp~=0)))])
    set(gca,'color','none')
%     if (line((end-100),1)==0); caxis([min(amp(1,100:(end-100))) max(amp(1,10:(end-100)))]); end
    drawnow
    
    subplot(2,2,4)
    
    surf(X,Y,medfilt2(phase,[1,100]));view(2);shading interp; colormap jet; axis equal;axis tight
%     colorbar
    xlabel('x [mm]','fontsize',16)
    ylabel('y [mm]','fontsize',16)
    title('Phase','fontsize',16)
    caxis([mean(phase(:)-15),mean(phase(:)+15)]);
    colorbar
%     caxis([min(min(phase(phase~=0))) max(max(phase(phase~=0)))])
    set(gca,'color','none')
%     if (line((end-100),1)==0); caxis([min(phase(1,10:(end-100))) max(phase(1,10:(end-100)))]); end
    drawnow    
    
