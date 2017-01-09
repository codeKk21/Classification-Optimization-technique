# classification
Used different approaches to find the best model for clasiification of data set in 2 categories
Language used :- Octave ( Version 3.8.1 )
Packages Used :- Statistics
 Optimization
Algorithm Used :- SVM ( with Gaussian Kernel)
 Logistic Regression ( Discriminant analysis )
 Deep Neural Network
Steps used by me to reach upto my model on the given training set are :-
1. First i started training my model of logistic regression algorithm with the some percentage of
 randomly selected training example form the given training dataset and on the same instant
 checking the accuracy with some new unselected dataset to find the best regularizing parameter
 lambda to avoid overfitting and underfitting of the model and best threshold value for
 classifictaion ,so in that way i found accuracy as
 training accuracy = 86%
 testing accuracy = 82.6%
2. Now in same way I trained my model with Svm algorithm with gaussian kernel and the
 parameter to be optimized to give best test accuracy are sigma( used in the gaussian kernel)
 and C for regularization to avoid the underfitting and overfitting the data ,so in that way I found
 training accuracy = 82%
 testing accuracy = 74%

So after going through these approach i selected the logistic output with more accuracy as the
result but infact svm output is also in the folder.
