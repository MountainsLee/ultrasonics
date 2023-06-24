%% ��������źţ��������ź�ͼ��
% clc;
% clear;
time=shiyan{:,1};%ʱ��
amplitude1=shiyan{:,2};%�źŷ�ֵ
figure
subplot(2,2,1)
plot(time,amplitude1,'linewidth',2)
xlabel('time')
ylabel('amplitude1')
title('time-domain')
hold on
%% ����Ҷ�任
response=amplitude1;
response=response-mean(response);%ȥ���Ļ�ʹͼ��Գ�
y=fft(response);%����Ҷ�任
%������������������
samplenumber=length(response);%��������50720
samplefrequency=3000000;%����Ƶ��
%ȡ��ֵ�������������й�һ������take magnitude normalize by number of samples��
ytemp1=abs(y/samplenumber);%ȡ����ֵ�͸���ģ
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
%% stft��ʱ����Ҷ�任
M = floor(length(amplitude1)/4.5);
g = hamming(M);
L = floor(M/2);
Ndft = max(256,2^nextpow2(M));%ֻ�е�ndft�ĳ���Ϊ2���������ݲ�������޶ȵ���߳��������ٶ�
[sx,fx,tx] = spectrogram(amplitude1);
[st,ft,tt] = spectrogram(amplitude1,g,L,Ndft);%,"onesided")
figure
subplot(2,2,3)
%nexttile����subplot�Զ�����ͼ�顮ʹͼ��һ��
waterplot(sx,fx/pi,tx)
title("spectrogram")
hold on
subplot(2,2,4)
waterplot(st,ft/pi,tt/(2*pi))
title("stft")
hold off
%% С�����任,����С���任
% clear all  
% clc
time=shiyan{:,1};
amplitude1=shiyan{:,2};
fs=3000000;  %����Ƶ��
s=amplitude1; %С�������ź�

% С���任
cwt(s,1:10,'haar','plot'); %�°汾[wt,f] = cwt(x,wname,fs)ȡ�����Զ���߶Ⱥ���
colormap jet; 
colorbar;
hold on;
cwt(s,1:10,'haar','3Dplot');

% С�����任
[tt]=wpdec(s,4,'dmey');%С�����ֽ⣬3����ֽ�3�㣬'dmey'ʹ��meyrС��
plot(tt)               %��С������ͼ
wpviewcf(tt,1);        %����ʱ��Ƶ��ͼ

 
 
 