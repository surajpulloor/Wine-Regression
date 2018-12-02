function [X_training, y_training_matrix, X_test, y_test_matrix, y_training, y_test] = initVar(wineData)
    m = size(wineData, 1);
    n = size(wineData, 2) - 1;
    seventy_pre_examples = ceil(90 * m / 100);

    % Randomize the rows of wine because the whole data is sorted
    wineData = wineData(randperm(size(wineData, 1)), :);

    % For comparsion
    y_training = wineData(1:seventy_pre_examples, 1);
    y_test = wineData(seventy_pre_examples + 1:end, 1);

    %----------70% for training------------------------

    y_training_matrix = [1:3] == wineData(1:seventy_pre_examples, 1);
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
    % X_training = X_training_mean;

    %---------------------------------------------------
    
    %----------30% for training-------------------------

    y_test_matrix = [1:3] == wineData(seventy_pre_examples + 1:end, 1);
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
    % X_test = X_test_mean;

    %---------------------------------------------------