function out = ExtractLogo(image)
%Deletes noise and return means of coordinates of logo(s)
[m n r] = size(image);
%Remove the edges i.e. 10 pixels from each side of the input image
%Edges only contribute to the noise, not logo.
image = image(10:m-10,10:n-10);
[m n r] = size(image);
ar = FindMeanConnectedComponents(image);
%ar contains the means of different connected components, and the number of pixels in each connected component.
count=[0 0 0];
%Count number of connected components according to the number of pixels they have.
%count(1) = Number of small connected components.
%count(2) = Number of medium connected components.
%count(3) = Number of large connected components.
%ar(i,5) = Number of pixels in ith connected component.
i=1;
ub = 1000;	%ub = Upper Threshold Value
lb = 5;	%lb = Lower Threshold Value
max = 0;
ar = MergeNearbyComponents(ar,m,n);
[m n] = size(ar);
%Increments count(1) or count(2) or count(3) according to the number of the pixels in the ith component
%Find the number of pixels in the largest component 
while(i<=m)
	if(ar(i,5)>max)
		max = ar(i,5);
	end
	if ar(i,5)>ub
		count(3)=count(3)+1;
	elseif ar(i,5)<lb
		count(1)=count(1)+1;
	else 
		count(2)=count(2)+1;
	end
	i=i+1;
end
mean = zeros(1,2);
%Reduce the matrix if there is more than 1 large component
%Reduction :- Deletes the components where no of pixels in a component is less than threshold
if(count(3)>0)
	ar = RemoveSmallComponents(ar,ub);
end
%Reduce the matrix if number of medium sized components is greater than 1
if(count(2)>1)
	ar = RemoveSmallComponents(ar,lb);
end

[m n] = size(ar);
%Copies mean values from ar to mean array.
for i=1:m
	mean(i,1) = ar(i,1);
	mean(i,2) = ar(i,2);
end
%Displays areas of image with centers at mean.
logo_array = SegmentLogo(mean,image);
[m n] = size(logo_array);
for i=1:n
	figure, imshow(logo_array{i}); %Display original cropped image
	threshold_value = graythresh(logo_array{i}); %Threshold value
	threshold_logo_array{i} = im2bw(logo_array{i},threshold_value); %Thresholds the logo
	%features{i} = FeatureExtract(threshold_logo_array{i});
	%figure, imshow(threshold_logo_array{i}); %Display Thresholded image
end
%mean
%features{1:2}
%features{3}.Count
%out = ar;

out = threshold_logo_array;