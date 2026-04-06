clc;
clear;
clf;
omegacr = 200;   
omegasr = 600;  
deltas = 30;   
deltap = 1;      
N1 = log10((10^(0.1*deltas) - 1)/(10^(0.1*deltap) - 1)) / (2 * log10(omegasr/omegacr));
N = ceil(N1);
disp('Butterworth filter order');
disp(N);
a = 2 * %pi * omegacr;   
s = poly(0, 's');
den = 1;
if modulo(N,2) == 1 then
    den = s + a;
    for k = 1:(N-1)/2
        bk = 2 * sin((2*k - 1) * %pi / (2*N));
        den = den * (s^2 + bk*a*s + a^2);
    end
else
    for k = 1:N/2
        bk = 2 * sin((2*k - 1) * %pi / (2*N));
        den = den * (s^2 + bk*a*s + a^2);
    end
end
num = s^N;
H = syslin('c', num, den);
disp('Analog High-Pass filter transfer function');
disp(H);
f = 0:0.1:800;            
w = 2 * %pi * f;           
hf = freq(H.num, H.den, %i*w);
mag = abs(hf);
phase = atan(imag(hf), real(hf)) * 180 / %pi;
subplot(2,1,1)
plot(f, mag, 'b')
xgrid()
xlabel("Frequency (Hz)")
ylabel("Magnitude")
title("High-Pass Magnitude Response------>  ")
subplot(2,1,2)
plot(f, phase, 'r')
xgrid()
xlabel("Frequency (Hz)")
ylabel("Phase (degrees)")
title("High-Pass Phase Response ---->  ")
