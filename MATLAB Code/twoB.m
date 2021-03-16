A1 = 54;
A2 = 16;
fs = 10000;
t = -0.01:1/fs:0.01;
x1 = A1*cos(2*pi*3*100*t);
x2 = A2*cos(2*pi*6*100*t);
x3 = x1 + x2;
plot(t, x3)
xlabel('Time')
ylabel('Amplitude')
title('x3 = x1 + x2')
