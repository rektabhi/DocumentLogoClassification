%Reads the labels from the csv file
a = ReadLabels();
%Creates the y array of the target variables
%y = ones(60,1);
%Training Data
y(1:11)=1;
y(12:18)=2;
y(19:25)=3;
y(26:32)=4;
y(33:40)=5;
y(41:50)=6;
y(51:58)=7;
y(59:63)=8;
y(64:68)=9;
y(69:74)=10;
y(75:88)=11;
y(89:102)=12;
y(103:117)=13;
y(118:133)=14;
y(134:147)=15;

%Test Target
y2(1:3)=2;
y2(4:9)=3;
y2(10:12)=4;
y2(13:19)=1;
y2(20:34)=5;
y2(35:39)=6;
y2(40:44)=7;
y2(45:48)=10;
y2(49:50)=9;
y2(51:53)=8;
y2(54:57)=11;
y2(58:62)=12;
y2(63:66)=13;
y2(67:70)=14;
y2(71:74)=15;

noOfClasses = size(a,1);
noOfTrainingLogos = 147;
noOfTestLogos = 74;
totalNo = noOfTrainingLogos + noOfTestLogos;

%Reading the images from file and converting into feature vectors X and SURF
[X SURF processedLogo] = CreateX2(noOfTrainingLogos,noOfTestLogos);

%Breaking down the matrix X, SURF  and processedLogo into 2 parts Train and Test
XTrain = X(1:noOfTrainingLogos,:);
SURFTrain = SURF(1:noOfTrainingLogos);
processedLogoTrain = processedLogo(1:noOfTrainingLogos);

XTest = X(noOfTrainingLogos+1:totalNo,:);
SURFTest = SURF(noOfTrainingLogos+1:totalNo);
processedLogoTest = processedLogo(noOfTrainingLogos+1:totalNo);