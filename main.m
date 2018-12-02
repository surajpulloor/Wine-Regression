function void = main()

    clear ; close all; clc

    % Load wine data
    load ('wine_random.mat');
    disp('Wine Data loaded!!!');
    inds = [];
    lambda = [0];
    jVal_history_training = [];
    jVal_history_test = [];


    
    [X_training, y_training, X_test, y_test, theta] = initVar(wine_randomized);
    disp('X_training, y_training, X_test, y_test, theta initialized!!!');
    
    % Join Labels y_train and y_test
    y = [y_training; y_test];

    printf('\n\n************Regularized Logistic Regression*************\n');

    for j = 1:size(lambda, 1),

        % There are 3 class of wines in our training set
        num_labels = 3;

        thetas = [];

        disp('**************************************************************');
        printf('* Lambda = %f\n', lambda(j));
        printf('*\n');
        printf('**************************************************************\n\n');

        for i = 1:num_labels,
            printf('\n%d) Training on X for k = %d\n', i, i);
            y_k = (y_training == i);
            theta = gd(theta, X_training, y_k, lambda(j));
            thetas = [thetas theta];
            theta = zeros(size(X_training, 2), 1);
        end;


        h_x_training = sigmoid(X_training * thetas);
        h_x_test = sigmoid(X_test * thetas);

        [val ind] = max([h_x_training; h_x_test]');
        
        disp('Index comparison');
        disp('Actual Label(y_k) | Prediction(h_(x))');
        disp([y ind']);

        % Cost Function for training set
        printf('Cost Function for Training Set\n');
        jVal_acc = 0;
        for i = 1:3,
            y_k = (y_training == i);
            [jVal grad] = costFunction(thetas(:, i), X_training, y_k, lambda(j));
            jVal_acc = jVal_acc + jVal;
            printf('%d) jVal=%d for k=%d\n', i, jVal, i);
        end;
        
        jVal_history_training = [jVal_history_training; jVal_acc];

        printf('Total Cost Function: %f\n', jVal_acc);

        % Cost Function for test set
        printf('Cost Function for Testing Set\n');
        jVal_acc = 0;
        for i = 1:3,
            y_k = (y_test == i);
            [jVal grad] = costFunction(thetas(:, i), X_test, y_k, lambda(j));
            jVal_acc = jVal_acc + jVal;
            printf('%d) jVal=%d for k=%d\n', i, jVal, i);
        end;

        jVal_history_test = [jVal_history_test; jVal_acc];

        printf('Total Cost Function: %f\n', jVal_acc);

        printf('**************************************************************\n\n');
        
    end;

    
    % Display Values of Cost Fuction and lambda
    disp('');
    disp('J(theta) history for training case');
    disp('*****************************************************************');
    disp('Cost Function values | Lambda values');
    disp([jVal_history_training lambda]);
    disp('*****************************************************************');

    disp('');
    disp('J(theta) history for test case');
    disp('*****************************************************************');
    disp('Cost Function values | Lambda values')
    disp([jVal_history_test lambda]);
    disp('*****************************************************************');