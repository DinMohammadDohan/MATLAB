
 x = 0:pi/100:2*pi;
 y = sin(x); 
 plot(x,y)

 x1 = 0:pi/100:2*pi;
 x2=0.1
 y1 = sin(x1); 
 y2 = sin(x1 - 0.25); 
 y3 = sin(x2 - 0.5); 
 plot(x1,y1,x1,y2,x1,y3)
 
 xlabel(’x’);
  ylabel(’y’); 
  title(’y = sin(x)’);