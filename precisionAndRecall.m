function [precision, recall] = precisionAndRecall(h_x_indices, y_test)
%PrecisionAndRecall - Precison and Recall metric implementation
%
% Syntax: [precision, recall] = PrecisionAndRecall(h_x_indices, y_test)
%
% Long description
    
    classes = [1;2;3];

    precision = 0;
    recall = 0;

    printf('\n\n**********Computing Precision & Recall***********\n\n');

    for i = 1:length(classes),

        printf('%d) Precision of h_x for class=%d\n', i, classes(i));
        printf('i.e class=%d is treated as positive class, and the other two classes are treated as negative classes\n', classes(i));

        % Convert both y_test labels and h_x_indices into positive and negative classes i.e 0's and 1's
        y_test_for_class = y_test == classes(i);
        h_x_indices_for_class = h_x_indices == classes(i);

        truePositive = 0;
        falsePositive = 0;
        falseNegative = 0;

        for j = 1:length(y_test_for_class),
            if y_test_for_class(j) == 1 && h_x_indices_for_class(j) == 1,
                truePositive += 1;
            elseif y_test_for_class(j) == 0 && h_x_indices_for_class(j) == 1,
                falsePositive += 1;
            elseif y_test_for_class(j) == 1 && h_x_indices_for_class(j) == 0,
                falseNegative += 1;
            end;

        end;

        % Precision
        precision = truePositive / (truePositive + falsePositive);

        % Recall
        recall = truePositive / (truePositive + falseNegative);

        

        % Print the values
        printf('\n**For class=%d**,\n**Precision=%d, Recall=%d**\n\n\n', classes(i), precision, recall);

        pause;
    end;

    printf('*********End*********\n\n');
end