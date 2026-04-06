clc;
clear;
clf;

N = 100;
D = 2;
f = 50;

t = 0:0.001:1;
n = 0:N-1;

x = sin(2*%pi*f*t);

subplot(2,1,1);
plot2d3(n, x(1:N));
title("Original Signal ");
xlabel("n");
ylabel("x(n)");

y = x(1:D:N);
m = 0:length(y)-1;

subplot(2,1,2);
plot2d3(m, y);
title("Decimated Signal ");
xlabel("m");
ylabel("y(m)");
