function TimeDominFeatures = FourTimeDominFeatures(Signal)
example_data = Signal; %以第一轮在Sensor1上的信号为例
n = length(example_data);
%% 均方根值 描述信号能量大小
Index_Rms = rms(example_data);
%% 标准差 表征信号偏离平均值的稳定程度
Index_std = std(example_data);
%% 方根幅值 
Index_Xr = mean(sqrt(abs(example_data)))^2;
%% 裕度因子
Index_pk = max(abs(example_data));
Index_L = Index_pk/Index_Xr;
TimeDominFeatures(1) = Index_Rms;
TimeDominFeatures(2) = Index_std;
TimeDominFeatures(3) = Index_Xr;
TimeDominFeatures(4) = Index_L;

end