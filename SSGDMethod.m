%function [w,beta]=SSGD_method(A,w0,beta0,t,lambda,ita)
%A.....the data set columns of A represent the vectors x(i)
%max_iter=1000.......max number of iterations
%w0 =sprand(n,1,0.05)........initial value of w
%w=w0;
%beta=rand...........initial value for beta
lambda=0.0001;
B=zeros(1,n);
% Set the values of function y(i)=1 if x(i) \in A or y(i)=-1 if y(i) \in B
K=zeros(n,m);
iter=0;
ita=1e-2;
% Set the values of function y(i)=1 if x(i) \in A or y(i)=-1 if y(i) \in B
while (iter<max_iter)
    for i=1:m
        x=1-y(1,i)*(w'*A(:,i)+beta);
        if (x>0)
            K(:,i)=(2*lambda*w -y(1,i)*A(:,i))/m;
            B(1,i)=-y(1,i)/m;
        else
            K(:,i)= 0;
            B(1,i)=0;
        end
    end
    k=randi(m);
    subgrad=K(:,k);
    subgradbeta=B(k);
    w=w-ita*subgrad;
    beta=beta-ita*subgradbeta;
    iter=iter+1;
end