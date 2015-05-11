function [bestC,bestSigma]=Bestsolution(X1,y1)
% finding out the best C of svm and sigma of gaussian kernel parameter which give the less error in the validation set 
% in the validation set 
    sel = randperm(size(X1, 1));%permuted the indices randomly 
%seleted 3500 for training and 1000 for cross validation check 
    sel = sel(1:3500);
    X = X1(sel,1:end);
    XVAL = X1(3500:end,1:end);
    y = y1(sel,1);
    yVAL = y1(3500:end,1);
%scaled the data 
    X = (X-min(X(:))) ./ (max(X(:)-min(X(:))));
    XVAL = (XVAL-min(XVAL(:))) ./ (max(XVAL(:)-min(XVAL(:))));
% initializing the value for sigma and C to select the most efficient
    steps = [0.1 0.5 1 3 5 8 10];
    s = [0.001 0.01 0.03 0.05 0.06];
% initilizing the initial value
    minError = Inf;
    minC = Inf;
    minSigma = Inf;
   %running the process for choosing best out of the initialized ones on the basis of the error produced
   %by them

    for i = 1:length(steps)
        for j = 1:length(s)
            curC = steps(i);
            curSigma = s(j);
            model = svmTrain(X, y, curC, @(x1, x2) gaussianKernel(x1, x2,curSigma));
            predictions = svmPredict(model, XVAL);
            error = sum(predictions ~= yVAL);
            if error < minError
                minError = error;
                minC = curC;
                minSigma = curSigma;
            end
        end
    end
    %returning the best values
    bestC = minC;
    bestSigma = minSigma;
end
