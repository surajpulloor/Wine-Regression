function optTheta = gd(theta, X, y, lambda)
    options = optimset('GradObj', 'on', 'MaxIter', 600);
    optTheta = fminunc(@(t)(costFunction(t, X, y, lambda)), theta, options);