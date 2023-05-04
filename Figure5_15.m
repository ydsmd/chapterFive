%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure5.15.m%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         本文件绘制论文图5.15                      %
%                         作者：余道洪                                         %
%                         修改日期：2023.4.27                                  %                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
load dfsData.mat
A = tmpDataSet;
load Character.mat
B = tmpDataSet;
All = [A;B];

iteration =500 ;
k = 1; 
% p = 4;
distance = 'sqeuclidean';
dataforKM = All;
dataforKM = zscore(dataforKM(:,1:9));
opts = statset('MaxIter',iteration);
[IDX,C,~,D] = kmeans(dataforKM,k,'distance',distance,'Options',opts);
min_d =D/median(D);
min_d(7164,:) = [];min_d(3132,:) = [];
figure()
stairs(min_d)
xlabel('样本编号','FontSize',15)
ylabel('到数据中心的相对距离','FontSize',15)
title('各样本到聚类中心的相对距离','FontSize',15)

figure()
h = histogram(min_d)
xlim([0 10])
xlabel('相对距离','FontSize',15)
ylabel('数据个数','FontSize',15)
title('样本总体的分布情况','FontSize',15)
prettyAxes().dark()
index = sum(min_d<=10)/length(min_d);

