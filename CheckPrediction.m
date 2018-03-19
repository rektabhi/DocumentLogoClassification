function [result model]= CheckPrediction(X,y);
%Returns the model trained on the data X
[n m] = size(y);
%model = fitcsvm(X,y);
model = fitcecoc(X,y);
for i=1:n
result(i) = predict(model,X(i,:));
end

% mispredictions = result~=y';
% mispredictions = sum(mispredictions);