%dsbsc modulation, demodulation with filter and without filter 

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
dsbsc=mt.*cos(2*pi*fc*t); %dsbsc modulated signal
demod=dsbsc.*cos(2*pi*fc*t); %demodulated signal

%applying filter
[b,a]=butter(10,0.1);
filter_demod=filter(b,a,demod);

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

%dsbsc modulated signal
subplot(5,1,3);
plot(t,dsbsc);
title('dsbsc modulated signal')
xlabel('t')
ylabel('amplitude')

%dsbsc demodulated signal
subplot(5,1,4);
plot(t,demod);
title('dsbsc demodulated signal')
xlabel('t')
ylabel('amplitude')

%dsbsc demodulated signal (with filter)
subplot(5,1,5);
plot(t,filter_demod);
title('dsbsc demodulated filtered signal')
xlabel('t')
ylabel('amplitude')