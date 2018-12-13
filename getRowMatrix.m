%----------------Prompt the user for getting number of maximum iteration------------------
function RowMatrix = getRowMatrix
% Program Name:   
% Inputs:  
% Output:   

% Get user input for the dimention of squire matrix
done = false;
while(~done)
    RowMatrix=input('Enter the number of rows (3 to 100): ');% To take the input
    if (RowMatrix < 3 || RowMatrix > 100 )% to check weather it in between range or not
        display('  Error!  The dimention of the  matrix can be 3 to 100  ');% If not in range the user will see this message
    else
        done = true;
    end
end