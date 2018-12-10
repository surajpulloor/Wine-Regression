function [precision, recall] = precisionAndRecall(h_x_indices, y_test)
%PrecisionAndRecall - Precison and Recall metric implementation
%
% Syntax: [precision, recall] = PrecisionAndRecall(h_x_indices, y_test)
%
% Long description
    
    classes = [1;2;3];

    precision = 0;
    recall = 0;

    % printf('\n\n**********Computing Precision & Recall***********\n\n');

    for i = 1:length(classes),

        % printf('%d) Precision of h_x for class=%d\n', i, classes(i));
        % printf('i.e class=%d is treated as positive class, and the other two classes are treated as negative classes\n', classes(i));

        % Convert both y_test labels and h_x_indices into positive and negative classes i.e 0's and 1's
        y_test_for_class = y_test == classes(i);
        h_x_indices_for_class = h_x_indices == classes(i);

        % Find the no. of 1's and 0's for the y label
        y_test_1s = y_test_for_class == 1;
        y_test_0s = y_test_for_class == 0;

        % Find the no. of 1's and 0's for the h_x_indices label
        h_x_indices_1s = h_x_indices_for_class == 1;
        h_x_indices_0s = h_x_indices_for_class == 0;


        % True Positive
        truePositive = abs(length(find(h_x_indices_1s)) - length(find(y_test_1s)));

        % False Positive
        falsePositive = abs(length(find(h_x_indices_1s)) - length(find(y_test_0s)));

        % False Negative
        falseNegative = abs(length(find(h_x_indices_0s)) - length(find(y_test_1s)));

        % Precision
        precision += truePositive / (truePositive + falsePositive);

        % Recall
        recall += truePositive / (truePositive + falseNegative);

        

        % Print the values
        % printf('\n**For class=%d**,\n**Precision=%d, Recall=%d**\n\n\n', classes(i), precision, recall);

        % pause;
    end;

    % printf('*********End*********\n\n');
end