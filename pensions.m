function[Y]=pensions(Mage,mage,lambda,y)
%Mage= max age to retire; mage = min age to retire; lambda = Poisson
%parameter; y = starting year when we want to
%observe pensions

l=Mage-25; %25 = age at which everybody needs to start working!

L=zeros(l,2);
L(1,1)=80; %initial number of employees 
L(1,2)=20; %initial number of executives

s=0; %leftover movey from previous year
Y=zeros(1,100+y); %vector collecting all the value of the penbsions over the years
P=20; %initial number of retired people 

for i=1:100+y
        
    workers=sum(L);
    S=workers(1)*(1000/5)+workers(2)*(3000/5)+s; % yearly contribution from workers (+ possible leftover from previous year); executives give a bigger contribution w.r.t. juniors
    if P==0 
        s=S;
    else
        Y(i)=S/P;% pension is equally distributed among retired people
        s=0;
    end
    new=poisson(lambda); % new employees (all juniors)
    V=[new, 0]; 
    
    pp = 0.1;
    nP=binomial(P,pp,1); % deaths among retired people
    
    P=P+L(l,1)+L(l,2) -nP; % new amount of retired people
    L=[V ; L(1:l-1,:)];
    
    [C,M]=new_retired(L(mage-25:l,:)); 
    L=[L(1:mage-26,:); M]; %updated matrix with workers
    
    D = promotion(L(2:l,:)); 
    L = L + D; %promotions taken into account
    
    P=P+C; % updated amount of retired people
end