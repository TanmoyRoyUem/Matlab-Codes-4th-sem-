% Pulse position modulation

clc;
clear all;
close all;

t=0:0.001:1;

m=0.75*sin(2*pi*2*t);
subplot(5,1,1)
plot(t,m,'r')
title('Message signal')
xlabel('Time')
ylabel('Amplitude')

c=0.5*square(2*pi*10*t)+0.5;
subplot(5,1,2)
plot(t,c,'m')
title('Carrier Signal')
xlabel('Time')
ylabel('Amplitude')

v=m.*c;
subplot(5,1,3)
plot(t,v,'b')
title('PAM signal')
xlabel('Time')
ylabel('Amplitude')

s1=sawtooth(2*pi*10*t+pi);
for i=1:length(t)
    if m(i)>s1(i)
        pwm(i)=1;
    else
        pwm(i)=0;
    end
end
subplot(5,1,4)
plot(t,pwm,'g')
title('PWM Signal')
xlabel('Time')
ylabel('Amplitude')
axis([0 1 0 2]);

ppm=diff(pwm);
ppm=[0 ppm];
for j=1:length(ppm)
    if ppm(j)>=0
        ppm(j)=0;
    else
        ppm(j)=1;
    end
end
si=find(ppm>0);
l=length(si);
t=0:0.001:1.05;
ppm1=zeros(1,length(t));
for i=1:length(si)
    for j=si(i):si(i)+50
        ppm1(j)=1;
    end
end
subplot(5,1,5)
plot(t,ppm1)
title('PPM signal')
xlabel('Time')
ylabel('Amplitude')
axis([0 1 0 1]);
