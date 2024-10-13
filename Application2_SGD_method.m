tic;
n=8;
m=500;
M=768;
w0 =sprand(n,1,0.05);
w=w0;
beta=rand;
Max_iter=1000;
lambda=0.0001;
B=zeros(1,n);
% Set the values of function y(i)=1 if x(i) \in A or y(i)=-1 if y(i) \in B
K=zeros(n,m);
A=zeros(n,m);
iter=0;
ita=1e-3;
% Set the values of function y(i)=1 if x(i) \in A or y(i)=-1 if y(i) \in B
load diabetes.txt ;
C=diabetes;
t=1;
for i=1:M
    for j=1:n
        A(j,i)=C(i,j);
    end
end
y=ones(1,M);
for i=1:M
    if C(i,n+1)==0
        y(1,i)=-1;
    end
end

% Set the values of function y(i)=1 if x(i) \in A or y(i)=-1 if y(i) \in B
while (iter<Max_iter)
    for i=1:m
        x=y(1,i)*w'*A(:,i)+beta;
        l=exp(x);
        k=-y(1,i)*l/(l+1);
        K(:,i)= (2*lambda*w+k*A(:,i))/m;
        B(1,i)=k/m;
    end
    z=randi(m);
    grad=K(:,z);
    gradbeta=B(1,z);
    w=w-ita*grad;
    beta=beta-ita*gradbeta;
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
fprintf('The function is accurate in %d %% of cases.\n',p)
 toc;     
 