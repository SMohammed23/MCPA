

x = -2:0.2:2;
v = x';
z = x .* exp(-x.^2 - v.^2);
[px,pv] = gradient(z);
contour(x,v,z)
hold on
quiver(x,v,px,pv)
title('1D electron simulation');
xlabel('position');
ylabel('velocity');

%b) 
x = -3:0.2:3;
y = x';
f = x.^2 .* y.^3;
x0 = 1;
v0 = -2;
t = (x == x0) & (y == v0);
indt = find(t);
[fx,fy] = gradient (f,0.2);
f_grad = [fx(indt) fy(indt)];

