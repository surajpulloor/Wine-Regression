function [jVal, grad] = costFunction(theta, X, y, lambda)
    
    m = size(X, 1);

    jVal = -1/m * (y' * log(sigmoid(X * theta)) + (1-y)' * log(1 - sigmoid(X * theta))) + lambda/(2*m) * sum(theta .^ 2);

    grad = 1/m * (X' * (sigmoid(X * theta) - y));

    grad = [grad(1); grad(2:end) + lambda/m * (theta(2:end))];