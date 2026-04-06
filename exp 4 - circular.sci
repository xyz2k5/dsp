clc;
clear all;
close all;
x=[2,2];
h=[1,1,-1];
l1=length(x);
l2=length(h);
N=max(l1,l2);
x=[x,zeros(1,N-l1)];
subplot(3,1,1);
plot2d3(x);
xlabel('n');
ylabel('x');
title('Sequence1 ]');
h=[h,zeros(1,N-l2)];
subplot(3,1,2);
plot2d3(h);
xlabel('n');
ylabel('h');
title('Sequence2.');
y=zeros(1,N);
for n=1:N
 for m=1:N
 j=pmodulo(n-m,N);
 r=j+1;
 y(n)=y(n)+x(m)*h(r);
 end
end
subplot(3,1,3);
plot2d3(y);
xlabel('n');
ylabel('y');
title('Circular convolution of the given sequences ');
