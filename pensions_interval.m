function[]=pensions_interval(N,alpha,lambda,y)
%intervals of confidence

Y1=zeros(N,100);
Y2=zeros(N,100);

for i=1:N
    M=pensions(70,55,lambda,y);
    Y1(i,:)=M(y+1:100+y);
    M=pensions(75,60,lambda,y);
    Y2(i,:)=M(y+1:100+y); %matrix Nx100
end

t_alpha=tinv(1-alpha/2,N-1); % t-Student tables

T1=mean(Y1'); %estimator
T2=mean(Y2');

S1=std(Y1'); % sample variance
S2=std(Y2');

I1=[T1-(t_alpha*S1/sqrt(N)); T1+(t_alpha*S1/sqrt(N))]; %matrix with endpoints of intervals of confidence
I2=[T2-(t_alpha*S2/sqrt(N)); T2+(t_alpha*S2/sqrt(N))];

X=[1:N ; 1:N];
Y=X+0.2;

hold on
A=plot(I1,X);
set(A,'Color','c')
A1 = plot(T1,X,'.');
set(A1,'Color','k')
B=plot(I2,Y);
set(B,'Color','m');
B1 = plot(T2,Y,'.');
set(B1,'Color','k')

h = [A(1);B(1)];
legend(h,'Scenario 1: retirement window [55,70]','Scenario 2: retirement window [60,75]') 
title(['Confidence interval on pensions mean over 100 years starting from ' num2str(y)])
xlabel('Smurf-dollars')
ylabel([num2str(N) ' simulations'])

set(gca,'Ylim',[0,N+1])
hold off
