%----------------Prompt the user for getting temperature of bottom------------------


function TempRight = getTempRight
% Program Name: Generating a Time vs Temperature movie  

% Get user input for the TempBottom
done = false;
while(~done)
    TempRight=input('Enter the Temperature (in deg C) of the Right Probe: ');% To take the input
    if (TempRight < -273 || TempRight > 10000)  % to check weather it in between range or not
        display('Error! Temperature can be from -273 to 10000. ');% If not in range the user will see this message
    else
        done = true;
    end
end