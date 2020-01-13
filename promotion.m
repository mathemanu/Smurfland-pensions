function[D]=promotion(M)

r = size(M);
X=zeros(r);
theta = 0.01;

for i=1:r(1)
    X(i,2)=binomial(M(i,1),theta,1); %number of promoted junior people to senior 
    X(i,1)=-X(i,2);
end

D = [ 0, 0 ; X]; % promotions can only occur starting at the second year of employment

return