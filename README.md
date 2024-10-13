We have a training data set of n dimensional vectors xi , i = 1, . . . m. 
Each xi belongs to either class A or B. Define yi being 1 if xi ∈ A and −1 if xi ∈ B. 
The convex optimization problem that used to separates class A and B is known as:



Task 2: Show that function G is a convex function that is differentiable. Determine the
formula of the gradient ∇G(w, β).
Task 3: Write the matlab code of Gradient Method with constant linesearch and back-
tracking linesearch to solve
Write the matlab code of SGD for solving (1.3).
In the case that Ki in (1.4) is not differentiable but convex, the SGD is modified in the
following way:
• Initialization: Choose an initial vector x0 and a step size (known also as learning
rate) η > 0.
• General step: For k ≥ 0,
– Pick randomly i ∈ {1, . . . , m}
– Pick any vk ∈ ∂Ki (xk ) and update:
xk+1 := xk − ηvk ,
where the learning rate η is small enough.
This method is known as Stochastic Subgradient Descent.
