function out = RemoveSmallComponents(ar,val)
%Deletes the rows where number of pixels is less than a given threshold value
[m n] = size(ar);
i=1;
%Iterate through the entire array and remove components if number of pixels is less than val
while(i<=m)
	if(ar(i,5)<val)
		ar(i,:)=[];
		m=m-1;
	else
		i=i+1;
	end
end
out = ar;