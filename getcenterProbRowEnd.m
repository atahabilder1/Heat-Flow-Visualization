%----------------Prompt the user for getting the probe position------------------
function centerProbRowEnd=getcenterProbRowEnd(ColMatrix,centerProbRowStart)
% Program Name:   Generating a Time vs Temperature movie 

a=ColMatrix-1;
b=centerProbRowStart+1;
string2=sprintf('Enter the Ending Row position (%d to %d) of center probe:',b,a);
done = false;
while(~done)
    centerProbRowEnd=input(string2); % To take the input
    if (centerProbRowEnd < b || centerProbRowEnd> a)% to check weather it in between range or not
        display('string2')% If not in range the user will see this message
    else
        done = true;
    end
end

 