%----------------Prompt the user for getting the probe position------------------
function leftProbEnd=getleftProbEnd(RowMatrix,leftProbStart)
% Program Name:   Generating a Time vs Temperature movie 

a=RowMatrix-1;
b=leftProbStart+1;
string2=sprintf('Enter the Ending   position (%d to %d) of left probe:',b,a);
done = false;
while(~done)
    leftProbEnd=input(string2); % To take the input
    if (leftProbEnd < b || leftProbEnd> a)% to check weather it in between range or not
        display('string2')% If not in range the user will see this message
    else
        done = true;
    end
end

 