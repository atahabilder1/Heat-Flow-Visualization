%----------------Prompt the user for getting the number of max iteration------------------

function MaxIter = getgetMaxIter
% Program Name:   Generating a Time vs Temperature movie 

% Get user input for the number of maximum interation allowed.
done = false;
while(~done)
    MaxIter=input('Insert the number of max iteration allowed: ');% To take the input
    if (MaxIter <= 0)% to check weather it in between range or not
        display('Iteration must be greaterthan zero.');% If not in range the user will see this message
    else
        done = true;
    end
end