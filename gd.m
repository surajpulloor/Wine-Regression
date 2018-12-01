function optTheta = gd(theta, X, y, lambda)
    % Un-roll parameters for fminunc
    theta = theta(:);
    % We are providing the gradient's and iteration count and run fminunc
    options = optimset('GradObj', 'on', 'MaxIter', 600);
    optTheta = fminunc(@(t)(costFunction(t, X, y, lambda)), theta, options);
    % Resize output Theta
    optTheta = reshape(optTheta, 14, 3);