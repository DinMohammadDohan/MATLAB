fs=40e3;% sampling frequency
fc=4e3;% frequency of the signal
t=0:1/fs:0.001;%discrete time
x=0.5*sin(2*pi*fc*t);% discrete signal
%--------Quantization------------%
n=8;
L=(2^n)-1;
delta=(max(x)-min(x))/L;
xq=min(x)+(round((x-min(x))/delta)).*delta;
a = (round((x-min(x))/delta));
y0 = dec2bin(a,n);