%%EK 301 Project%%

%%loading truss data 

load('TrussDesignF_Will_Derek_Reyn.mat');

%This Loop will contruct the A Matrix by calculating each column

[j,m] = size(C);

A= zeros(2*j,m);
memlength = zeros(1,m);

for i = 1:m 
    [A(:,i), memlength(i)] = extractNessicaryAColumn(C(:,i),X,Y);
end
    
%This code combines the reaction force matricies with A
 megaS = [Sx;Sy];
 
 A = [A, megaS];
 
%solving for T, the unknown forces
 
 T = -(A^-1*L);
 
 %calculate buckling force -- not used, just for keepsake
 
 bucklingForce = (1334.8./(memlength.^2));
 
 %calculate SR ratios
 SR = zeros(1,m);
 
 for i = 1:m
    SR(i) = (T(i))/(1334.8/(memlength(i)^(2)));
 end


 %calculate max theoeretical load based on load provided
 maximumTheoreticalLoad = abs(sum(L))/abs(max(SR));

 %calculate cost of truss using given formula
 trussCost = (10*j) + sum(memlength);
 actualTrussCost = trussCost - 19;
 
 %max SR -- not used, just for records
SRMAX = abs(max(SR));
[xind,yind] = find(SR == SRMAX);


%dont mind this
bucklingtransposed = bucklingForce';
SRtransposed = SR';

%actual theoretical load
ActualTheoreticalLoadArray = zeros(1,m);

for i = 1:m
    if (T(end-3) < 0) %for all compression members
        ActualTheoreticalLoadArray(i) = (memlength(i)/(memlength(i) - .5))^2 * maximumTheoreticalLoad;
    end
    ActualTheoreticalLoad = min(ActualTheoreticalLoadArray);
end

%formatted output

%printing section name & etc.
fprintf('EK301, Section A1, Group ''Truss In Us'': William Aracri, Derek Barbosa, Reyn Saoit, 11/15/2019');
%printing load value in newtons by summing up the entire "L" vector
fprintf('\nLoad: %i N', abs(sum(L)));
%using a for loop -- values 1 to "m" number of members to index through the "T" vector-- and subsequently printing each value
fprintf('\nMember forces in N (Newtons):');
for i = 1:m
    fprintf('\n m%i: %.3f ', i, abs(T(i)));
    if (T(i)>0) %if force is positive, it is in t!
        fprintf('(T)');
    else %otherwise, it is in c
        fprintf('(C)');
    end
end

%formatting output
fprintf('\nReaction forces in Newtons:');
%reaction forces as listed in manual
fprintf('\n SX1: %.2f', T(end-2)); 
fprintf('\n SY1: %.2f', T(end-1));
fprintf('\n SY2: %.2f\n', T(end));
%printing cost of truss
fprintf('Cost of truss is: $ %.2f\n', trussCost);
%printing maximum load and cost-to-load ratio
fprintf('Theoretical maximum load-to-cost ratio in N/$ is: %.5f\n', maximumTheoreticalLoad/trussCost);
fprintf('Theoretical maximum load is: %.5f\n', maximumTheoreticalLoad);
fprintf('Actual Maximum load is: %.5f\n',ActualTheoreticalLoad);
fprintf('Actual Maximum load-to-cost ratio in N/$ is: %.5f\n', ActualTheoreticalLoad/actualTrussCost);


%will's ME code
 function [column,memLengthP] = extractNessicaryAColumn(connectionMemberColumn,X, Y)
 numberOfJoints = length(connectionMemberColumn');
 connectionMemberColumn = connectionMemberColumn';
 connectionMemberColumnX = connectionMemberColumn;
 connectionMemberColumnY = connectionMemberColumn;
 whereDoesItGo = zeros(1,2);
 connectionPointX = zeros(1,2);
 connectionPointY = zeros(1,2);
 sum = 1;
 
 
 for i = 1:numberOfJoints
     if connectionMemberColumn(i) == 1
         whereDoesItGo(sum) = i;
         connectionPointX(sum) = X(i);
         connectionPointY(sum) = Y(i);
         sum = sum + 1;
     end
 end
     r = ((connectionPointX(2) - connectionPointX(1))^2 + (connectionPointY(2)- connectionPointY(1))^2)^.5;
     connectionMemberColumnX(whereDoesItGo(1))=  (connectionPointX(2) - connectionPointX(1))/r;
     connectionMemberColumnX(whereDoesItGo(2)) =   (connectionPointX(1) - connectionPointX(2))/r;
     connectionMemberColumnY(whereDoesItGo(1)) = (connectionPointY(2) - connectionPointY(1))/r;
     connectionMemberColumnY(whereDoesItGo(2)) = (connectionPointY(1) - connectionPointY(2))/r;
     memLengthP = r;
     
     
     column = [connectionMemberColumnX(:); connectionMemberColumnY(:)];
 end

 