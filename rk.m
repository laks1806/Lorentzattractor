clc;
 clear all;
t(1)=0;  %initializing x,y,z,t
x(1)=1;
y(1)=1;
z(1)=1;
sigma=10;   %value of constants
rho=28;
beta=(8.0/3.0);
h=0.01;   %step size
t=0:h:20;
f=@(t,x,y,z) sigma*(y-x);  %ode 
g=@(t,x,y,z) x*rho-x.*z-y;
p=@(t,x,y,z) x.*y-beta*z;
for i=1:(length(t)-1) %loop
    k1=f(t(i),x(i),y(i),z(i));
    l1=g(t(i),x(i),y(i),z(i));
    m1=p(t(i),x(i),y(i),z(i));
      k2=f(t(i)+h/2,(x(i)+0.5*k1*h),(y(i)+(0.5*l1*h)),(z(i)+(0.5*m1*h)));     
      l2=g(t(i)+h/2,(x(i)+0.5*k1*h),(y(i)+(0.5*l1*h)),(z(i)+(0.5*m1*h)));
      m2=p(t(i)+h/2,(x(i)+0.5*k1*h),(y(i)+(0.5*l1*h)),(z(i)+(0.5*m1*h)));
      k3=f(t(i)+h/2,(x(i)+0.5*k2*h),(y(i)+(0.5*l2*h)),(z(i)+(0.5*m2*h)));
      l3=g(t(i)+h/2,(x(i)+0.5*k2*h),(y(i)+(0.5*l2*h)),(z(i)+(0.5*m2*h)));
      m3=p(t(i)+h/2,(x(i)+0.5*k2*h),(y(i)+(0.5*l2*h)),(z(i)+(0.5*m2*h)));
      k4=f(t(i)+h,(x(i)+k3*h),(y(i)+l3*h),(z(i)+m3*h));
      l4=g(t(i)+h,(x(i)+k3*h),(y(i)+l3*h),(z(i)+m3*h));
      m4=p(t(i)+h,(x(i)+k3*h),(y(i)+l3*h),(z(i)+m3*h));
      x(i+1) = x(i) + h*(k1 +2*k2  +2*k3   +k4)/6; %final equations
      y(i+1) = y(i) + h*(l1  +2*l2   +2*l3    +l4)/6;
      z(i+1) = z(i) + h*(m1+2*m2 +2*m3  +m4)/6;
end
plot3(x,y,z)