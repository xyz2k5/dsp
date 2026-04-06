clc;
clear;
close;
b = [1 2 3];
a = [1 0.5 0.3];
N = 512;
w = linspace(0, %pi, N);
H = zeros(1, N);
for k = 1:N
    num = 0;
    den = 0;
    for m = 1:length(b)
        num = num + b(m) * exp(-%i * w(k) * (m-1));
    end
    for n = 1:length(a)
        den = den + a(n) * exp(-%i * w(k) * (n-1));
    end
    H(k) = num / den;
end
mag = abs(H);
phase = atan(imag(H), real(H));
subplot(2,1,1);
plot(w/%pi, mag);
xlabel("Normalized Frequency (\omega/\pi)");
ylabel("|H(e^{j\omega})|");
title("Magnitude Response");
xgrid();
subplot(2,1,2);
plot(w/%pi, phase);
xlabel("Normalized Frequency (\omega/\pi)");
ylabel("Phase (radians)");
title("Phase Response");
xgrid();
