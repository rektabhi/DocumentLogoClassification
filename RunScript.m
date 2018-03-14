%Script to run directly
%Reads the labels from the csv file
a = ReadLabels();
%Creates the y array of the target variables
y = ones(60,1);
y(12:18)=2;
y(19:25)=3;
y(26:32)=4;
y(33:40)=5;
y(41:50)=6;
y(51:58)=7;
y(75:77)=2;
y(78:82)=3;
y(83:85)=4;
y(86:92)=1;
y(94:108)=5;
y(109:113)=6;
y(114:118)=7;
y(93)=3;
y(59:63)=8;
y(64:68)=9;
y(69:74)=10;
y(119:120)=9;
y(121:124)=10;
y(124:127)=8;
noOfClasses = size(a,1);
noOfTrainingLogos = 74;

[X SURF temp] = CreateX2(227);
[result model]=CheckPrediction(X(1:noOfTrainingLogos,:),y(1:noOfTrainingLogos));

for i=1:noOfClasses
	noOfLogosPerClass(i) = sum(y==i);
end
%Feature vectors are not combined to minimize the error caused by learning algorithm.
for i=75:127
	[res(i) score cost] = predict(model,X(i,:));
	%Match SURF Features:
	%matchedImages = find(y==res(i));
	%m = size(matchedImages);
	count=zeros(noOfClasses,1);
	for j=1:noOfTrainingLogos
		%matchedFeatures = matchFeatures(temp{matchedImages(j)},temp{i});
		%[matchedFeatures percentageMatch] = matchFeatures(SURF{j},SURF{i},'Metric','SSD');
		matchedFeatures = matchFeatures(SURF{j},SURF{i});
		count(y(j)) = count(y(j)) + size(matchedFeatures,1);
	end
	%disp(a{res(i),2});
	% if count<10
		% c2=zeros(size(a,1),1);
		% for j=1:74
			% c2(y(j)) = c2(y(j)) + size(matchFeatures(temp{j},temp{i}),1);
		% end
		
		% c2=c2./noOfLogosPerClass';
		% [count res(i)] = max(c2);
	% end
	%disp(count);
	%sum(score)
	count = count./noOfLogosPerClass';
	%disp(count);
	%disp(score);
	[maxMatch maxMatchIndex] = max(count);
	
	
	if maxMatchIndex~= res(i)
		%disp(strcat(string(i)," ",string(res(i))," ",string(maxMatchIndex)," ",string(y(i))));
		if maxMatch>1 && abs(score(res(i)))>0.04
			%SURF is better
			res(i) = maxMatchIndex;
		%else if maxMatch<1 && abs(score(res(i)))<0.04
			%HOG is better, do nothing
		end
	end
	graphOfHOGProbability(i-noOfTrainingLogos) = score(res(i));
	graphOfSURF(i-noOfTrainingLogos) = maxMatch;
	
	% if abs(score(res(i)))>0.04
		% res(i) = maxMatchIndex;
	% end
	ansi = strcat(a{y(i),2}," ",a{res(i),2});
	%if y(i)~=maxMatchIndex || res(i)~=y(i) || maxMatch<1
	if res(i)~=y(i)
		%disp(c2');
		disp(strcat(string(i)," ",ansi," ",string(y(i))," ",string(maxMatchIndex)," ",string(maxMatch)," ",string(score(res(i)))," "));
		%disp(ansi);
		%disp(count);
	end
	
end

figure, plot(graphOfHOGProbability);
figure, plot(graphOfSURF);