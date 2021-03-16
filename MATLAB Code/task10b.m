%ID=17-34465-2
A=1;
B=7;
C=3;
D=4;
E=4;
F=6;
R=5;
H=2;
clear all;
close all;
Transmitted_Message= '17-34465-2'
x=asc2bn(Transmitted_Message);
bp=0.1; %bit duration = 1 sec
disp(' Binary information at Trans mitter :');
disp(x);
bit=[];
for n=1:1:length(x)
if x(n)==1;
se=13*ones(1,1734);
else x(n)==0;
se=zeros(1,1734);
end
bit=[bit se];
end
t1=bp/1734:bp/1734:1734*length(x)*(bp/1734);
subplot(4,1,1);
plot(t1,bit,'lineWidth',2.5);grid on;
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('Transmitting information as digital signal');
