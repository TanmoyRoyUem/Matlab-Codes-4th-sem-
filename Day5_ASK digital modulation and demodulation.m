%ASK modulation and demodulation

close all;
clear all;
clc;

fc=20;
m=rand(1,8);
l=length(m);
for i=1:1:l
    if m(i)>= 0.5
        m(i)=1;
    else
        m(i)=0;
    end
end
m(l+1)=1;
tn=0:l;

%Message Signal
subplot(5,1,1);
stairs(tn,m);
xlabel('Time(s)');
ylabel('Amplitude(V)');
title('Message Signal');
 
%Carrier generation
t=0:0.01:l;
c=sin(2*pi*fc*t);
subplot(5,1,2);
plot(t,c);
xlabel('Time(s)');
ylabel('Amplitude(V)');
title('Carrier Signal');
 
%ASK Modulated signal generation
 for i=1:l
     for j=(i-1)*100:i*100
         if(m(i)==1);
            s(j+1)=c(j+1);
        else
            s(j+1)=0;
         end
     end
end
subplot(5,1,3);
plot(t,s);
xlabel('Time(s)');
ylabel('Amplitude(V)');
title('ASK SIGNAL');

subplot(5,1,4);
stem(m);
xlabel('Time(s)');
ylabel('Amplitude(V)');
title('DISCRETE MESSAGE SIGNAL');

%ASK Demodulated signal generation
for i=1:l;
    for j=(i-1)*100:i*100;
        if(s(j+1)==c(j+1));
            x(j+1)=1;
        else
            x(j+1)=0;
        end
    end
end
subplot(5,1,5);
plot(t,x);
xlabel('Time(s)');
ylabel('Amplitude(V)');
title('Demodulated  Signal');
