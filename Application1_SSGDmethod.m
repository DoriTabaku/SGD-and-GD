%function [w,beta]=SGD_method(A,w0,beta0,t,lambda,ita)
tic;
max_iter=500;
n=13;
m=220;
M=270;
w0 =sprand(n,1,0.05);
w=w0;
beta=rand;
lambda=1e-4;
B=zeros(1,n);
% Set the values of function y(i)=1 if x(i) \in A or y(i)=-1 if y(i) \in B
K=zeros(n,m);
iter=0;
ita=1e-7;
% Set the values of function y(i)=1 if x(i) \in A or y(i)=-1 if y(i) \in B
load heart.dat ;
C=heart;
t=1e-2;
for i=1:M
    for j=1:n
        A(j,i)=C(i,j);
    end
end
y=ones(1,M);
for i=1:M
    if C(i,n+1)==1
        y(1,i)=-1;
    end
end

while (iter<max_iter)
    
    for i=1:m
        if (1-y(1,i)*(w'*A(:,i)+beta))>0
            K(:,i)=(2*lambda*w -y(1,i)*A(:,i))/m;
            B(i)=-y(1,i)/m;
        else
            K(:,i)= 2*lambda*w/m;
            B(i)=0;
        end
    end
    
    k=randi(m);
    subgrad=K(:,k);
    subgradbeta=B(k);
    w=w-ita*subgrad;
    beta=beta-ita*subgradbeta;
    iter=iter+1;
end
for i=m+1:270
    for j=1:n
        D(j,i)=C(i,j);
    end
end

for i=m+1:270
    if C(i,n+1)==2
        y(i)=-1;
    else 
        y(i)=1;
    end
end
r=0;
for i=m:M
    g=w'*A(:,i)+beta;
    if g>=0 & y(1,i)==1
        r=r+1;
    end
    if g<0 & y(1,i)==-1
        r=r+1;   
    end
end

perc=r*100/(M-m);
p=round(perc);
fprintf('The function is accurate in %d %% of cases.\n',p)
toc;     