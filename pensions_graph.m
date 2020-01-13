function[]=pensions_graph(y,lambda)
%y = current year 
Y1=pensions(70,55,lambda,y);
Y2=pensions(75,60,lambda,y);

Y=[Y1(y+1:100+y); Y2(y+1:100+y)]';

bar(Y,'grouped');
colormap(cool);
title('Pension system of Smurfland')
legend('Scenario 1: retirement window [55,70]','Scenario 2: retirement window [60,75]')
xlabel(['Years starting at ', num2str(y)])
ylabel('Smurf-dollars')

return
