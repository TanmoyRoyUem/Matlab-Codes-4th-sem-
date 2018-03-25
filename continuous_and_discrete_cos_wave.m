%continuous and discrete cos wave

close all
clear all
clc
    
am=input('amplitude of message signal=');
fm=input('frequency of message signal=');

t=0:0.01:1;

m=am*cos(2*pi*fm*t);

%cos wave
subplot(2,1,1);
plot(t,m);
title('cos wave')
xlabel('t')
ylabel('amplitude')

%discrete cos wave
subplot(2,1,2);
stem(t,m);
title('discrete cos wave')
xlabel('t')
ylabel('amplitude')