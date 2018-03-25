%Phase demodulation (always give kp=2)

clc;
close all;
clear all;

t=0:0.001:1;

am=input('Enter message amplitude: ');
fm=input('Enter message frequency: ');
ac=input('Enter carrier amplitude: ');
fc=input('Enter carrier frequency: ');
kp=input('Enter value of phase sensitivity: ');

mt=am*cos(2*pi*fm*t);
ct=ac*cos(2*pi*fc*t);
pt=ac*cos((2*pi*fc*t)+kp*mt); %phase modulated signal
pmh=hilbert(pt);
dem1=unwrap(angle(pmh));
dem2=dem1-(2*pi*fc*t); %demodulated signal

subplot(4,1,1);
plot(t,mt);
title('MESSAGE SIGNAL')
xlabel('time')
ylabel('amplitude')

subplot(4,1,2);
plot(t,ct);
title('CARRIER SIGNAL')
xlabel('time')
ylabel('amplitude')

subplot(4,1,3);
plot(t,pt);
title('PHASE MODULATED SIGNAL')
xlabel('time')
ylabel('amplitude')

subplot(4,1,4);
plot(t,dem2);
title('PHASE DEMODULATED SIGNAL')
xlabel('time')
ylabel('amplitude')