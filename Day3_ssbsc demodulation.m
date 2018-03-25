%ssbsc demodulation with filter 

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
p=mt.*cos(2*pi*fc*t);
ht=am*sin(2*pi*fm*t); %hilbert transformation
q=ht.*sin(2*pi*fc*t);
susb=p-q;
slsb=p+q;

dem=susb.*cos(2*pi*fc*t); %demodulated susb signal
dem1=slsb.*cos(2*pi*fc*t); %demodulated slsb signal

%applying filter on susb demodulation
[b,a]=butter(10,0.1);
dem2=filter(b,a,dem);

%applying filter on slsb demodulation
[b,a]=butter(10,0.1);
dem3=filter(b,a,dem1);

%message signal
subplot(6,1,1);
plot(t,mt);
title('message signal')
xlabel('t')
ylabel('amplitude')

%carrier signal
subplot(6,1,2);
plot(t,ct);
title('carrier signal')
xlabel('t')
ylabel('amplitude')

%ssbsc usb modulated signal
subplot(6,1,3);
plot(t,susb);
title('ssbsc usb modulated signal')
xlabel('t')
ylabel('amplitude')

%ssbsc usb demodulated signal with filter
subplot(6,1,4);
plot(t,dem2);
title('ssbsc usb demodulated signal')
xlabel('t')
ylabel('amplitude')

%ssbsc lsb modulated signal
subplot(6,1,5);
plot(t,slsb);
title('ssbsc lsb modulated signal')
xlabel('t')
ylabel('amplitude')

%ssbsc lsb demodulated signal with filter
subplot(6,1,6);
plot(t,dem3);
title('ssbsc lsb demodulated signal')
xlabel('t')
ylabel('amplitude')
