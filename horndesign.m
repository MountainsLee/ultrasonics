%% ���������̲���
clc;
clear;
% z = p*s*c;���迹
% k=W/C;����
f = 28000; % ������Ƶ��
w = 2*pi*f; %ԲƵ��
p3 = 7850;%�ܶ�kg/m3
p2 = 7550;
p1 = 4400;
c3 = 5170;
c2 = 3100;%ѹ���մ�����
c1 = 6100;%45�ֲ��� m/s
s1 = pi*0.001024;%���
s2 = pi*0.0009;
s3 = s1;

k1 = w/c1;
k2 = w/c2;
k3 = w/c3;

z1 = p1*c1*s1;
z2 = p2*c2*s2;
z3 = p3*c3*s3;

l3 = 0.006; % ����
l2 = 0.02;

syms l1
equ = (z3/z2)*tan (k2*l2)*tan (k3*l3)+(z3/z1)*tan (k1*l1)*tan (k3*l3)+(z2/z1)*tan (k2*l2)*tan (k1*l1) == 1
solve(equ,l1)

%% �������ⲿ��
c4 = 6100;
p4 = 4400;
s4=0.001024;
s5=0.0004;
z4=p4*c4*s4;
z5=p4*c4*s5;

f = 28000; % ������Ƶ��
w = 2*pi*f; %ԲƵ��

k4 = w/c4;
k5=k4;
l4=0.0208;
syms l5
equ2 = tan(k4*l4)*tan(k5*l5)-z4/z5 == 0;
solve(equ2,l5)
%% ͼ�����
l1=[0:0.001:1]; 
Y = (z3/z2)*tan (k2*l2)*tan (k3*l3)+(z3/z1)*tan (k1*l1)*tan (k3*l3)+(z2/z1)*tan (k2*l2)*tan (k1*l1)- 1;
y2= 0
figure
plot(l1,Y)
hold on
plot(y2)

tan (k4*l4)*tan (k5*l5)=z4/z5;
clc
clear
syms c
a=[1,2,c,3,4]
b=[3,4,2,1,1]
f=a*b-3
g=solve(f,c)