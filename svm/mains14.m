clear all;
%Read the csv file of training set 
data = csvread("train.csv");
%splitting the data into sample matrix and label vector 
X = data(2:end,2:15);
y = data(2:end,1);
%scaled the data into between (0 - 1)
X = (X-min(X(:))) ./ (max(X(:)-min(X(:))));
% finding out the best C of svm and sigma of gaussian kernel parameter which give the less error in the validation set 
% in the validation set 
% [bestC bestSigma] = Bestsolution(X,y); it return on running ac bestC = 8  and bestSigma=0.05
bestC =8;
bestSigma=0.05;
% on the basis of result of above call trainng my svm 
model = svmTrain(X, y,bestC, @(x1, x2) gaussianKernel(x1, x2,bestSigma));
% reading the test dataset
data = csvread('test.csv');
%splitting the data into sample matrix
X = data(2:end,2:15);
%scaled the data into between (0 - 1)
X = (X-min(X(:))) ./ (max(X(:)-min(X(:))));
%predicted the result of test set on the basis of output of svm trained model 
result = svmPredict(model, X);
%saved the file 
save result_svm.csv result;