Am=4;
bit=3;
f=1;
fs=30;
t=0:1/fs:1*pi;
y=Am*sin(2*pi*f*t);   
Nsamples=length(y); 
quantised_out=zeros(1,Nsamples);
del=2*Am/(2^bit);  
Llow=-Am+del/2;
Lhigh=Am-del/2;
for i=Llow:del:Lhigh   
   for j=1:Nsamples 
       if(((i-del/2)<y(j))&&(y(j)<(i+del/2)))
           quantised_out(j)=i;
       end
   end
end
stem(t,quantised_out);
hold on;
plot(t,y,'color','r');