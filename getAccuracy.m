%----------------Prompt the user for getting the value of accurecy------------------
function Accuracy = getAccuracy
% Program Name:   Generating a Time vs Temperature movie 

% Get user input for the minimum accuracy limit.
done = false;
while(~done)
    Accuracy=input('Insert the value of minimum accuracy: ');
    if (Accuracy < 0 || Accuracy > 1)% to check weather it in between range or not
        display(' The acuracy will be in between o and 1 ');% If not in range the user will see this message
    else
        done = true;
    end
end