%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure5.26%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         本文件绘制论文图5.26                                 %
%                         作者：余道洪                                         %
%                         修改日期：2023.4.26                                  %                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
N1 = 1:20;N2=N1;
A1 = [0.13725 0.008494 0.002549 0.002364 0.000268 0.000371 0.001489 0.01003 0.001369 0.000426 0.00443 0.01365 0.000414 0.000264 0.000037 0.000387 0.000423 0.000235 0.000511 0.000386];
A2 = [0.016076 0.013607 0.003144 0.001481 0.000024 0.000348 0.000468 0.000700 0.000342 0.000103 0.001645 0.004889 0.000865 0.000626 0.000116 0.000353 0.000258 0.000337 0.000309 0.000351];
db1 = [41.117146 18.582242 8.126457 7.472423 -11.438596 -8.617718 3.458894 0.027430 2.725299 -7.407001 12.914767 2.704139 -7.652522 -11.554767 -28.595226 -8.249460 -7.470507 -12.566006 -5.836406 -8.263230];
db2 = [24.123679 22.675097 9.949631 3.410143 -32.267554 -9.175228 -6.599320 -3.104030 -9.318264 -19.766777 4.322229 13.783630 -1.264631 -4.074329 -18.739052 -9.052321 -11.772245 -9.442196 -10.207258 -9.102385];

% figure
% bar(N1,A1)
% 
% figure
% bar(N2,A2)

res = [A1;A2]';
res2 = [db1;db2]';
f = figure
b = bar(res2);
set(b(1),'facecolor','#8ECFC9','LineWidth',1,'BarWidth',0.8);
set(b(2),'facecolor',[250 127 111]/255,'LineWidth',1,'BarWidth',0.8);
% set(f,'position',[500 500 2500 500])
xlabel('多边形阶数','FontSize',14)
ylabel('幅值等级(dB re 1μm)','FontSize',14)
l = legend('8号轴左侧车轮','12号轴右侧车轮')
set(l,'FontSize',12);