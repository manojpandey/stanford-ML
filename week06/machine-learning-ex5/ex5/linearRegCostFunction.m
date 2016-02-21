function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

difference = (X*theta- y);
unregCost = sum(difference.*difference)/(2*m);
tempTheta = theta(2:end);
thetaSum = sum((tempTheta.*tempTheta));
div = lambda/(2*m);
regTerm = div*thetaSum;
J = unregCost + regTerm;

% ------------------- %
tempTheta = theta;
tempTheta(1) = 0;
difference = (X*theta -y);
colNums = columns(X);
for i = 1:colNums
	grad(i) = sum(difference.*X(:,i))/m;
endfor;

grad = grad + lambda*tempTheta/m;

% =========================================================================

grad = grad(:);

end
