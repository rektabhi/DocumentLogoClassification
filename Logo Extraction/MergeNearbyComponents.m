function out = MergeNearbyComponents(ar,p,q)
%Merges the components which are within a given range of cartesian distances
[m n] = size(ar);
threshold1 = uint64(0.1*p);
threshold2 = uint64(0.1*q);
for i=1:m
	par(i) = i;
end
i=1;
%Uses union-find to club components
%All components are assigned a parent as follows:
%ith component is assigned parent i
%If 2 components i and j are considered near, parent(parent(i)) = parent(j)
while(i<=m)
	j = i+1;
	while(j<=m)
		if(abs(ar(i,1)-ar(j,1))<threshold1 && abs(ar(i,2)-ar(j,2))<threshold2)
			if(parent(par,i)~=parent(par,j))
				x = parent(par, i);
				y = parent(par, j);
				par(x) = y;
			end
		end
		j=j+1;
	end
	i=i+1;
end
for i=1:m
	par2(i)=parent(par,i);
end
%Components with same parents are merged together
k=0;
%ar2 = zeros(500,5);
for i=1:m
	if(par2(i)~=-1)
		k=k+1;
		ar2(k,:) = ar(i,:);
		for j=i+1:m
			if(par2(j)~=-1 && par2(i)==par2(j))
				ar2(k,3) = ar2(k,3) + ar(j,3);
				ar2(k,4) = ar2(k,4) + ar(j,4);
				ar2(k,5) = ar2(k,5) + ar(j,5);
				ar2(k,1) = ar2(k,3) / ar2(k,5);
				ar2(k,2) = ar2(k,4) / ar2(k,5);
				par2(j)=-1;
			end
		end
		par2(i)=-1;
	end
end
out = uint64(ar2);

function p = parent(ar,a)
%Function to return parent of a component a
while(ar(a)~=a)
	a = ar(a);
end
p = a;