function [X_training, y_training, X_test, y_test, theta] = initVar(wineData)
    m = size(wineData, 1);
    n = size(wineData, 2) - 1;
    seventy_pre_examples = ceil(70 * m / 100);

    % Randomize the rows of wine data set
    % wineData = wineData(randperm(size(wineData, 1)), :);

    %----------70% for training------------------------

    y_training = wineData(1:seventy_pre_examples, 1);
    X_training = [ones(seventy_pre_examples, 1) wineData(1:seventy_pre_examples, 2:end)];

    %--------------------------------------------------
    
    %----------Normalize this training set-------------
    
    % Mean for training set
    X_mean = mean(X_training(:, 2:end));
    % Standard Deviation
    X_std = std(X_training(:, 2:end));
    % Normalized training set
    X_training_mean = [ones(seventy_pre_examples, 1) (X_training(:, 2:end) - X_mean) ./ X_std];
    % Assign the normailed training set to the return variable
    X_training = X_training_mean;

    %---------------------------------------------------
    
    %----------30% for training-------------------------

    y_test = wineData(seventy_pre_examples + 1:end, 1);
    X_test = [ones(m - seventy_pre_examples, 1) wineData(seventy_pre_examples + 1:end, 2:end)];

    %---------------------------------------------------

    %----------Normalize this test set------------------


    % Mean for training set
    X_mean = mean(X_test(:, 2:end));
    % Standard Deviation
    X_std = std(X_test(:, 2:end));
    % Normalized training set
    X_test_mean = [ones(m - seventy_pre_examples, 1) (X_test(:, 2:end) - X_mean) ./ X_std];

    % Assign the normailed training set to the return variable
    X_test = X_test_mean;

    %---------------------------------------------------

    % Init theta
    theta = zeros(n + 1, 1);