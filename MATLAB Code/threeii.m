A1=87;
CDE=372;
f=CDE*100;
fs=80000; %2 times of max frequency is enough according to Nyquist theorum,3 times is taken for better precision
t=0:1/fs:0.001;
x=A1*sin(2*pi*f*t);
%--------Quantization------------%
n=4;
L=(2^n)-1;
del=(max(x)-min(x))/L;
y=min(x)+(round((x-min(x))/del)).*del;
i=(round((x-min(x))/del));
i=dec2bin(i,n)
%--------END------------%
subplot(3,1,1);
stem(t,x);
xlabel('time(s)')
ylabel('X[n]')
subplot(3,1,2);
stairs(t,y);
title('Quantized Signal')
xlabel('time')
ylabel('amplitude')
subplot(3,1,3);
hold on
stem(t,x,'r');
stairs(t,y,'b');
hold off
title('Quantized Signal')
xlabel('time')
ylabel('amplitude')