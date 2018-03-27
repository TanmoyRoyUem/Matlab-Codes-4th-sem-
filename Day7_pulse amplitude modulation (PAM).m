%Pulse Amplitude Modulation (PAM)

clc;
close all;
clear all;

fc=100;
fm=fc/10;
fs=100*fc;

t=0:0.0001:1;
mt=cos(2*pi*fm*t);
subplot(4,1,1)
plot(t,mt,'r')
title('Message Signal')
xlabel('Time')
ylabel('Amplitude')

ct=0.5*(square(2*pi*fc*t)+1);
subplot(4,1,2)
plot(t,ct,'b')
title('Carrier Signal')
xlabel('Time')
ylabel('Amplitude')

PAM=mt.*ct;
subplot(4,1,3)
plot(t,PAM)
title('PAM Signal')
xlabel('Time')
ylabel('Amplitude')

dem=PAM.*ct;
filter=fir1(200,fm/fs,'low');
demod_signal=conv(filter,dem);
t1=linspace(0,1,length(demod_signal));
subplot(4,1,4)
plot(t1,demod_signal,'m')
title('DEMODULATED PAM SIGNAL')
xlabel('Time')
ylabel('Amplitude')
