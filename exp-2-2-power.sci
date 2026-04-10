// Determination of power and power spectral density

clc;
clear;

// Parameters
N = 1024;
fs = 8000;

// Input frequency
f = input("Enter the frequency [1 to 5000]: ");

// Time index
n = 0:N-1;

// Signal generation
x = sin(2 * %pi * (f/fs) * n);

// FFT for spectrum
X = fft(x, -1);
Pxx = abs(X).^2 / N;

// Frequency axis
freq = (0:N-1) * (fs/N);

// Plot
plot(freq, 10*log10(Pxx));
xlabel("Frequency (Hz)");
ylabel("Magnitude (dB)");
title("Power Spectrum x(n)");
xgrid();

// Power calculation
power = sum(abs(x).^2) / N;

// Display power
disp("Power of the signal:");
disp(power);
