%Pulse Amplitude Modulation (PAM)

clc;
close all;
clear all;

am=input('Enter Amplitude of Message Signal=>');
fm=input('Enter Frequency of Message Signal=>');
fc=input('Enter Frequency of Carrier Signal=>');

t=0:0.001:1;
mt=am*cos(2*pi*fm*t);
subplot(3,1,1)
plot(t,mt,'r')
title('Message Signal')
xlabel('Time')
ylabel('Amplitude')

ct=((square(2*pi*fc*t)+1));
subplot(3,1,2)
plot(t,ct,'b')
title('Carrier Signal')
xlabel('Time')
ylabel('Amplitude')

PAM=mt.*ct;
subplot(3,1,3)
plot(t,PAM)
title('PAM Signal')
xlabel('Time')
ylabel('Amplitude')