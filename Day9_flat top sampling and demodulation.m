% Flat top sampling and its demodulation

clc;
clear all;
close all

fc=40;
fm=2;
fs=1000;
t=1;
n=[0:1/fs:1];
n=n(1:end-1);
duty=20;
s=square(2*pi*fc*n,duty);
s(find(s<0))=0;
m=sin(2*pi*fm*n);
period_sample=length(m)/fc;
ind=[1:period_sample:length(n)];
on_sample=ceil(period_sample*duty/100);
pam=zeros(1,length(n));
for i=1:length(ind)
    pam(ind(i):ind(i)+on_sample)=m(ind(i));
end

subplot(4,1,1)
plot(n,m,'r')
title('Message Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(4,1,2)
plot(n,s,'m')
title('Carrier pulse Signal');
xlabel('Time');
ylabel('Amplitude');
ylim([-0.2 1.2])

subplot(4,1,3)
plot(n,pam,'b')
title('Flat-Top Sampled Signal');
xlabel('Time');
ylabel('Amplitude');
ylim([-1.2 1.2]);

% Demodulation with filter
dt=s.*pam;
filter=fir1(200,fm/fs,'low');
dem=conv(filter,dt);
t1=linspace(0,1,length(dem));
subplot(4,1,4)
plot(t1,dem,'g')
title('Demodulated Sampled Signal');
xlabel('Time');
ylabel('Amplitude');
