function g= sigmoid(theta,x)
% return the hypothesis function i.e sigmoid function  of grandient descent 
	z=x*theta;
	g = 1.0 ./ (1.0 + exp(-z));
end
