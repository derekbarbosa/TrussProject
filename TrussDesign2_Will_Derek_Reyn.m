%Joint Location Vectors

X = [0, 4.75, 9.5, 14.25, 19, 26.25, 30.9, 35.75, 41, 48.25, 53.5, 25];
Y = [0, 8.23, 0, 8.23, 0, 8.23, 0, 8.23, 0, 8.23, 0, 18.5];


% "C" Connection Matrix with "J" rows and "M" cols
% M cols = 2*j-3

C = zeros(12,21); %initializes a J- row and M- col array of zeroes
C([1,3],1) = 1;
C([3,5],2) = 1;
C([5,7],3) = 1;
C([7,9],4) = 1;
C([9,11],5) = 1;
C([2,4],6) = 1;
C([4,6],7) = 1;
C([6,8],8) = 1;
C([8,10],9) = 1;
C([1,2],10) = 1;
C([2,3],11) = 1;
C([3,4],12) = 1;
C([4,5],13) = 1;
C([5,6],14) = 1;
C([6,7],15) = 1;
C([7,8],16) = 1;
C([8,9],17) = 1;
C([9,10],18) = 1;
C([10,11],19) = 1;
C([4,12],20) = 1;
C([12,6],21) = 1;

%Load vector (2j cols) 
%1 through J -> x reaction forces;
%J+1 through end -> y reaction forces;
%load will always be 4.91 N /500g

L = zeros(24,1);
L(24) = 4.91;

%Support Matrix in x (j rows and 3 cols)
Sx = zeros(12,3);
Sx(1,1) = 1; 

%Support Matrix in y (j rows and 3 cols)
Sy = zeros(12,3);
Sy(1,2) = 1;
Sy(11,3) = 1;

save('TrussDesign2_Will_Derek_Reyn.mat','C','L','Sx','Sy','X','Y')