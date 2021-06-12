%Joint Location Vectors

X = [4.3, 14.8, 25.3, 37.3, 48.8, 0, 10.5, 21.0, 31.5, 43.0, 54.5];
Y = [9.5, 9.5, 9.5, 9.5, 9.5, 0, 0, 0, 0, 0, 0];


% "C" Connection Matrix with "J" rows and "M" cols
% M cols = 2*j-3

C = zeros(11,19); %initializes a J- row and M- col array of zeroes
C([1,6],1) = 1;
C([1,7],2) = 1;
C([7,2],3) = 1;
C([2,8],4) = 1;
C([8,3],5) = 1;
C([3,9],6) = 1;
C([9,4],7) = 1;
C([4,10],8) = 1;
C([10,5],9) = 1;
C([5,11],10) = 1;
C([6,7],11) = 1;
C([1,2],12) = 1;
C([7,8],13) = 1;
C([2,3],14) = 1;
C([8,9],15) = 1;
C([3,4],16) = 1;
C([9,10],17) = 1;
C([4,5],18) = 1;
C([10,11],19) = 1;

%Load vector (2j cols) 
%1 through J -> x reaction forces;
%J+1 through end -> y reaction forces;
%so, if L = 2j, then J ( J+(loaded joint number) ) == index of loaded joint
%load will always be 4.91 N /500g

L = zeros(22,1);
L(14) = 4.91;

%Support Matrix in x (j rows and 3 cols)
Sx = zeros(11,3); 
Sx(6,1) = 1; 

%Support Matrix in y (j rows and 3 cols)
Sy = zeros(11,3);
Sy(6,2) = 1;
Sy(11,3) = 1;

save('TrussDesignF_Will_Derek_Reyn.mat','C','L','Sx','Sy','X','Y')