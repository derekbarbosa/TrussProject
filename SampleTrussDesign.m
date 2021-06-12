%Connection Matrix
C = zeros(8,13);
C([1,2],1) = 1;
C([1,8],2) = 1;
C([2,8],3) = 1;
C([2,3],4) = 1;
C([3,4],5) = 1;
C([3,8],6) = 1;
C([4,8],7) = 1;
C([7,8],8) = 1;
C([4,7],9) = 1;
C([4,5],10) = 1;
C([6,7],11) = 1;
C([5,7],12) = 1;
C([5,6],13) = 1;


%Joint Location Vectors
X = [0 0 4 8 12 12 8 4];
Y = [0 4 8 8 4 0 4 4];

%Load vector
L = zeros(16,1);
L(16) = 25;

%Support Matrix in x
Sx = zeros(8,3);
Sx(1,1) = 1;

%Support Matrix in y
Sy = zeros(8,3);
Sy(1,2) = 1;
Sy(6,3) = 1;

save('SampleTrussDesign.mat','C','L','Sx','Sy','X','Y')