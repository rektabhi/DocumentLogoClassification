%Script to run directly
%Reads the labels from the csv file
a = ReadLabels();
%Creates the y array of the target variables
%y = ones(60,1);
%Training Data
y(1:11)=1;
y(12:18)=2;
y(19:25)=3;
y(26:32)=4;
y(33:40)=5;
y(41:50)=6;
y(51:58)=7;
y(59:63)=8;
y(64:68)=9;
y(69:74)=10;
y(75:88)=11;
y(89:102)=12;
y(103:117)=13;
y(118:133)=14;
y(134:147)=15;

%Test Target
y2(1:3)=2;
y2(4:9)=3;
y2(10:12)=4;
y2(13:19)=1;
y2(20:34)=5;
y2(35:39)=6;
y2(40:44)=7;
y2(45:48)=10;
y2(49:50)=9;
y2(51:53)=8;
y2(54:57)=11;
y2(58:62)=12;
y2(63:66)=13;
y2(67:70)=14;
y2(71:74)=15;

noOfClasses = size(a,1);
noOfTrainingLogos = 147;
noOfTestLogos = 74;
totalNo = noOfTrainingLogos + noOfTestLogos;

%Reading the images from file and converting into feature vectors X and SURF
[X SURF processedLogo] = CreateX2(noOfTrainingLogos,noOfTestLogos);

%Breaking down the matrix X, SURF  and processedLogo into 2 parts Train and Test
XTrain = X(1:noOfTrainingLogos,:);
SURFTrain = SURF(1:noOfTrainingLogos);
processedLogoTrain = processedLogo(1:noOfTrainingLogos);

XTest = X(noOfTrainingLogos+1:totalNo,:);
SURFTest = SURF(noOfTrainingLogos+1:totalNo);
processedLogoTest = processedLogo(noOfTrainingLogos+1:totalNo);


[result model]=CheckPrediction(XTrain(1:noOfTrainingLogos,:),y(1:noOfTrainingLogos));
disp("Index    Actual    Predicted    SURFPrediction   SURF   HOGPrediction   HOG ");
for i=1:noOfClasses
	noOfLogosPerClass(i) = sum(y==i);
end
%Feature vectors are not combined to minimize the error caused by learning algorithm.
countSVM = 0;
countSURF=0;
for i=1:noOfTestLogos
	%res stores the prediction made using hog features
	[res(i) score cost] = predict(model,XTest(i,:));
	if res(i) ~= y2(i)
		countSVM = countSVM+1;
	end
	%Match SURF Features:
	%matchedImages = find(y==res(i));
	%m = size(matchedImages);
	cnt=zeros(noOfClasses,1);
	for j=1:noOfTrainingLogos
		%matchedFeatures = matchFeatures(temp{matchedImages(j)},temp{i});
		%[matchedFeatures percentageMatch] = matchFeatures(SURF{j},SURF{i},'Metric','SSD');
		matchedFeatures = matchFeatures(SURFTrain{j},SURFTest{i});
		cnt(y(j)) = cnt(y(j)) + size(matchedFeatures,1);
	end
	%disp(a{res(i),2});
	% if cnt<10
		% c2=zeros(size(a,1),1);
		% for j=1:74
			% c2(y(j)) = c2(y(j)) + size(matchFeatures(temp{j},temp{i}),1);
		% end
		
		% c2=c2./noOfLogosPerClass';
		% [cnt res(i)] = max(c2);
	% end
	%disp(cnt);
	%sum(score)
	cnt = cnt./noOfLogosPerClass';
	%disp(cnt);
	%disp(score);
	[maxMatch maxMatchIndex] = max(cnt);
	prediction(i) = res(i);
	if maxMatchIndex~= res(i)
		%disp(strcat(string(i)," ",string(res(i))," ",string(maxMatchIndex)," ",string(y(i))));
		if maxMatch>1 && abs(score(res(i)))>0.025
			%SURF is better
			prediction(i) = maxMatchIndex;
		%else if maxMatch<1 && abs(score(res(i)))<0.04
		else
			%HOG is better
			prediction(i) = res(i);
		end
	end
	if maxMatchIndex~=y2(i)
		countSURF = countSURF+1;
	end
	graphOfHOGProbability(i) = score(res(i));
	graphOfSURF(i) = maxMatch;
	
	% if abs(score(res(i)))>0.04
		% res(i) = maxMatchIndex;
	% end
	%ansi = strcat(a{y2(i),2}," ",a{prediction(i),2});
	%if y(i)~=maxMatchIndex || res(i)~=y(i) || maxMatch<1
	
	
	%prediction(i) = maxMatchIndex;
	if prediction(i)~=y2(i)
		%disp(c2');
		disp(strcat(string(i)," ",a{y2(i),2}," ",a{prediction(i),2}," ",a{(maxMatchIndex),2}," ",string(maxMatch)," ",a{res(i),2}," ",string(score(res(i)))," "));
		%disp(ansi);
		%disp(cnt);
	end
	
end
%countSURF
%countSVM
%figure, plot(graphOfHOGProbability);
%figure, plot(graphOfSURF);