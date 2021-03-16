A=1;
B=7;
C=3;
D=4;
E=4;
F=6;
G=5;
H=2;
A1=17;
A2= 52;
j1=0.785;
j2=0.942;
t=-0.5:1/30:0.5;
x1= A1*cos(2*pi*3446*t+j1);
x2= A2*cos(2*pi*3446*t+j2);
plot(t,angle(x1)),title("phase plot")
plot(t,abs(x1)),title("amplitude plot")
plot(t,angle(x2)),title("phase plot")
plot(t,abs(x2)),title("amplitude plot")
subplot(3,1,1),plot(t,x1)
subplot(3,1,2),plot(t,x2)
x3= x2+x1;
subplot(3,1,3),plot(t,x3)
plot(t,abs (x1)),title('amplitude plot')
plot(t,angle(x3)),title('phase plot')









