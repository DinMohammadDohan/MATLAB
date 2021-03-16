SNR = snr(x);
bandwidth = obw(x,fs);
C = bandwidth*log2(1+SNR)