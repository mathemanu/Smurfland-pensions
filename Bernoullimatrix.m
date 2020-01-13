function[X]=Bernoullimatrix(p,m,n)

U=rand(m,n);
X=U>(1-p); % generates a matrix of independent Bernoullians; X = indicator function of (1-p,p]
return
