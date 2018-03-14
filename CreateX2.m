function [X SURF temp] = CreateX(n);
%Reads n images from the Database\Color\Test folder and preprocesses them and stores them in X
%Stores the extracted SURF features in SURF cell array
dire='C:\Users\Abhishek\Desktop\Image Processing\Logo Identification\Database\Color\Test\';
for i=101:n
	j = i-100;
	loc = strcat(dire,num2str(i),'.png');
	temp{j} = imread(loc);
	temp{j} = Preprocess(temp{j});
	%SURF{j} = 1;
	SURF{j} = SURFFeatures(temp{j});
	X(j,:) = FeatureExtract(temp{j})';
end

function features = SURFFeatures(a);
	a1 = detectSURFFeatures(a);
	features = extractFeatures(a,a1);