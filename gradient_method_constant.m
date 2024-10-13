%function [w,beta]=gradient_method_constant(C,w0,beta0,t,lambda)
tic
n=13; %The number of features
m=220; %The number of training data
M=270; %The number of data
w0 =sprand(n,1,0.05);%Iniatial data vector
w=w0;
beta=rand; %initial value for the hypreplane
Max_iter=1000
iter=0;
lambda=1e-4;
% Set the values of function y(i)=1 if x(i) \in A or y(i)=-1 if y(i) \in B
t=1e-12;
A=C(n,m);
for i=1:M
    if C(i,n+1)==1
        y(1,i)=-1;
    end
end
K=zeros(n,m);
B=zeros(1,m);
while (iter<Max_iter)
    for i=1:m
        x=y(1,i)*w'*A(:,i)+beta;
        l=exp(x);
        k=-y(1,i)*l/(l+1);
        K(:,i)= 2*lambda*w+k*A(:,i);
        B(1,i)=k;
    end
    gradbeta=0;
    grad=zeros(n,1);
    for i=1:m
        grad=grad+K(:,i);%Calculate the gradient w.r.t w
        gradbeta=gradbeta+B(1,i);%Calculate the partial derivative w.r.t beta

    end
    w=w-t*grad;
    beta=beta-t*gradbeta;
    iter=iter+1;
end
r=0;
for i=1:M
    g=w'*A(:,i)+beta;
    if (g>=0 & y(1,i)==1)
        r=r+1;
    end
    if (g<0 & y(1,i)==-1)
        r=r+1;   
    end
end
perc=r*100/(M);
p=round(perc);
toc
fprintf('The function is accurate in %d %% of cases.\n',p)
