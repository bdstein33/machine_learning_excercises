function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))
%

test_vals = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
results = [];

for C_index = 1:length(test_vals)
  for sigma_index = 1:length(test_vals)
    C_val = test_vals(C_index);
    sigma_val = test_vals(sigma_index);

    model = svmTrain(X, y, C_val, @(x1, x2) gaussianKernel(x1, x2, sigma_val));
    predictions = svmPredict(model, Xval);
    pred_error = mean(double(predictions ~= yval));
    % results(size(results)(1) + 1, 1:3) = [pred_error, C_val, sigma_val];

    results(C_index, sigma_index) = pred_error;
  end
end

[C, sigma] = find(results == min(min(results)));

C = test_vals(C);
sigma = test_vals(sigma);
% =========================================================================

end
