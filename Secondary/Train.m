function model = Train(X,y);
% Input X as m*n matrix with m training examples and n features and y as a column matrix
C = 1;
sigma = 0.1;

model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));