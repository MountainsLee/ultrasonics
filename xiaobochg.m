% clear all;
amplitude1=shiyan{:,2};
x_input=amplitude1; %С�������ź�  ��������
plot(x_input);title('�����ź�ʱ��ͼ��')  %���������ź�ʱ��ͼ��
 
x=x_input;        %   �鿴Ƶ�׷�Χ
fs=128;
N=length(x); %���������
signalFFT=abs(fft(x,N));%��ʵ�ķ�ֵ
Y=2*signalFFT/N;
f=(0:N/2)*(fs/N);
figure;plot(f,Y(1:N/2+1));
ylabel('amp'); xlabel('frequency');title('�����źŵ�Ƶ��');grid on
 
wpt=wpdec(x_input,3,'dmey');      %����4��С�����ֽ�
plot(wpt);                        %����С������
 
%% ʵ�ֶԽڵ�˳����Ƶ�ʵ�������������
% nodes=get(wpt,'tn');  %С�����ֽ�ϵ����Ϊʲô��������[7;8;9;10;11;12;13;14]
% N_cfs=length(nodes);  %С����ϵ������
nodes=[7;8;9;10;11;12;13;14];
ord=wpfrqord(nodes);  %С����ϵ�����ţ�ord�����ź�С����ϵ���������ɵľ�����3��ֽ��[1;2;4;3;7;8;6;5]
nodes_ord=nodes(ord); %���ź��С��ϵ��
 
%% ʵ�ֶԽڵ�С���ڵ�����ع� 
for i=1:8
rex3(:,i)=wprcoef(wpt,nodes_ord(i));         
end
 
%% ���Ƶ�3������ڵ�ֱ��ع����źŵ�Ƶ��
figure;                         
for i=0:7
subplot(2,4,i+1);
x_sign= rex3(:,i+1); 
N=length(x_sign); %���������
signalFFT=abs(fft(x_sign,N));%��ʵ�ķ�ֵ
Y=2*signalFFT/N;
f=(0:N/2)*(fs/N);
plot(f,Y(1:N/2+1));
ylabel('amp'); xlabel('frequency');grid on
axis([0 50 0 0.03]); title(['С������3��',num2str(i),'�ڵ��ź�Ƶ��']);
end
 
%% wavelet packet coefficients. ��ȡС�����ֽ�ĸ���Ƶ�ε�С����ϵ��
cfs3_0=wpcoef(wpt,nodes_ord(1));  %����������3��0�ڵ��С����ϵ��0-8Hz
cfs3_1=wpcoef(wpt,nodes_ord(2));  %����������3��0�ڵ��С����ϵ��8-16Hz
cfs3_2=wpcoef(wpt,nodes_ord(3));  %����������3��0�ڵ��С����ϵ��16-24Hz
cfs3_3=wpcoef(wpt,nodes_ord(4));  %����������3��0�ڵ��С����ϵ��24-32Hz
cfs3_4=wpcoef(wpt,nodes_ord(5));  %����������3��0�ڵ��С����ϵ��32-40Hz
cfs3_5=wpcoef(wpt,nodes_ord(6));  %����������3��0�ڵ��С����ϵ��40-48Hz
cfs3_6=wpcoef(wpt,nodes_ord(7));  %����������3��0�ڵ��С����ϵ��48-56Hz
cfs3_7=wpcoef(wpt,nodes_ord(8));  %����������3��0�ڵ��С����ϵ��56-64Hz
%% ��ȡС�����ֽ�ĸ���Ƶ�ε�����
E_cfs3_0=norm(cfs3_0,2)^2;  %% 1-����������norm(...,1)������Ԫ�ؾ���ֵ֮�ͣ�2-����������norm(...,2)������Ԫ��ƽ���Ϳ����ţ�
E_cfs3_1=norm(cfs3_1,2)^2;
E_cfs3_2=norm(cfs3_2,2)^2;
E_cfs3_3=norm(cfs3_3,2)^2;
E_cfs3_4=norm(cfs3_4,2)^2;
E_cfs3_5=norm(cfs3_5,2)^2;
E_cfs3_6=norm(cfs3_6,2)^2;
E_cfs3_7=norm(cfs3_7,2)^2;
E_total=E_cfs3_0+E_cfs3_1+E_cfs3_2+E_cfs3_3+E_cfs3_4+E_cfs3_5+E_cfs3_6+E_cfs3_7;
 
p_node(1)= 100*E_cfs3_0/E_total;           % ���ÿ���ڵ��ռ��
p_node(2)= 100*E_cfs3_1/E_total;           % ���ÿ���ڵ��ռ��
p_node(3)= 100*E_cfs3_2/E_total;           % ���ÿ���ڵ��ռ��
p_node(4)= 100*E_cfs3_3/E_total;           % ���ÿ���ڵ��ռ��
p_node(5)= 100*E_cfs3_4/E_total;           % ���ÿ���ڵ��ռ��
p_node(6)= 100*E_cfs3_5/E_total;           % ���ÿ���ڵ��ռ��
p_node(7)= 100*E_cfs3_6/E_total;           % ���ÿ���ڵ��ռ��
p_node(8)= 100*E_cfs3_7/E_total;           % ���ÿ���ڵ��ռ��
 
figure;
x=1:8;
bar(x,p_node);
title('����Ƶ��������ռ�ı���');
xlabel('Ƶ�� Hz');
ylabel('�����ٷֱ�/%');
for j=1:8
text(x(j),p_node(j),num2str(p_node(j),'%0.2f'),...
    'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
end
% E = wenergy(wpt);       %��ȡ�����ڵ�����
 
%% �����ع�ǰ��������Ƶ��С����ϵ����ͼ��
figure(1);
subplot(4,1,1);
plot(x_input);
title('ԭʼ�ź�');
subplot(4,1,2);
plot(cfs3_0);
title(['���� ',num2str(3) '  �ڵ� 0��С��0-8Hz',' ϵ��'])
subplot(4,1,3);
plot(cfs3_1);
title(['���� ',num2str(3) '  �ڵ� 1��С��8-16Hz',' ϵ��'])
subplot(4,1,4);
plot(cfs3_2);
title(['���� ',num2str(3) '  �ڵ� 2��С��16-24Hz',' ϵ��'])
 
%% �����ع���ʱ���������Ƶ�ε�ͼ��
figure(3);
subplot(3,1,1);
plot(rex3(:,1));
title('�ع���0-8HzƵ���ź�');
subplot(3,1,2);
plot(rex3(:,2));
title('�ع���8-16HzƵ���ź�')
subplot(3,1,3);
plot(rex3(:,3));
title('�ع���16-24HzƵ���ź�');
 