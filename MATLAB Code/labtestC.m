V1=74;
V2=3;
FH=62;
BG=75;
AH=12;
intensity=AH*0.01;
fs=40;
t=0:1/fs:1-1/fs;
x=V1*sin(2*pi*(FH*100)*t)+V2*sin(2*pi*(BG*100)*t);
n=4;
L=(2^n);
delta=(max(x)-min(x))/L;
delta;
bin1=dec2bin(round((x-min(x))/delta),n);
x_qua=min(x)+(round((x-min(x))/delta)).*delta;
figure;
stem(t,x,'R');
hold on;
stairs(t,x_qua,'b','linewidth',3.2);
hold off;
title('Quantized Signal')
xlabel('Time')
ylabel('Amplitude')
bin1