function out = SegmentLogo(ar,image)
%Displays all detected logos according to their mean coordinates.
[m n] = size(ar);
if(ndims(image)==3)
	image = rgb2gray(image);
end
[h w] = size(image);
for i=1:m
	t = ar(i,2)-0.15*h;
	b = ar(i,2)+0.15*h;
	r = ar(i,1)+0.15*w;
	l = ar(i,1)-0.15*w;
	if t<0 t=1; end
	if l<0 l=1; end
	if r<0 r=1; end
	if b<0 b=1; end
	if t>h t=h; end
	if l>w l=w; end
	if r>w r=w; end
	if b>h b=h; end
	l=uint64(l);
	r=uint64(r);
	t=uint64(t);
	b=uint64(b);
	logo = image([t:b],[l:r]);
	logo_array{i} = logo;	%Stores and returns all the detected logo
	%figure,imshow(logo);
end
out = logo_array;