%power calculation of ssbsc signal

close all
clear all
clc
    
am=input('amplitude of message signal=');
fm=input('frequency of message signal=');
ac=input('amplitude of carrier signal=');
fc=input('frequency of carrier signal=');

mt=am*cos(2*pi*fm*t); %message signal
ct=ac*cos(2*pi*fc*t); %carrier signal
p=mt.*cos(2*pi*fc*t); %amplitude modulated signal
ht=am*sin(2*pi*fm*t); %hilbert transformation
q=ht.*sin(2*pi*fc*t);
susb=p-q; %ssbsc with usb
slsb=p+q; %ssbsc with lsb

%power calculation of ssbsc signal
pc=(ac*ac)/2;
ma=am/ac;
power=pc*(ma*ma)/4;
display (power);