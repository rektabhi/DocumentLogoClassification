function out = FindMeanConnectedComponents(a)
%Returns the means of different connected components.
%Convert the image into grayscale if it is RGB.
if ndims(a)==3
	a = rgb2gray(a);
end
%Dilate the original image.
a = ErodeImage(a);
%Invert the image i.e. make white parts black and vice versa.
a = ComplementBW(a);
%Find connected components.
cc = bwconncomp(a);
%no = number of connected components.
no = cc.NumObjects;
%[m n] = Image Size.
m=cc.ImageSize;
n=m(1,2);
m=m(1,1);
out = zeros([no 2]);
pix = cc.PixelIdxList;
%Calculates the mean values of x and y coordinates and the number pixels in each connected component
for i=1:no
	sumx = uint64(0);
	sumy = uint64(0);
	[s s2] = size(pix{i});
	for j=1:s
		[y x] = ind2sub([m n],pix{i}(j));
		sumx = sumx+x;
		sumy = sumy+y;
	end
	out(i,3) = sumx; %Sum of x coordinates
	out(i,4) = sumy; %Sum of y coordinates
	out(i,5) = s; %Number of pixels in the ith connected component
	sumx = sumx/s;
	sumy = sumy/s;
	out(i,1) = sumx; %Mean of x coordinates
	out(i,2) = sumy; %Mean of y coordinates
end