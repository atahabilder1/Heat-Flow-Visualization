%----------------Prompt the user for getting the probe position------------------
function rightProbEnd=getrightProbEnd(RowMatrix,rightProbStart)
% Program Name:   Generating a Time vs Temperature movie 

a=RowMatrix-1;
b=rightProbStart+1;
string2=sprintf('Enter the Ending position (%d to %d) of the right probe:',b,a);
done = false;
while(~done)
    rightProbEnd=input(string2); % To take the input
    if (rightProbEnd < b || rightProbEnd> a)% to check weather it in between range or not
        display('string2')% If not in range the user will see this message
    else
        done = true;
    end
end

 