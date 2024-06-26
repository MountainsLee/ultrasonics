%% 普通磨削砂轮最大未变形切屑厚度
clc;
clear;
Vw=0.05/60;%m/s 即100mm/min 取值范围100 -1200,600
Vs= 25;%m/s 砂轮转速
C = sqrt(3)/6;% bg/ag磨屑宽度与厚度之比，与磨粒角度有关取磨粒角度120°
Vg = 1/4;%磨粒所占砂轮体积比，与组织号有关
dm = 20e-6;%磨粒平均直径
Ns = 0.1*(Vg)^(2/3)/(dm^2);%单位面积有效磨粒数，0.1为静态值的比例系数
ap = 1e-5;%切深
ds = 125e-3;%砂轮当量直径
agmax = sqrt(4*Vw*sqrt(ap/ds)/(Vs*Ns*C));
