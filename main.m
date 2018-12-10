function void = main()

    clear ; close all; clc

    % Load wine data
    load ('wine_random.mat');
    disp('Wine Data loaded!!!');
    lambda = [0;0.001;0.002;0.004;0.008];
    jVal_training_history = [];
    jVal_test_history = [];
    h_x_training_accuracy = [];
    h_x_test_accuracy = [];
    elapsed_time = [];


    [X_training, y_training, X_test, y_test, theta] = initVar(wine_randomized);
    disp('X_training, y_training, X_test, y_test, theta initialized!!!');
    
    % Join Labels y_train and y_test
    y = [y_training; y_test];
    [X_training, y_training_matrix, X_test, y_test_matrix, y_training, y_test] = initVar(wine_randomized);
    disp('X_training, y_training_matrix, X_test, y_test_matrix, theta initialized!!!');


    printf('\n\n************Regularized Logistic Regression*************\n');

    disp('--------------------------TRAINING & TESTING----------------------------');

    disp('Training...');
    disp('Learning parameters theta...');
    for j = 1:size(lambda, 1),

        thetas = initThetaVar();

        % ------------------Training phase------------------
        
        % Time this
        tic();
        thetas = gd(thetas, X_training, y_training_matrix, lambda(j));
        t1 = toc();
        elapsed_time = [elapsed_time; t1];
        disp([num2str(j) ') ' 'Lambda=' num2str(lambda(j)) ' Training completed... Took ' num2str(t1) 's']);

        % -----------------Test phase-----------------------
        
        % Training set
        h_x_training = sigmoid(X_training * thetas);
        
        % Test set
        h_x_test = sigmoid(X_test * thetas);

        % Max h_(x) for each training example
        [val_train ind_train] = max(h_x_training');
        % Max h_(x) for each test example
        [val_train ind_test] = max(h_x_test');
        

        % Calculate percentage accuracy value for h_(x)
        h_x_training_accuracy_percentage = (sum(y_training == ind_train') / size(y_training, 1)) * 100;
        h_x_training_accuracy = [h_x_training_accuracy ;h_x_training_accuracy_percentage];


        % Calculate percentage accuracy value for h_(x)
        h_x_test_accuracy_percentage = (sum(y_test == ind_test') / size(y_test, 1)) * 100;
        h_x_test_accuracy = [h_x_test_accuracy ;h_x_test_accuracy_percentage];

        %-----------------------------------------------------

        % Cost Function for training set
        
        % Calculate Cost Function for training set and add it to jVal_training_history
        [jVal_training, grad_training] = costFunction(thetas(:), X_training, y_training_matrix, lambda(j));
        jVal_training_history = [jVal_training_history; jVal_training];
        

        %------------------------------------------------------

        % Cost Function for test set

        % Calculate Cost Function for test set and add it to jVal_test_history
        [jVal_testing, grad_testing] = costFunction(thetas(:), X_test, y_test_matrix, lambda(j));
        jVal_test_history = [jVal_test_history; jVal_testing];
        

        %-------------------------------------------------------
        
    end;

    disp('------------------------END--TRAINING & TESTING----------------------------');
    
    % Display Values of Cost Fuction and lambda
    disp('');
    disp('--------------------------ANALYSIS--------------------------------------');
    
    disp('');
    disp('1) TIME TO TRAIN');
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    disp('Elpased Time | Lambda');
    disp([elapsed_time lambda]);

    disp('');
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    disp('2) ACCURACY TEST');
    disp('For Training Set:');
    disp('Accuracy of h_(x)% | Lambda Values');
    disp('*****************************************************************');
    disp([h_x_training_accuracy lambda]);
    disp('*****************************************************************');

    disp('')
    disp('For Test Set:');
    disp('Accuracy of h_(x)% | Lambda Values');
    disp('*****************************************************************');
    disp([h_x_test_accuracy lambda]);
    disp('*****************************************************************');
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');

    disp('');
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    disp('3) J(theta) TEST');
    disp('')
    disp('1) For training case');
    disp('*****************************************************************');
    disp('Cost Function values | Lambda values');
    disp([jVal_training_history lambda]);
    disp('*****************************************************************');

    disp('');
    disp('2) For test case');
    disp('*****************************************************************');
    disp('Cost Function values | Lambda values')
    disp([jVal_test_history lambda]);
    disp('*****************************************************************');
    disp('');
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');

    disp('');
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    disp('3) Plotting Learning Curve');
    
    for j = 1:length(lambda),
        printf('\n-----------%d) Learning curve for lambda=%d-----------\n', j, lambda(j));
        plotLearningCurve(X_training, y_training_matrix, X_test, y_test_matrix, lambda(j));
        pause;
    end;

    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');

    disp('')
    disp('------------------------END--ANALYSIS--------------------------------------');