clc;
clear;
clf;
omegac = 15;
omegas = 30;
deltas = 10;
deltap = 3;
omegacr = 2*%pi*omegac;
omegasr = 2*%pi*omegas;
N1 = log10(10^(0.1*deltas)-1)/(2*log10(omegasr/omegacr));
N = ceil(N1);
a = omegacr;
s = poly(0,'s');
den = 1;
if modulo(N,2)==1 then
    den = s + a;
    for k = 1:(N-1)/2
        bk = 2*sin((2*k-1)*%pi/(2*N));
        den = den*(s^2 + bk*a*s + a^2);
    end
else
    den = 1;
    for k = 1:N/2
        bk = 2*sin((2*k-1)*%pi/(2*N));
        den = den*(s^2 + bk*a*s + a^2);
    end
end
num = a^N;
H = syslin('c',num,den);
disp(H);
[fr,hf] = repfreq(H,0,45);
plot(fr,abs(hf),'r');
xgrid();
xlabel("Frequency (Hz)");
ylabel("Gain");
title("Analog Butterworth Low Pass Filter_0417");

