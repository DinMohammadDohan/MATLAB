clear all;
close all;
Transmitted_Message='Fahim Farajannat';
val1=634;

val2=73;
%Converting Information Message to bit%
x=asc2bin(Transmitted_Message); % Binary Information
val1Bin = de2bi(val1);
bp=.000001; % bit period
disp(' Binary information at Transmitter :');
disp(val1Bin);
%XX representation of transmitting binary information as digital signal XXX
bit=[];
for n=1:1:length(val1Bin)
if val1Bin(n)==1
se=5*ones(1,100);
else val1Bin(n)=0;
se=zeros(1,100);
end
bit=[bit se];
end
t1=bp/100:bp/100:100*length(val1Bin)*(bp/100);
subplot(2,1,1);
plot(t1,bit,'lineWidth',2.5);grid on;
axis([ 0 bp*length(x) -.5 6]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('Converted Val1 To Signal');
data_NZR=2*x-1; % Data Represented at NZR form for QPSK modulation
s_p_data=reshape(data_NZR,2,length(x)/2); % S/P convertion of data
br=10.^6; %Let us transmission bit rate 1000000
f=br; % minimum carrier frequency
T=1/br; % bit duration
t=T/99:T/99:T; % Time vector for one bit information
% XXXXXXXXXXXXXXXXXXXXXXX QPSK modulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
y=[];
y_in=[];
y_qd=[];
for(i=1:length(x)/2)
y1=s_p_data(1,i)*cos(2*pi*f*t); % inphase component
y2=s_p_data(2,i)*sin(2*pi*f*t) ;% Quadrature component
y_in=[y_in y1]; % inphase signal vector
y_qd=[y_qd y2]; %quadrature signal vector
y=[y y1+y2]; % modulated signal vector
end
Tx_sig=y; % transmitting signal after modulation
tt=T/99:T/99:(T*length(x))/2;
snry = randn(size(Tx_sig))*std(Tx_sig)/db2mag(val2);
disp('Calculated SNR Value');
disp(snr(Tx_sig,snry));
% XXXXXXXXXXXXXXXXXXXXXXXXXXXX QPSK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXX
mn=[];
Rx_sig=Tx_sig; % Received signal
for(i=1:1:length(x)/2)
%%XXXXXX inphase coherent dector XXXXXXX
Z_in=Rx_sig((i-1)*length(t)+1:i*length(t)).*cos(2*pi*f*t);
% above line indicat multiplication of received & inphase carred signal
Z_in_intg=(trapz(t,Z_in))*(2/T);% integration using trapizodial rull
if(Z_in_intg>0) % Decession Maker
Rx_in_data=1;
else
Rx_in_data=0;
end
%%XXXXXX Quadrature coherent dector XXXXXX
Z_qd=Rx_sig((i-1)*length(t)+1:i*length(t)).*sin(2*pi*f*t);
%above line indicat multiplication ofreceived & Quadphase carred signal
Z_qd_intg=(trapz(t,Z_qd))*(2/T);%integration using trapizodial rull
if (Z_qd_intg>0)% Decession Maker
Rx_qd_data=1;
else
Rx_qd_data=0;
end
mn=[mn Rx_in_data Rx_qd_data]; % Received Data vector
end
Received_Message=bin2asc(mn);
disp('Recieved Message after conversion');
disp(Received_Message);