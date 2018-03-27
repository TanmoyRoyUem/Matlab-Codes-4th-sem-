%Pulse Width Modulation (PWM)

clear all
close all;
clc;

t=0:0.001:1;
s=sawtooth(2*pi*10*t+pi);
m=0.75*sin(2*pi*1*t); %message signal
n=length(t);
for i=1:n
    if(m(i)>=s(i))
        pwm(i)=1;
    else
        pwm(i)=0;
    end
end
plot(t,pwm,'-g',t,m,'--r',t,s,'--b')
title('PWM WAVE')
grid on;
axis([0 1 -1.5 1.5]);