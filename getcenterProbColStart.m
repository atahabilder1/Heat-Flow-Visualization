%----------------Prompt the user for getting the probe position------------------
function centerProbColStart=getProbPosStart(RowMatrix)
% Program Name:   Generating a Time vs Temperature movie 
lastpos=RowMatrix-1;
% Get user input for the position of the POSITION OF THE PROBE.
done = false;
while(~done)
    string1=sprintf('Enter the starting column   position (2 to %d) of the center probe:',lastpos');
    centerProbColStart=input(string1) ;
    if (centerProbColStart < 2 || centerProbColStart > RowMatrix)% to check weather it in between range or not
        display('The position of probe will be between 2 to Dimention of Matrix-1 ')% If not in range the user will see this message
    else
        done = true;
    end
end