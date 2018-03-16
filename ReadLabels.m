function a = ReadLabels()
%Maps indices to names of institutions
%Default path of the CSV file to be read
path = 'Test/Labels.csv';
f = fopen(path);
i=1;
%Returns a cell array -> {Index, Name}
while feof(f)==0
	s = fgetl(f);
	temp = textscan(s,'%d,%q');
	a{i,1} = temp{1};
	a{i,2} = temp{2};
	i=i+1;
end