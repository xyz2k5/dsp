clc;
clear;
clf;
N = 1024;
fs = 8000;
// Input frequency
f = input("Enter the frequency [1 to 5000]: ");
// Sample index
n = 0:N-1;
// Signal generation
x = sin(2 * %pi * (f/fs) * n);\
// -------- Window (IMPORTANT for smooth graph) --------
w = window('hm', N);
xw = x .* w;
// -------- FFT --------
X = fft(xw, 1);
// -------- PSD --------
Pxx = abs(X).^2 / (fs * sum(w.^2));
// -------- Frequency axis --------
f_axis = (0:N-1)*(fs/N);
// -------- Plot (half spectrum like your image) --------
plot(f_axis(1:N/2), 10*log10(Pxx(1:N/2) + 1e-12));
xlabel("frequency");
ylabel("magnitude");
title("power spectrum");
xgrid();
// -------- Power calculation --------
power = sum(x.^2) / N;
disp("Signal Power:");
disp(power);
