function ColMatrix = getColMatrix
% Program Name:  Generating a Time vs Temperature movie  

% Get user input for the collum of squire matrix
done = false;
while(~done)
    ColMatrix=input('Enter the number of columns (3 to 100):');% To take the input
    if (ColMatrix < 3 || ColMatrix > 100 )% to check weather it in between range or not
        display('  Error!  The collum of the  matrix can be 3 to 100  ');% If not in range the user will see this message
    else
        done = true;
    end
end