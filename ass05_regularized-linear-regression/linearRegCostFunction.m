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

predictions=X*theta;
sE=(predictions-y).^2;

Junreg=1/(2*m)*sum(sE); % unregularized cost function

grad = (1/m)*X'*(predictions - y); % unregularized gradient

temp=theta; 
temp(1)=0; % because we don't regularize j = 0 

J=Junreg+(lambda/(2*m))*sum(temp'*temp); %calculates regularized cost function

szLambd=size(lambda)
szTmp=size(temp)

grad=grad+(1/m)*lambda*temp; %regularized gradient
% =========================================================================

grad = grad(:);

end
