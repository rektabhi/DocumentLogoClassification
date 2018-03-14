function [X temp] = CreateX(n);
%Reads n images from the Database\Color folder and preprocesses them and stores them in X
dire='C:\Users\Abhishek\Desktop\Image Processing\Logo Identification\Database\Color\';
for i=1:n
	loc = strcat(dire,num2str(i),'.png');
	temp{i} = imread(loc);
	temp{i} = Preprocess(temp{i});
	X(i,:) = FeatureExtract(temp{i})';
	%X(i,:) = FeatureExtract2(temp{i})';
end