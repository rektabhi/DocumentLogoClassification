function logo = Preprocess(a)
%Returns the binarized logo
if ndims(a)==3
	a = rgb2gray(a);
end
	logo = imbinarize(a);


threshold = 2000; %Experimental limit for salt and pepper noise
if HasNoise(logo)>threshold
	logo = medfilt2(logo);
end