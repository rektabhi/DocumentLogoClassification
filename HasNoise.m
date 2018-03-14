function count = HasNoise(A)
%Returns the number of isolated pixels (if the pixel is the only black pixel in the 3x3 window or it is the only white pixel in 3x3 window) in 3x3 windows.
%Get size of inage
[m n]=size(A);
%Create an array of size of original image + 2 for padding (1 top, 1 bottom and similarily 1 left and 1 right)
padarr=zeros(size(A)+2);
out=zeros(m,n);

%Copy the original image to larger padded array
for i=2:m+1
	for j=2:n+1
		padarr(i,j)=A(i-1,j-1);
	end
end

%Initialize count
count = 0;
%Move the mask to every location in the padded array
for i=2:m+1
	for j=2:n+1
		%Obtain 3x3 window
		window=padarr(i-1:i+1,j-1:j+1);
		%Convert window into a column vector
		w=window(:);
		%Check if sum of values of window is either 8(1 black pixel only) or 1(1 white pixel only)
		%If the window contains an isolated pixel, increase the count
		if sum(w)==1 || sum(w)==8
			count = count+1;
		end
	end
end
%Returns the value of count