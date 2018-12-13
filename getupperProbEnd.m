%----------------Prompt the user for getting the probe position------------------
function upperProbEnd=getupperProbEnd(ColMatrix,upperProbStart)
% Program Name:   Generating a Time vs Temperature movie 

a=ColMatrix-1;
b=upperProbStart+1;
string2=sprintf('Enter the Ending position (%d to %d) of the top probe:',b,a);
done = false;
while(~done)
    upperProbEnd=input(string2); % To take the input
    if (upperProbEnd < b || upperProbEnd> a)% to check weather it in between range or not
        display(string2');% If not in range the user will see this message
    else
        done = true;
    end
end

 