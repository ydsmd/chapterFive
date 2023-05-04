clc;
clear;
%% 车辆模型
r = 0.42;
vkmh = 100;
v = vkmh/3.6;
A = 0.0005;
Kv = 1.5e6;
Jv = 3044;
Mv = 4060;
Cv = 5000;
Kb = 0.267e6;
Jb = 927.8;
Mb = 23000;
Cb = 11e3;
d = 2.6;
Mw = 1670;
mw = 1670;
R = 0.42;
base = Mb*9.8/4+mw*9.8+0.5*9.8*Mv;
%% 弹性轨模型
m = 7800*(7684e-6); % the linear density - kg/m
L = 210; % the span of the simply support bridge - m
E = 2.1e11; % the elastic modulus - N*m^-2
I = 3055e-8; % the innertial moment - m^4
kf = 6.67e7;
position = 0.5*L;
Ln = 20e-3;
%% 车轮输入
v = 80/3.6;
w = v/0.42;
% 8右
file_ID = fopen('421HF\12右\file_02.dat','r');      
para_info = fscanf(file_ID,'%s',26); 
data = zeros(2587,1);
for i = 1:2587
    Num = fscanf(file_ID,'%s',1); 
    Rt = fscanf(file_ID,'%s',1); 
    Rt(strfind(Rt,','))='.'; 
    data(i,1) = str2num(Rt);
end
x = 0:360/2587:360-360/2587;
h = 0:0.01:360;

t = interp1(x,data,h,'pchip');