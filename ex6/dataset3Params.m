function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
values = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
best_error = -1;

for i = 1:size(values, 1)
  for j = 1:size(values, 1)
    C_probe = values(i);
    sigma_probe = values(j);
    fprintf(['Test values: C = %f, sigma = %f\n'], C_probe, sigma_probe);

    model = svmTrain(X, y, C_probe, @(x1, x2) gaussianKernel(x1, x2, sigma_probe)); 
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval));
    
    if (best_error == -1 || error < best_error)
      best_error = error;
      C = C_probe;
      sigma = sigma_probe;
    end  
  end  
end  

fprintf(['Best parameters: C = %f, sigma = %f\n'], C, sigma);

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







% =========================================================================

end
