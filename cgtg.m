function [max_real,max_location]=cgtg(x,index0)
% x �Ÿ��ź�  U ���ֵ��ֵֵ
% x=dataOfMagnet(:,1);
% index0=1000;
indexx=[];
U=0.4*max(x);
[value_max,index_max]=findpeaks(x,'minpeakheight',U,'minpeakdistance',500);  %�Ÿ��ź������ֵ����0.6�����ֵ��ѹ�����500�������ϵ����ݴ�С��λ��
[value_min,index_min]=findpeaks(-x,'minpeakheight',U,'minpeakdistance',500);  %�Ÿ��ź�����СֵС��0.6����ѹ�����500�������ϵ����ݴ�С��λ��
%ѭ��ΪѰ�����ֵ�����index0�������ڵ���Сֵ
for i =1:length(index_max)
    [a,b]=min(x(index_max(i):index_max(i)+index0));
    indexx=[indexx;index_max(i)+b-1];
end
%�Ҽ�������СֵΪ���ֵ�����index0�������ڣ��������Ǽ�ֵ���λ��
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