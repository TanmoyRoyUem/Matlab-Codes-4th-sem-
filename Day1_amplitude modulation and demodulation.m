
%Amplitude modulation, demodulation with filter and without filter
%Critical modulation, over modulation and under modulation
close all
clear all
clc
    
am=input('amplitude of message signal=');
fm=input('frequency of message signal=');
ac=input('amplitude of carrier signal=');
fc=input('frequency of carrier signal=');

t=0:0.001:1;

mt=am*cos(2*pi*fm*t); %message signal
ct=ac*cos(2*pi*fc*t); %carrier signal
amt=(ac+mt).*cos(2*pi*fc*t); %modulated signal
dmt=amt.*cos(2*pi*fc*t); %demodulated signal

%applying filter
[b,a]=butter(10,0.1);
fdmt=filter(b,a,dmt);

%message signal
subplot(5,1,1);
plot(t,mt);
title('message signal')
xlabel('t')
ylabel('amplitude')

%carrier signal
subplot(5,1,2);
plot(t,ct);
title('carrier signal')
xlabel('t')
ylabel('amplitude')

%modulated signal
subplot(5,1,3);
plot(t,amt);
title('modulated signal')
xlabel('t')
ylabel('amplitude')

%demodulated signal (without filter)
subplot(5,1,4);
plot(t,dmt);
title('demodulated signal without butter')
xlabel('t')
ylabel('amplitude')

%demodulated signal (with filter)
subplot(5,1,5);
plot(t,fdmt);
title('demodulated signal with butter')
xlabel('t')
ylabel('amplitude')
