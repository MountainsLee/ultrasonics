%% 导入采样信号，并绘制信号图像
% clc;
% clear;
time=shiyan{:,1};%时间
amplitude1=shiyan{:,2};%信号幅值
figure
subplot(2,2,1)
plot(time,amplitude1,'linewidth',2)
xlabel('time')
ylabel('amplitude1')
title('time-domain')
hold on
%% 傅里叶变换
response=amplitude1;
response=response-mean(response);%去中心化使图像对称
y=fft(response);%傅里叶变换
%定义样本（波）性质
samplenumber=length(response);%样本长度50720
samplefrequency=3000000;%样本频率
%取幅值，按样本数进行归一化处理（take magnitude normalize by number of samples）
ytemp1=abs(y/samplenumber);%取绝对值和复数模
ytemp2=ytemp1(1:samplenumber/2+1);
freqresponse=ytemp2;
freqresponse(2:end)=2*freqresponse(2:end);%define frequency bins
fbins=samplefrequency*(0:samplenumber/2)/samplenumber;
%plot result
subplot(2,2,2)
plot(fbins,freqresponse)
grid on
xlabel('frequency(Hz)','fontsize',14)
ylabel('frequency-domain','fontsize',14)
%% stft短时傅里叶变换
M = floor(length(amplitude1)/4.5);
g = hamming(M);
L = floor(M/2);
Ndft = max(256,2^nextpow2(M));%只有当ndft的长度为2的整数次幂才能最大限度的提高程序运算速度
[sx,fx,tx] = spectrogram(amplitude1);
[st,ft,tt] = spectrogram(amplitude1,g,L,Ndft);%,"onesided")
figure
subplot(2,2,3)
%nexttile等于subplot自动创建图块‘使图在一起’
waterplot(sx,fx/pi,tx)
title("spectrogram")
hold on
subplot(2,2,4)
waterplot(st,ft/pi,tt/(2*pi))
title("stft")
hold off
%% 小波包变换,连续小波变换
% clear all  
% clc
time=shiyan{:,1};
amplitude1=shiyan{:,2};
fs=3000000;  %采样频率
s=amplitude1; %小波分析信号

% 小波变换
cwt(s,1:10,'haar','plot'); %新版本[wt,f] = cwt(x,wname,fs)取消了自定义尺度函数
colormap jet; 
colorbar;
hold on;
cwt(s,1:10,'haar','3Dplot');

% 小波包变换
[tt]=wpdec(s,4,'dmey');%小波包分解，3代表分解3层，'dmey'使用meyr小波
plot(tt)               %画小波包树图
wpviewcf(tt,1);        %画出时间频率图

 
 
 