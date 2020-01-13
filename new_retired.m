function[P,M]=new_retired(M)
%calculate number of new retired people; M = matrix of retirement candidates

r = size(M);
X=zeros(r);
theta = 0.6;

for i=1:r(1)
    X(i,1)=binomial(M(i,1),theta,1); % junior people deciding to retire
    X(i,2)=binomial(M(i,2),theta,1); % executive people deciding to retire
end

P=sum(sum(X)); %new retired people
M=M-X; %people that will still be working the following year

return