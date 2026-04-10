clc;
clf;
x=[1,1,0,1];
h=[2,3,1];
N1=length(x);
N2=length(h);
N=N1+N2-1;
x=[x,zeros(1,N-N1)];
x=[x,x];
subplot(3,1,1);
plot2d3(x);
xlabel('n');
ylabel('x');
title('First signal');
h=[h,zeros(1,N-N2)];
h=[h,h];
subplot(3,1,2);
plot2d3(h);
xlabel('n');
ylabel('h');
title('Second signal');
s=zeros(1,N);
for n=1:N
 for k=1:n
 s(n)=s(n)+x(k).*h(N+n-k+1);
 end
end
subplot(3,1,3);
plot2d3(s);
xlabel('n');
ylabel('y');
title('Convolution of signal1 and signal2');
