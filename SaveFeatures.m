function csv = SaveFeatures(x,y,filename);
%Saves features x and y into a csv file Data.csv.
%Also adds the attributes eg 1,2,3,...,4357
[m n] = size(x);
x(:,n+1) = y;
x2 = zeros(m+1,n+1);
x2(2:m+1,1:n+1)=x;
for i=1:n+1
	index(i) = i;
end
x2(1,:) = index(:);
csv = x2;
csvwrite(filename,x2);