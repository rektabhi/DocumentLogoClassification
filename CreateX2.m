function [X SURF temp] = CreateX(n1,n2);
%Reads n images from the Database\Color\Test folder and preprocesses them and stores them in X
%Stores the extracted SURF features in SURF cell array
dire='Train\';
n1 = n1+100;
for i=101:n1
	j = i-100;
	loc = strcat(dire,num2str(i),'.png');
	temp{j} = imread(loc);
	temp{j} = Preprocess(temp{j});
	SURF{j} = SURFFeatures(temp{j});
	X(j,:) = FeatureExtract(temp{j})';
end
dire = 'Test\';
for j=n1+1-100:n1+n2-100
	i = j-n1+100;
	loc = strcat(dire,num2str(i),'.png');
	temp{j} = imread(loc);
	temp{j} = Preprocess(temp{j});
	SURF{j} = SURFFeatures(temp{j});
	X(j,:) = FeatureExtract(temp{j})';
end



function features = SURFFeatures(a);
	a1 = detectSURFFeatures(a);
	features = extractFeatures(a,a1);