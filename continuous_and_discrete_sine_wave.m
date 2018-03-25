%continuous and discrete sine wave

close all
clear all
clc
    
am=input('amplitude of message signal=');
fm=input('frequency of message signal=');

t=0:0.01:1;

m=am*sin(2*pi*fm*t);

%sine wave
subplot(2,1,1);
plot(t,m);
title('sine wave')
xlabel('t')
ylabel('amplitude')

%discrete sine wave
subplot(2,1,2);
stem(t,m);
title('discrete sine wave')
xlabel('t')
ylabel('amplitude')