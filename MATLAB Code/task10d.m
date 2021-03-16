%ID:17-34465-2
Transmitted_Message= 'Red'
x=asc2bn(Transmitted_Message); 
bp=.000001;
disp(' Binary information at Transmitter :');
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
axis([ 0 bp*length(x) -.5 6]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('Transmitting information as digital signal');
 
%XXXXXXXXXXXXXXXXXXXXXXX Binary-PSK modulation XXXXXXXXXXXXXXXXXXXXXXXXXXX%
A=5;                                          % Amplitude of carrier signal 
br=1/bp;                                                         % bit rate
f=br*2;                                                 % carrier frequency 
t2=bp/1734:bp/1734:bp;                 
ss=length(t2);
m=[];
for (i=1:1:length(x))
    if (x(i)==1)
        y=A*cos(2*pi*f*t2);
    else
        y=A*cos(2*pi*f*t2+pi);   %A*cos(2*pi*f*t+pi) means -A*cos(2*pi*f*t)
    end
    m=[m y];
end
t3=bp/1734:bp/1734:bp*length(x);
subplot(3,1,2);
plot(t3,m);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('waveform for binary PSK modulation coresponding binary information');
 
 
%XXXXXXXXXXXXXXXXXXXX Binary PSK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
mn=[];
for n=ss:ss:length(m)
  t=bp/1734:bp/1734:bp;
  y=cos(2*pi*f*t);                                        % carrier siignal 
  mm=y.*m((n-(ss-1)):n);
  t4=bp/1734:bp/1734:bp;
  z=trapz(t4,mm);                                              % intregation 
  zz=round((2*z/bp));                                     
  if(zz>0)                                        % logic level = (A+A)/2=0 
                         %becouse A*cos(2*pi*f*t+pi) means -A*cos(2*pi*f*t)
    a=1;
  else
    a=0;
  end
  mn=[mn a];
end
disp(' Binary information at receiver :');
disp(mn);
 
 
 
bit=[];
for n=1:length(mn);
 if mn(n)==1;
 se=5*ones(1,100);
 else mn(n)==0;
 se=zeros(1,100);
 end
 bit=[bit se];
end
t5=bp/100:bp/100:100*length(mn)*(bp/100);
subplot(4,1,4)
plot(t5,bit,'LineWidth',2.5);grid on;
axis([ 0 bp*length(mn) -.5 6]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('Demodulated signal at receiver');
