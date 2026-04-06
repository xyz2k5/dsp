clc;
clear;
clf;

// Parameters
N = 100;
D = 2;   // Decimation factor
L = 2;   // Interpolation factor
f = 5;   // Frequency (reduced for clarity)

// Time and signal
t = 0:0.01:(N-1)*0.01;
x = sin(2 * %pi * f * t);

clc;
clear;
clf;

N = 100;
D = 2;
l = 2;
f = 50;

t = 0:0.001:1;
n = 0:N-1;

x = sin(2 * %pi * f * t);

// Original Signal
subplot(3,1,1);
plot2d3(n, x(1:N));
title("Original Signal");

// Decimation
y = x(1:D:N);
m = 0:length(y)-1;

subplot(3,1,2);
plot2d3(m, y);
title("Decimated Signal");

// Interpolation
x_new = linspace(0, length(y)-1, length(y)*l);
y1 = interp1(m, y, x_new, 'linear');

subplot(3,1,3);
plot2d3(x_new, y1);
title("Interpolated Signal");
title("Interpolated Signal");
