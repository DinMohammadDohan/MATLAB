fx1 = fft(x1);
fx2 = fft(x2);
fx1 = fftshift(fx1)/(fs/2);
fx2 = fftshift(fx2)/(fs/2);
f = fs/2*linspace(-1,1,fs);
figure;
plot(f, abs(fx1), f, abs(fx2),'LineWidth',1.5);
title('magnitude FFT of sine');
axis([-100 100 0 2])
xlabel('Frequency (Hz)');
ylabel('magnitude');