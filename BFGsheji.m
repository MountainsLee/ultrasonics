clc;%圆锥形变幅杆设计程序
clear;
x=3:0.0001:4.7;
d1=60;
d2=25;
n=d1/d2;
y1 = tan(x).*(1+(n/(1+n)).*(x.*x));
y2 = x;
xx=[];
mm=[3.2,3.4,3.5];%先通过观察图像，再在交点附近找的点
for i=mm  %求两曲线的交点其实就是求两曲线方程差的零点
   m=fzero('tan(x).*(1+1.67.*(x.*x))-x',i);
   xx=[m,xx];%在区间内用循环不断改变初值，就可以最完整的零点向量
end
%k=find(abs(y2-y1)<=0.00001);
%xx=x(k);
yy=xx
figure
plot(x,y1,'r',xx,yy,'*');
hold on;
plot(x,y2,'g');

b=3.3114;%与前面xx值相等
mp=n*(cos(b)-(n-1)*sin(b)/(n*b));%放大系数
%% 梯形变幅杆
