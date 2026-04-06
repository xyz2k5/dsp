clc;
clear;
close;
x = [1 2 3 4];
N = length(x);
X = zeros(1, N);
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-%i * 2 * %pi * k * n / N);
    end
end
X = clean(X);
disp("DFT coefficients");
disp(X);
magX = abs(X);
subplot(2,1,1);
plot2d3(0:N-1, x);
xlabel("Time index n");
ylabel("Amplitude");
title("Discrete-Time Input Signal");
subplot(2,1,2);
plot2d3(0:N-1, magX);
xlabel("Frequency index k");
ylabel("Magnitude");
title("Magnitude Spectrum of DFT");
