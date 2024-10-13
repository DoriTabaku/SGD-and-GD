tic;
n=13;
m=220;
M=270;
alpha=0.5;
gama=0.5;
max_iter=1000;
w0 =sprand(n,1,0.05);
w=w0;
beta=rand;
lambda=1e-4;
B=zeros(1,n);
A=zeros(n,m);
% Set the values of function y(i)=1 if x(i) \in A or y(i)=-1 if y(i) \in B
K=zeros(n,m);
iter=0;
G=0;
load heart.dat ;
C=heart;
t=1e-8;
for i=1:M
    for j=1:n
        A(j,i)=C(i,j);
    end
end
y=ones(1,M);%Abscence of heart disease y=1, Presence of heart disease y=-1
for i=1:M
    if C(i,n+1)==2
        y(1,i)=-1;
    end
end
for i=1:m
    x=y(1,i)*w'*A(:,i)+beta;
    l=exp(x);
    G=G+log(1+exp(x));
end

while (iter<max_iter)
    for i=1:m
        l=exp(y(1,i)*(w'*A(:,i)+beta));
        k=-y(1,i)*l/(l+1);
        K(:,i)= (2*lambda*w+k*A(:,i))/m;
        B(1,i)=k/m;
    end
    gradbeta=0;
    grad=zeros(n,1);
    for i=1:m
        grad=grad+K(:,i);%Calculate the gradient w.r.t w
        gradbeta=gradbeta+B(1,i);%Calculate the partial derivative w.r.t beta
    end
    w=w-t*grad;
    beta=beta-t*gradbeta;
    G_val=G;
    G=0;
    for i=1:m
        x=y(i)*w'*A(:,i)+beta;
        G=G+(log(1+exp(x)))/m;
    end
    N=sum(grad.^2,'all')+gradbeta^2;
    while (abs(G_val-G))<alpha*t*N
        t=gama*t;
    end
    iter=iter+1;
end
r=0;
for i=1:M
    g=w'*A(:,i)+beta;
    if g>=0 & y(1,i)==1
        r=r+1;
    end
    if g<0 & y(1,i)==-1
        r=r+1;   
    end
end
perc=r*100/(M);
p=round(perc);
toc;
fprintf('The function is accurate in %d %% of cases.\n',p) 