A1 = 54;
A2 = 16;
fs = 100;
t = 0:1/fs:1-1/fs;
x1 = A1*cos(2*pi*3*t);
x2 = A2*cos(2*pi*6*t);
x3 = x1 + x2;
plot(t, x3)
xlabel('Time')
ylabel('Amplitude')
title('x3 = x1 + x2')
