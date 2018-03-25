%fourier transfromation of message, carrier, ssbsc usb and ssbsc lsb

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
n=length(mt);
fourier_mt=abs(fftshift(fft(mt)));
f=[-n/2:n/2-1]/n;
subplot(4,1,1);
plot(f,fourier_mt);
title('message signal')
xlabel('f')
ylabel('amplitude')

%carrier signal
n=length(ct);
fourier_ct=abs(fftshift(fft(ct)));
f=[-n/2:n/2-1]/n;
subplot(4,1,2);
plot(f,fourier_ct);
title('carrier signal')
xlabel('f')
ylabel('amplitude')

%ssbsc usb modulated signal
n=length(susb);
fourier_usb=abs(fftshift(fft(susb)));
f=[-n/2:n/2-1]/n;
subplot(4,1,3);
plot(f,fourier_usb);
title('ssbsc usb signal')
xlabel('f')
ylabel('amplitude')

%ssbsc lsb modulated signal
n=length(slsb);
fourier_lsb=abs(fftshift(fft(slsb)));
f=[-n/2:n/2-1]/n;
subplot(4,1,4);
plot(f,fourier_lsb);
title('ssbsc lsb signal')
xlabel('f')
ylabel('amplitude')
