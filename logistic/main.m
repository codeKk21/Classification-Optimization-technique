clear all;
%Read the csv file of training set 
data = csvread("train.csv");
%splitting the data into sample matrix and label vector 
X = data(2:end,2:15);
y = data(2:end,1);
% finding out the best threshhold value for classification and lambda of reguralization  which give the less 
% error in the validation set 
[thresh lambda] = Bestsolution(X,y);
%scaled the data into between (0 - 1)
X = (X-min(X(:))) ./ (max(X(:)-min(X(:))));
[m,n] = size(X);
%initialising the initial value of theta 
initial_theta = zeros(n,1);
%setting the option of  optimiztion function fminunc
options = optimset('GradObj', 'on', 'MaxIter', 500);
% training with the best lambda value
[theta, cost] = fminunc(@(t)(CostFunction(t, X, y,lambda)), initial_theta, options);
% reading the test dataset
data = csvread('test.csv');
%splitting the data into sample matrix
X = data(2:end,2:15);
%predicted the result of test set on the basis of output of svm trained model 
X= (X-min(X(:))) ./ (max(X(:)-min(X(:))));
% predicting the result i.e output of test file on the he edge of best threshhold value 
result = sigmoid(theta,X);
result = result > thresh;
%saved the file 
save result.csv result;