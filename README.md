# Contest for Survaider Internship
Used different approaches to find the best model for clasiification of data set of users data from twitter feed in 2 categories i.e fraud/non-fraud
  - language used - Octave( an open source version of matlab)

# Algorithms Used 
  - Logistic Regression
  - Support vector machine (svm with Gaussian Kernel)

# Steps used to achieve the best model on the given training sets are :-
1. First trained the model using logistic regression algorithm with the some percentage of
 randomly selected training example form the given training datasets and on the same instant
 checking the accuracy with some new unselected dataset to find the best regularizing parameter
 lambda to avoid overfitting and underfitting of the model and best threshold value for
 classifictaion ,so in that way the result matrix found was
 - training accuracy = 86%
 - testing accuracy = 82.6%
2. Now in the same way model was trained using Svm algorithm with gaussian kernel and the
 parameter to be optimized to give best test accuracy are sigma( used in the gaussian kernel)
 and C for regularization to avoid the underfitting and overfitting the data ,so in that way the result matrix found was
 - training accuracy = 82%
 - testing accuracy = 74%

So after going through these approaches logistic regression output was found more accurate

