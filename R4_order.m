clc;
clear all;
f= @(t,y) -20*y+7*exp(-0.5*t);
t0= 0;
y0= 5;
h= 0.01;
tn=0.2;
n= (tn-t0)/h;
t(1) = t0;
y(1) = y0;
for i= 1:n
t(1+1) =  t0 + i*h;
k1 = h*f(t(i),y(i)); 
k2 = h*f(t(i)+(h/2),y(i)+(k1/2));
k3 = h*f(t(i)+(h/2),y(i)+(k2/2)); 
k4 = h*f(t(i)+h,y(i)+k3);
y(i+1)= y(i) + (1/6)*(k1+2*k2+2*k3+k4);
k(i)= t(i);
j(i)= y(i);
fprintf('The value at y(%.2f) = %.4f\n', t(i+1), y(i+1));
plot(k,j); 
xlabel( 'Values of x');
ylabel('Values hold y');
hold on;
end