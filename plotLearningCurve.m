function void = plotLearningCurve(X, y, X_test, y_test, lambda)
%plotLearningCurve - Plot Learning Curve i.e errors of training set and test set
%
% Syntax: void = plotLearningCurve(X, y, X_test, y_test, lambd)
%
% Long description

m = ceil(size(X, 1) * 70/100);

[errors_train, errors_test] = learningCurve(X, y, X_test, y_test, lambda, m);

disp('Plotting Training Set Error & Test Set Error\n');

% Plot Training Error and Test Error
plot(1:m, errors_train, 1:m, errors_test);

title('Learning Curve');
xlabel('no. of training examples');
ylabel('errors');

end