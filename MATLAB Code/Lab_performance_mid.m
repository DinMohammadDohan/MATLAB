V1=87;
V2=3;
FH=81;
BG=86;
AH=11;
intensity=AH*0.01;
fs=40000;
t=0:1/fs:0.01;
x=V1*sin(2*pi*(FH*100)*t)+V2*sin(2*pi*(BG*100)*t)+intensity*randn(size(t));
noise=intensity*randn(size(t));
s_power=(V1^2)/2+(V2^2)/2;
n_power=intensity^2;
%SNR=s_power/n_power
snr(x)  %Another way to find intensity
noise=intensity