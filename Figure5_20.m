%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure5.20%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         本文件绘制论文图5.20                                 %
%                         作者：余道洪                                         %
%                         修改日期：2023.4.21                                  %                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
iteration =500 ;
k = 1; 
p = 4;
distance = 'sqeuclidean';
load Character.mat
dataforKM = tmpDataSet;
dataforKM = zscore(dataforKM(:,1:9));
opts = statset('MaxIter',iteration);
[IDX,C,~,D] = kmeans(dataforKM,k,'distance',distance,'Options',opts);
min_d =D/median(D);
x=1:length(min_d);

No = 1:length(min_d);
set = [min_d,No'];
x = sortrows(set,1,'descend');
Worst = x(1:30,:);

no = Mark(Worst(1 : length(Worst(:,1)),2),3);

figure(1)
y = x(:,1);
histogram(y)

hold on 
plot([5 5],[0 20000],'LineWidth',1)
stat = sum(y<5)/length(D);
axis([0 20  0 0 13378])
xlabel('相对距离')
ylabel('数据个数')

text(2,8000,'93.84%','FontSize',14)
text(12.5,8000,'6.16%','FontSize',14)