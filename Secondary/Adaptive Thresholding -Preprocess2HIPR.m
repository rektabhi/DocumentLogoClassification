a = imread('139.png');
b = rgb2gray(a);
c = ones(7)/49;
d = imfilter(b,c);
e = d-b;
f = imbinarize(e);
g = imcomplement(f);
figure, imshow(g);