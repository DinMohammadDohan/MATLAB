SNR = snr(signal);
bandwidth = obw(signal, fs)
capacity1 = bandwidth*log2(1+SNR)
capacity2 = bandwidth*log2(1+defSNR)