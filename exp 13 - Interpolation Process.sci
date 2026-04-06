clc;
clear;
clf;

N = 100;
L = 2;
f = 50;

t = 0:0.001:1;
n = 0:N-1;

x = sin(2*%pi*f*t);

subplot(2,1,1);
plot2d3(n, x(1:N));
title("Original Signal ");
xlabel("n");
ylabel("x(n)");

x_old = n;
x_new = linspace(0, N-1, N*L);

y = interp1(x_old, x(1:N), x_new, 'linear');
m = 0:length(y)-1;

subplot(2,1,2);
plot2d3(m, y);
title("Interpolated Signal ");
xlabel("m");
ylabel("y(m)");
