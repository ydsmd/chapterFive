%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure5.23ToFigure5.25%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         本文件绘制论文图5.23-Figure5.25                      %
%                         作者：余道洪                                         %
%                         修改日期：2023.4.24                                  %                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 8右
clc;
clear;
file_ID = fopen('421HF\12右\file_02.dat','r');      
para_info = fscanf(file_ID,'%s',26); 
data = zeros(2587,2);
for i = 1:2587
    Num = fscanf(file_ID,'%s',1); 
    Rt = fscanf(file_ID,'%s',1); 
    Rt(strfind(Rt,','))='.';
    
    data(i,1) = i;
    data(i,2) = str2num(Rt);
end

fclose(file_ID);
% 绘图
step = 2*pi / 2587;
x = 0 : step :2*pi - step;

R = 420 + data(:,2);
figure()
polarplot(x,R','r');
title('12号轴右侧车轮')
JT = max(R)-min(R);
legend('车轮廓形=理想车轮半径+1000×失圆径跳/(mm)','FontSize',13)
%% 8左
file_ID = fopen('421HF\114-8左\file_03.dat','r');      
para_info = fscanf(file_ID,'%s',26); 
data2 = zeros(2587,2);
for i = 1:2587
    Num = fscanf(file_ID,'%s',1); 
    Rt = fscanf(file_ID,'%s',1); 
    Rt(strfind(Rt,','))='.';
    
    data2(i,1) = i;
    data2(i,2) = str2num(Rt);
end
fclose(file_ID);
%
step = 2*pi / 2587;
x = 0 : step :2*pi-step;
R = 420 + data2(:,2);
figure()
polarplot(x,R','r');
title('8号轴左侧车轮')
legend('车轮廓形=理想车轮半径+1000×失圆径跳/(mm)','FontSize',13)
%% 合并
figure()
step = 360 / 2587;
x = 0 : step :360 - step;
plot(x,data2(:,2),'Color',[142 207 201]/255)
hold on
plot(x,data(:,2),'Color',[250 127 111]/255)
xlabel('角度(°)','FontSize',14)
ylabel('径跳(μm)','FontSize',14)
h = legend('8号轴左侧车轮','12号轴右侧车轮')
set(h,'FontSize',12)
xlim([0 360])