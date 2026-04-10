clc;
clear;
clf;

x = [1 2 3 4];   // given sequence
L = 2;

n = 0:length(x)-1;

subplot(2,1,1);
plot2d3(n, x);
title("Original Sequence");
xlabel("n");
ylabel("x(n)");

// Upsampling (Zero insertion)
y = zeros(1, length(x)*L);
y(1:L:$) = x;

m = 0:length(y)-1;

subplot(2,1,2);
plot2d3(m, y);
title("Interpolated Sequence (Zero Insertion)");
xlabel("m");
ylabel("y(m)");
