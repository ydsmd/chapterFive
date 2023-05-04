function [max_real,max_location]=cgtg(x,index0)
% x 磁钢信号  U 最大值限值值
% x=dataOfMagnet(:,1);
% index0=1000;
indexx=[];
U=0.4*max(x);
[value_max,index_max]=findpeaks(x,'minpeakheight',U,'minpeakdistance',500);  %磁钢信号中最大值大于0.6倍最大值电压，间隔500个点以上的数据大小和位置
[value_min,index_min]=findpeaks(-x,'minpeakheight',U,'minpeakdistance',500);  %磁钢信号中最小值小于0.6倍电压，间隔500个点以上的数据大小和位置
%循环为寻找最大值点后面index0个点以内的最小值
for i =1:length(index_max)
    [a,b]=min(x(index_max(i):index_max(i)+index0));
    indexx=[indexx;index_max(i)+b-1];
end
%找既满足最小值为最大值点后面index0个点以内，又满足是极值点的位置
[~,inindex,~]=intersect(indexx,index_min);
max_real=x(index_max(inindex));
max_location=index_max(inindex);
end

% 
% plot(dataOfTime,x)
% hold on
% % % % plot(dataOfTime(index_max),value_max,'*')
% % % % plot(dataOfTime(index_min),-value_min,'*')
% % % % plot(dataOfTime(indexx),x(indexx),'k*')
% plot(dataOfTime(max_location),max_real,'b*')
% % plot(dataOfTime(index_max),value_max,'*')