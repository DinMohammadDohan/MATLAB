Transmitted_Message= '17-34465-2'
x=asc2bn(Transmitted_Message); 
bp=.000001;
disp(' Binary information at Trans mitter :');
disp(x);
bit=[];
for n=1:1:length(x)
    if x(n)==1;
       se=5*ones(1,1000);
    else x(n)==0;
        se=zeros(1,1000);
    end
     bit=[bit se];
end
t1=bp/1000:bp/1000:100*length(x)*(bp/100);
subplot(2,1,1);
plot(t1,bit,'lineWidth',2.5);grid on;
axis([ 0 bp*length(x) -.5 6]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('Transmitting information as digital signal');