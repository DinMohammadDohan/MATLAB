bandwidth = obw(x, fs)
capacity1 = bandwidth*log2(1+SNR)
capacity2 = bandwidth*log2(1+defSNR)
% Asssume bit_rate = capacity1, where capacity1 is normal%
bit_rate = 4.8076;
Signal_Level = 2^(bit_rate/(2*bandwidth))