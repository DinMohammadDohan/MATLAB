A1 = 17;
A2 = 16;
s = 12;
varnoise=s^2;
powfund = (A1^2)/2 + (A2^2)/2;
fs = 10000;
t = 0:1/fs:1-1/fs;
signal = A1*sin(2*pi*3*100*t) + A2*cos(2*pi*5*100*t);
noise = s*randn(size(t));
SNR = snr(signal, noise);
defSNR = 10*log10(powfund/varnoise)

