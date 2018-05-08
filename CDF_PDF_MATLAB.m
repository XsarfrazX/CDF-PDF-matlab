clc;

close all;

variance=input('Enter the variance of the Normal PDF ');
means=input('Enter the mean of Normal PDF');
a=double(input('Enter the value of a of Uniform distribution'));
b=double(input('enter the value of b of Uniform distribution'));
x=-10:.01:10;
pdf_normal=exp(-0.5*((x-means).^2)/variance)/(sqrt(variance*2*pi));
syms x
t=int(exp(-0.5*((x-means).^2)/variance)/(sqrt(variance*2*pi)),x);
x=-10:.01:10;
cdf_int_normal=(subs(t));
%cdf_normal=0.5*(1+erf((x-means)/sqrt(2*variance)));
figure(1)
grid on
subplot(2,1,1),plot(x,pdf_normal),title('Normal or Gaussian PDF'),xlabel('X'),ylabel('PDF f(x)'),grid on
subplot(2,1,2),plot(x,cdf_int_normal),title('Normal or Gaussian CDF'),xlabel('X'),ylabel('CDF F(x)'),grid on   


for i=1:2001
    if(x(1,i)>=a) && (x(1,i)<=b)
        pdf_uniform(1,i)=1/(b-a);
    else
        pdf_uniform(1,i)=0;
    end
end

for i=1:2001
   
    if(x(1,i)>=a) && (x(1,i)<=b)
        cdf_uniform(1,i)=(x(1,i)-a)/(b-a);
    elseif x(1,i)<a
        cdf_uniform(1,i)=0;
    else
        cdf_uniform(1,i)=1;
    end
end
figure(2)
grid on
subplot(2,1,1),plot(x,pdf_uniform),title('Uniform PDF'),xlabel('X'),ylabel('PDF f(x)'),grid on
subplot(2,1,2),plot(x,cdf_uniform),title('Uniform CDF'),xlabel('X'),ylabel('CDF F(x)'),grid on   



   
