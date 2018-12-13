%----------------Prompt the user for getting the probe position------------------
function centerProbColEnd=getcenterProbColEnd(RowMatrix,centerProbColStart)
% Program Name:   Generating a Time vs Temperature movie 

a=RowMatrix-1;
b=centerProbColStart+1;
string2=sprintf('Enter the Ending Row position (%d to %d) of center probe:',b,a);
done = false;
while(~done)
    centerProbColEnd=input(string2); % To take the input
    if (centerProbColEnd < b || centerProbColEnd> a)% to check weather it in between range or not
        display('string2')% If not in range the user will see this message
    else
        done = true;
    end
end

 