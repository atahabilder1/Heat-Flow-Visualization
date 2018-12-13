%----------------Prompt the user for getting temperature of bottom------------------


function TempLeft = getTempLeft
% Program Name: Generating a Time vs Temperature movie  

% Get user input for the TempBottom
done = false;
while(~done)
    TempLeft=input('Enter the Temperature (in deg C) of the Left Probe: ');% To take the input
    if (TempLeft < -273 || TempLeft > 10000)  % to check weather it in between range or not
        display('Error! Temperature can be from -273 to 10000. ');% If not in range the user will see this message
    else
        done = true;
    end
end