We have a training data set of n dimensional vectors xi , i = 1, . . . m. 
Each xi belongs to either class A or B. Define yi being 1 if xi ∈ A and −1 if xi ∈ B. 
The convex optimization problem that used to separates class A and B is known as:

```math
\min_{w, \beta\in R^n\times R} \frac{1}{2}\|w\|^2
```
subject to 
```math
y_i(w^Tx_i+\beta)\geq 1, \, i=1,2...m
```
The minimizer of this problem 
```math 
(\overline{w}, \overline{\beta})
```
will separate the classes by using a hyperplane
```math
H:=\{x\in R^n:w^Tx+\beta\geq 0\}
```
The problem is reguralized by using the "hinge-loss" or the "soft-margin"
```math
\min_{w, \beta\in R^n\times R}\, F(w,\beta)= \lambda \|w\|^2 +\frac{1}{m}\sum_{i=1}^m max\{0,1-y_i(w^Tx_i+\beta)\} \, \text{ with } \lambda>0
```
We prove that $F$ is not differentiable, therefore we can not use the gradient descent method.
We use the "log-loss" function to regularize it:
```math
\min_{w, \beta\in R^n\times R} \, G(w,\beta)=\lambda \|w\|^2 +\sum_{i=1}^m \frac{1}{m} \, \ln[1+\exp(-y_i(w^Tx_i+\beta))] \, \text{ with } \lambda>0
```
When m is large, gradient method with computation of ∇G could be expensive. To
overcome this situation, one may use the so-called Stochastic Gradient Descent (SGD)
method. SGD is a typical method used to solve the following optimization problem:
```math
\min \, K(x)=\sum_{i=1}^m K_i(x)
```
where K_i are differentiable functions and m is a large number.
Task 1: We have proven that function G is a differentiable convex function. Please determine the formula for the gradient ∇G(w, β). Additionally, we provide the MATLAB code for the Gradient Method with constant linesearch and back-tracking linesearch to solve for the minimum of G. Also, we include the MATLAB code for Stochastic Gradient Descent (SGD) to find the minimum of G. If G is not differentiable but still convex, the SGD needs to be modified. This modified method is known as Stochastic Subgradient Descent.  We wrote the code for the (SSGD) and applied it in two real datasets: http://archive.ics.uci.edu/ml/datasets/statlog+(heart) and https://www.kaggle.com/uciml/pima-indians-diabetes-database.
