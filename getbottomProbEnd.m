%----------------Prompt the user for getting the probe position------------------
function bottomProbEnd=getbottomProbEnd(ColMatrix,bottomProbStart)
% Program Name:   Generating a Time vs Temperature movie 

a=ColMatrix-1;
b=bottomProbStart+1;
string2=sprintf('Enter the ending  position (%d to %d) of bottom probe:',b,a);
done = false;
while(~done)
    bottomProbEnd=input(string2); % To take the input
    if (bottomProbEnd < b || bottomProbEnd> a)% to check weather it in between range or not
        display('string2')% If not in range the user will see this message
    else
        done = true;
    end
end

 