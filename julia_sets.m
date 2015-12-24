%Julia Sets
%Author: Russell J Phelan
%Date: 12/22/15

clear all; 

%how dense, and with what bounds do we generate #'s in complex plane? 
bound = 1.5;
spacing = .0075;


%creates complex plane object
%cPlane = zeros((bound/spacing)^2); %preallocating array

i = 1;
cPlane = [];
for b = -bound:spacing:bound
    for a = -bound:spacing:bound
         cPlane = [cPlane complex(a,b)]; %1D array holding complex #'s in plane of interest. They are ordered, but it's in a silly way, like a collapsed 2D array. 
         %i = i + 1
    end
end





%for every point in the complex plane...
c = -.8 + .156*i;
blowup = realmax; %if modulus of complex # is bigger than this, call orbit unbounded
numIters = 25;
notJulia = 0;
juliaSet = [];

for i=1:length(cPlane)
    
    currNum = cPlane(i); %want to keep point that launched orbit for Julia Set
    iterNum = currNum; %this is the variable that stores current dynamical system val
    
    %determine if an orbit from that point is bounded...
    for j=1:numIters
        notJulia = 0;
        iterNum = iterNum^2 + c;
        mod = abs(iterNum);
        if mod > blowup
            notJulia = 1; 
            break;
        end
    end
    
    if notJulia
        continue; %this orbit is unbounded, choose a new starting #
    else
        juliaSet = [juliaSet currNum]; %add # to Filled Julia Set
    end
end
    
plot(juliaSet,'.','MarkerSize',6)