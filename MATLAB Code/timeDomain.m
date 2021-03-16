close all;
clc;
fs = 8000;
f = 400; %Hz
t = 0:1/fs:1-1/fs;
signal = 1.2*sin(2*pi*f*t);
plot(t, signal);
title('Time-Domain signal');
xlabel('Time (s)');
ylabel('amplitude');
fftSignal = fft(signal);
fftSignal = fftshift(fftSignal)/(fs/2);
f = fs/2*linspace(-1,1,fs);
figure;
plot(f, abs(fftSignal));
title('magnitude FFT of sine');
xlabel('Frequency (Hz)');
ylabel('magnitude');
noise = 2*randn(size(signal));
figure
plot(t,noise)
xlabel('Time (s)');
ylabel('Amplitude');
title('Time-Domain Noise');
fftNoise = fft(noise);
fftNoise = fftshift(fftNoise)/(fs/2);
figure
plot(f,abs(fftNoise))
title('Magnitude FFT of noise');
xlabel('Frequency (Hz)');
ylabel('magnitude');
noisySignal = signal + noise;
figure
plot(t,noisySignal)
xlabel('Time (s)');
ylabel('Amplitude');
title('Time-Domain Noisy Signal');
fftNoisySignal = fft(noisySignal);
fftNoisySignal = fftshift(fftNoisySignal)/(fs/2);
figure
plot(f,abs(fftNoisySignal))
title('Magnitude FFT of noisy signal');
xlabel('Frequency (Hz)');
ylabel('magnitude');