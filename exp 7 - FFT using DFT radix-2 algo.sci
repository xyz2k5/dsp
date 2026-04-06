clc;
clear;
close;
x = [1,0,1,0,1,0,1,0];
N = length(x);
for i = 1:4
    w(i) = exp(-%i * 2 * %pi * (i-1) / N);
end 
disp("Twiddle factors:",w)
y = [1,1,1,1,0,0,0,0];
for i = 1:2:N
    s(i)= y(i) + w(1) * y(i+1);
    s(i+1) = y(i) - w(1) * y(i+1);
end
disp("stage1:",s)
for i = 1:4:N
    s1(i)   = s(i)   + w(1) * s(i+2);
    s1(i+1) = s(i+1) + w(3) * s(i+3);
    s1(i+2) = s(i)   - w(1) * s(i+2);
    s1(i+3) = s(i+1) - w(3) * s(i+3);
end
disp("stage2:",s1)
for i = 1:4
    s2(i)   = s1(i)   + w(i) * s1(i+4);
    s2(i+4) = s1(i)   - w(i) * s1(i+4);
end
disp("stage3:",s2)
k = 1:N;
subplot(3,2,1);
plot2d3(k,abs(s2),3);
xlabel("Frequency");
ylabel("Magnitude");
title("magnitude response_417");
subplot(3,2,2);
plot2d3(k, atan(imag(s2),real(s2)),3);
xlabel("Frequency");
ylabel("amplitude");
title("phase response");
subplot(3,2,3);
plot2d3(k, s,3);
xlabel("bit reversal values");
ylabel("normal order values");
title("stage-1 417");
subplot(3,2,4);
plot2d3(k,s1,3);
xlabel("bit reversal values");
ylabel("normal order values");
title("stage-2 417 ");
subplot(3,2,5);
plot2d3(k,s1,3);
xlabel("bit reversal values");
ylabel("normal order values");
title("stage-3 417");
