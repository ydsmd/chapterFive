function [Fx,Fy] = Fourier(x,Ts)
%UNTITLED3 此处提供此函数的摘要
%   此处提供详细说明
y = fft(x); 
fs = 1/Ts;
f = (0:length(y)-1)*fs/length(y);
n = length(x);                    
fshift1 = (-n/2:n/2-1)*(fs/n);
yshift1 = fftshift(y);

Fx = fshift1(ceil(n/2):end);
Fy = abs(yshift1)/(n-1);
Fy = Fy(ceil(n/2):end);
end