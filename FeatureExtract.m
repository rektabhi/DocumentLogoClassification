function features = FeatureExtract(logo)
%Returns an array of features of a given logo
%Shape Features:
%1. Area = Number of white pixels
% white=0;
% [m n] = size(logo);
% % figure, imshow(logo);
% logo_comp = imcomplement(logo);
% white=sum(logo_comp(:));
% features{1} = white;
% % 2. Hu Features
% features{2} = HuMoments(logo_comp);
		% 3. SURF Features(Only some of the most significant terms)
		 % % SURFFeatures = detectSURFFeatures(logo);
		 % % significant = 5;
		 % % if SURFFeatures.Count>=significant
			% % significantSURFFeatures = SURFFeatures.Metric(1:significant);
			% % temp = SURFFeatures.Location([1:significant],[1 2]);
			% % significantSURFFeatures(significant+1:3*significant) = temp(:);
			% % size(significantSURFFeatures)
			% % features{3} = detectSURFFeatures(logo);
			% % features{3} = significantSURFFeatures;
		% % else
			% % features{3} = zeros(3*significant,1);
		% % end
		% Plot SURF Features
		% % imshow(logo);hold on; 
		% % plot(SURFFeatures.selectStrongest(10));

		% HOG Features
		% % [features{3} visualization] = extractHOGFeatures(logo);
		% % features{3}=features{3}.*1000;
	% features{2}=features{2}*10000;
	% % features{2}(1)=features{2}(1)*10000;
	% % features{2}(2)=features{2}(2)*10000000;
	% % features{2}(3)=features{2}(3)*1000000;
	% % features{2}(4)=features{2}(4)*10000000;
	% % features{2}(5)=features{2}(5)*10000000000;
	% % features{2}(6)=features{2}(6)*100000000;
	% % features{2}(7)=features{2}(7)*1000000000;
	
	
	
	
	
	
	% % 3. Perimeter
	% peri = bwperim(logo);
	% % figure, imshow(peri);
	% % figure, imshow(logo);
	% peri = sum(peri(:));
	% features{3} = peri;
	% % 4. Form Factor
	% features{4} = 400*3.1415*features{1}/features{3}^2;
	% % 5. Compactness
	% features{5} = 4*3.1415*features{1}/features{3};
	
	
	
	
	
	
	% 6,7. BoundingBox = MajorAxis and MinorAxis
	% % y = imdilate(logo,[0 1 0;1 1 1;0 1 0]);
	% % y = imcomplement(y(5:95,5:95));
	% % s=regionprops(y, 'BoundingBox');
	% Obtain all of the bounding box co-ordinates
	% % bboxCoords = reshape([s.BoundingBox], 4, []).';
	 % Calculate top left corner
	% % topLeftCoords = bboxCoords(:,1:2);
	 % Calculate top right corner
	% % topRightCoords = [topLeftCoords(:,1) + bboxCoords(:,3) topLeftCoords(:,2)];
	 % Calculate bottom left corner
	% % bottomLeftCoords = [topLeftCoords(:,1) topLeftCoords(:,2) + bboxCoords(:,4)];
	 % Calculate bottom right corner
	% % bottomRightCoords = [topLeftCoords(:,1) + bboxCoords(:,3) ...
		% % topLeftCoords(:,2) + bboxCoords(:,4)];
	 % Calculating the minimum and maximum X and Y values
	% % finalCoords = [topLeftCoords; topRightCoords; bottomLeftCoords; bottomRightCoords];
	% % minX = min(finalCoords(:,1));
	% % maxX = max(finalCoords(:,1));
	% % minY = min(finalCoords(:,2));
	% % maxY = max(finalCoords(:,2));
	% Draw the rectangle on the screen
	% % width = (maxX - minX + 1);
	% % height = (maxY - minY + 1);
	% % rect = [minX minY width height];
	% % features{6} = width;
	% % features{7} = height;
	
	
	
	
	
	
	% % 8.ZernikeMoments == 4 Features
	 % [Z A Phi] = Zernikmoment(logo,3,3);
	 % features{6} = [real(Z) imag(Z) A Phi];
	
	 % [Z A Phi] = Zernikmoment(logo,0,0);
	 % features{7} = [real(Z)];
	
	 % % [Z A Phi] = Zernikmoment(logo,1,1);
	 % % features{10} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,2,0);
	 % % features{11} = [real(Z)];
	
	 % % [Z A Phi] = Zernikmoment(logo,2,2);
	 % % features{12} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,3,1);
	 % % features{13} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,4,0);
	 % % features{14} = [real(Z)];
	
	 % % [Z A Phi] = Zernikmoment(logo,4,4);
	 % % features{15} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,4,2);
	 % % features{16} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,5,1);
	 % % features{17} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,5,3);
	 % % features{18} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,5,5);
	 % % features{19} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,6,0);
	 % % features{20} = [real(Z)];
	
	 % % [Z A Phi] = Zernikmoment(logo,6,2);
	 % % features{21} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,6,4);
	 % % features{22} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,6,6);
	 % % features{23} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,7,1);
	 % % features{24} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,7,3);
	 % % features{25} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,7,5);
	 % % features{26} = [real(Z) imag(Z) A Phi];
	
	 % % [Z A Phi] = Zernikmoment(logo,7,7);
	 % % features{27} = [real(Z) imag(Z) A Phi];
	
	
	
	
	
	[hog vis] = extractHOGFeatures(logo);
	features{1} = hog;
	
	
	
	
	
	
	
	
	
	
	
[m n] = size(features);
featureVector = [];
for i=1:n
	featureVector = [featureVector;features{i}(:)];
end
%Return featureVector
features = featureVector; 