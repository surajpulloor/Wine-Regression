function [errors_train, errors_test] = learningCurve(X, y, X_test, y_test, lambda, m)
%learningCurve - Calculate error values for training set and test set
%
% Syntax: [errors_train, errors_test] = learningCurve(X, y, X_test, y_test)
%
% Long description

    errors_train = [];
    errors_test = [];

    printf('\n\n-> Generating Errors for Training set and Test Set for m = %d\n', m);
    printf('-> Learning Parameters for %d examples\n', m);
    printf('-> Learning');
    for i = 1:m,
        if mod(i,2),
            printf('.');
        end;
        % printf('%d) Theta learned for %d examples\n', i, i);
        theta_train = gd(initThetaVar(), X(1:i, :), y(1:i, :), lambda);

        [jVal_train, grad_train] = costFunction(theta_train, X(1:i, :), y(1:i, :), 0);
        [jVal_test, grad_test] = costFunction(theta_train, X_test, y_test, 0);

        errors_train = [errors_train; jVal_train];
        errors_test = [errors_test; jVal_test];
    end;

    printf('\n-> Errors generated!\n');
end