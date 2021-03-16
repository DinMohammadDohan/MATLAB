close all;
clc;
f=5;
f2=10;
DEF=446;
x=[0 0 1 1 0 1 0 0 0 0 1 1 0 1 0 0 0 0 1 1 0 1 1 0] % DEF=446
xn=[00 11 01 00 00 11 01 00 00 11 01 10] ;
x1=[0 1 0 0 0 1 0 0 0 1 0 0];
x2=[0 1 1 0 0 1 1 0 0 1 1 0];
nx=size(x,2);
nx1=size(x1,2);
i=1;
while i<nx+1
t = i:0.001:i+1;
if x(i)==1
ask=sin(2*pi*f*t);
fsk=sin(2*pi*f*t);
psk=sin(2*pi*f*t);
else
ask=0;
fsk=sin(2*pi*f2*t);
psk=sin(2*pi*f*t+pi);
end

subplot(4,1,1);
plot(t,ask)
hold on;
grid on;
axis([1 24 -1 1]);
title('Amplitude Shift Key')
subplot(4,1,2);
plot(t,fsk)
hold on;
grid on;
axis([1 24 -1 1]);
title('Frequency Shift Key')
subplot(4,1,3);
plot(t,psk)
hold on;
grid on;
axis([1 24 -1 1]);
title('Phase Shift Key')
i=i+1;
end

i=1;
while i<nx1+1
t = i:0.001:i+1;
if x1(i)==1
psk1=sin(2*pi*f*t);
else
psk1=sin(2*pi*f*t+pi);
end
if x2(i)==1
psk2=sin(2*pi*f*t+pi/2);
else
psk2=sin(2*pi*f*t+pi+pi/2);
end
QPSK = psk1+psk2;

subplot(4,1,4);
plot(t,QPSK)
hold on;
grid on;
axis([1 12 -2 2]);
title('QPSK')
i=i+1;
end