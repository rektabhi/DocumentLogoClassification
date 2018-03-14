function a = ComplementBW(a)
%Inverts the color of the image.
if ndims(a)==3
	a = rgb2gray(a);
end
[m n] = size(a);
for i=1:m
	for j=1:n
		if(a(i,j)>=1)
			a(i,j)=0;
		else
			a(i,j)=1;
		end
	end
end