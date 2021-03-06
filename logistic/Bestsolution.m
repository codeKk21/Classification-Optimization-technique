function [threshhold, lambda] = Bestsolution(X1,y1)
% finding out the best threshhold value for classification and lambda of reguralization  which give the less 
% error in the validation set 
%permuted the indices randomly 
%seleted 3500 for training and 1000 for cross validation check 
    sel = randperm(size(X1, 1));
    sel = sel(1:3500);
    X = X1(sel,1:end);
    XVAL = X1(3500:end,1:end);
    y = y1(sel,1);
    yVAL = y1(3500:end,1);
% scaled the data between(0-1)
    X = (X-min(X(:))) ./ (max(X(:)-min(X(:))));
    XVAL = (XVAL-min(XVAL(:))) ./ (max(XVAL(:)-min(XVAL(:))));
    [m,n] = size(X);
% initialised the initial value of theta 
    initial_theta = zeros(n,1);
% initilizing the initial value
    minerror = Inf;
    minlambda = Inf;
    minz = Inf;
% initializing the value for lambda and threshhold to select the most efficient
    steps = [0.01 0.03 0.08 0.1 0.2 0.3];
    z = [0.48 0.49 0.50 0.51 0.52];
%running the process for choosing best out of the initialized ones on the basis of the error produced
%by them
    for i = 1:length(steps)
         for j = 1:length(z)
            curlambda = steps(i);
            thresh =z(j);
            options = optimset('GradObj', 'on', 'MaxIter', 500);
            [theta, cost] = fminunc(@(t)(CostFunction(t, X, y, curlambda)), initial_theta, options);
            train = sigmoid(theta,X);
            train=train > thresh;
            test= sigmoid(theta,XVAL);
            test=test > thresh;
            if mean(double(test ~= yVAL)) * 100 < minerror
                minerror = mean(double(test ~= yVAL)) * 100;
                minlambda = curlambda;
                minz = thresh;
            end
        end
    end
%returning the best values
    threshhold = minz;
    lambda = minlambda;
end
