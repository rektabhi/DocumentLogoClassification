function [out] = ErodeImage(a)
%Returns eroded image.
s=[0 1 0;1 1 1;0 1 0];
%s=[1 0 1;0 0 0;1 0 1];
s=ones(3,3);
if ndims(a)==3
	a = rgb2gray(a);
end
%Number of erosions.
no = 3;
for i=1:no
	a=imdilate(a,s);
	%a=imerode(a,s);
end
if ndims(a)==3
	d=graythresh(a);
	a=im2bw(a,d);
end
figure,imshow(a);
out = a;