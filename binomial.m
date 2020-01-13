function[Y]=binomial(n,p,m) 
%crea vettore 1xm di realizzazioni di v.a. i.i.d. B(n,p)
%X=sum(Z(i))con Z(i)=B(1,p) indip - Binomiale e' somma di Bernoulli

Y=sum(Bernoullimatrix(p,n,m));

end