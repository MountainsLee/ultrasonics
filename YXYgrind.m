%% ��ͨĥ��ɰ�����δ������м���
clc;
clear;
Vw=0.05/60;%m/s ��100mm/min ȡֵ��Χ100 -1200,600
Vs= 25;%m/s ɰ��ת��
C = sqrt(3)/6;% bg/agĥм��������֮�ȣ���ĥ���Ƕ��й�ȡĥ���Ƕ�120��
Vg = 1/4;%ĥ����ռɰ������ȣ�����֯���й�
dm = 20e-6;%ĥ��ƽ��ֱ��
Ns = 0.1*(Vg)^(2/3)/(dm^2);%��λ�����Чĥ������0.1Ϊ��ֵ̬�ı���ϵ��
ap = 1e-5;%����
ds = 125e-3;%ɰ�ֵ���ֱ��
agmax = sqrt(4*Vw*sqrt(ap/ds)/(Vs*Ns*C));

%% �Լ������ĥ�����δ������м��ȼ��㹫ʽ
Vw=0.1/60;