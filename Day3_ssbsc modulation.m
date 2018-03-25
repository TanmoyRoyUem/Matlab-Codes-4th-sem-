%ssbsc modulation

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
p=mt.*cos(2*pi*fc*t); %amplitude modulated signal
ht=am*sin(2*pi*fm*t); %hilbert transformation
q=ht.*sin(2*pi*fc*t);
susb=p-q; %ssbsc with usb
slsb=p+q; %ssbsc with lsb

%message signal
subplot(4,1,1);
plot(t,mt);
title('message signal')
xlabel('t')
ylabel('amplitude')

%carrier signal
subplot(4,1,2);
plot(t,ct);
title('carrier signal')
xlabel('t')
ylabel('amplitude')

%ssbsc usb signal
subplot(4,1,3);
plot(t,susb);
title('ssbsc usb signal')
xlabel('t')
ylabel('amplitude')

%ssbsc lsb signal
subplot(4,1,4);
plot(t,slsb);
title('ssbsc lsb signal')
xlabel('t')
ylabel('amplitude')
