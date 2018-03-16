function hist = custHist(a)
if ndims(a)==3
	a = rgb2gray(a);
end
c = a(:);
for i=-1:256
	b(i+2)=sum(c==i);
end
figure
f = bar(b);