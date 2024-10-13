%function [w,beta]=SSGD_method(A,w0,beta0,t,lambda,ita)
%A.....the data set columns of A represent the vectors x(i)
%max_iter=1000.......max number of iterations
%w0 =sprand(n,1,0.05)........initial value of w
%w=w0;
%beta=rand...........initial value for beta
lambda=1e-4;
B=zeros(1,n);
% Set the values of function y(i)=1 if x(i) \in A or y(i)=-1 if y(i) \in B
K=zeros(n,m);
iter=0;
ita=1e-2;
% Set the values of function y(i)=1 if x(i) \in A or y(i)=-1 if y(i) \in B
while (iter<max_iter)
    for i=1:m
        x=y(1,i)*w'*A(:,i)+beta;
        l=exp(x);
        k=-y(1,i)*l/(l+1);
        K(:,i)= 2*lambda*w+k*A(:,i);
        B(1,i)=k;
    end
    z=randi(m+1);
    grad=K(:,z);
    gradbeta=B(1,z);
    w=w-ita*grad;
    beta=beta-ita*gradbeta;
    iter=iter+1;
end
