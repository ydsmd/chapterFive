function x_filter=LowPass(x,Ts,fc)
% Ts = 0.01; %采样时间
% fs = 1/Ts; %采样频率
target = ones(size(x));
uo = zeros(size(x));
steps = size(x); 
alpha = 2*pi*fc*Ts/(1+2*pi*fc*Ts); %滤波系数
ui = x;
uo(1) = ui(1);
for k=2:length(ui)
 uo(k) = alpha*ui(k)+(1-alpha)*uo(k-1);
end
x_filter = uo;