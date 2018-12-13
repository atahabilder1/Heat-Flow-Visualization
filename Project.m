% Program: Observation of Heat Flow In 2D surface by MATLAB Simulation
% Author: Anik Tahabilder
% source: Project idea
% Date: 11-27-18
% =============================clearing section============================

done=false; % initialize loop for asking user weather he will repear or not
while(~done)
    tic;
    clc
    clear all
    close all
    format shortg; % While debugging it helps to see the exact value
    %=====================Wellcome Message=====================================
    fprintf('***  Welcome to het flow observation Program ***** \n')
    fprintf('************************************************************* \n')
       format shortG; % to make the output in short format
 % ===========================input section=================================
 %  ------------------------Input the position----------------------- 
         
        RowMatrix=getRowMatrix;% to call the  Number of Row
        ColMatrix=getColMatrix;% to call the  Number of Columns
       
        upperProbStart=getupperProbStart(ColMatrix); % To select the starting point of upper probe 
        upperProbEnd=getupperProbEnd(ColMatrix,upperProbStart);  % To select the ending point of upper probe 
        TempUpper=getTempUpper();     % To take the temperature input for upper probe 
          
        rightProbStart=getrightProbStart(RowMatrix); % To select the starting point of right side probe 
        rightProbEnd=getrightProbEnd(RowMatrix,rightProbStart); % To select the ending point of right side probe 
        TempRight=getTempRight();     % To take the temperature input for right probe 
        
        bottomProbStart=getbottomProbStart(ColMatrix); % To select the starting point of right side probe 
        bottomProbEnd=getbottomProbEnd(ColMatrix,bottomProbStart); % To select the ending point of right side probe 
        TempBottom=getTempBottom();   % To take the temperature input for bottom probe   
        
        leftProbStart=getleftProbStart(RowMatrix); % To select the starting point of left side probe 
        leftProbEnd=getleftProbEnd(ColMatrix,leftProbStart); % To select the ending point of left side probe 
        TempLeft=getTempLeft();       %  To take the temperature input for left probe 
        
        
 %  ================================= Center Probe =========================    

        done3=true; % To check weather the input is either Y/y or N/n
        while(done3)

            decission=input('Do you want to have a center probe? Enter Y for yes and N for No');
            if (decission=='n'|| decission=='N' )  % to check the input is weather n or N
                break;   % It will terminate the loop if the user input n/ N
            elseif(decission=='y' || decission=='Y' )

                centerProbRowStart=getcenterProbRowStart(ColMatrix); % To select the starting point of the row center   probe
                centerProbRowEnd=getcenterProbRowEnd(ColMatrix,centerProbRowStart); % To select the ending point of the row center   probe
                centerProbColStart=getcenterProbColStart(RowMatrix); % To select the starting point of the column of center   probe
                centerProbColEnd=getcenterProbColEnd(RowMatrix,centerProbColStart); % To select the ending point of the column of center   probe
                TempCenter=getTempCenter();   % To take the temperature input for center probe
                    done=false;

            else
                fprintf('Please enter Y or N. No other response is acceptable')
                done=true;   % If the input is other than y or n it will again prompt.
            end
        end



 
      
      
% =========================Othes variable=========================== 



        MaxIter=300; % to call the getMaxIter function which will take  matrix dimention
        Accuracy=getAccuracy;% to call the getAccuracy function which will take  the accuracy
          
            
    
 % ========================False section for debagging==========================
%     RowMatrix=60;
%     ColMatrix=50;
%     
%     upperProbStart=15;
%     upperProbEnd=32;
%     
%     rightProbStart=36;
%     rightProbEnd=43;
%     
%     bottomProbStart=17;
%     bottomProbEnd=25;
%     
%     leftProbStart=22;
%     leftProbEnd=38;
%     
%     centerProbRowStart=15;
%     centerProbRowEnd=38;
%     centerProbColStart=35;
%     centerProbColEnd=42;
%     
%     TempUpper=500;% to  
%     TempRight=1000;% to 
%     TempBottom=800;% to  
%     TempLeft=387;% to  
%  
%     TempCenter=600;% to  
% 
%     MaxIter=600;
%     Accuracy=0.01;
% ---------------------End of false section---------------------------------
   
% Start of counting time
tic;
    
    % =============================Initalization===============================
    Matrix=zeros(RowMatrix,ColMatrix); % to create a zero matrix
    
    Matrix(1,upperProbStart:upperProbEnd)=TempUpper;% to set the temperature of probe in the specific position
    Matrix(rightProbStart:rightProbEnd,ColMatrix)=TempRight;% to set the temperature of probe in the specific position
    Matrix(RowMatrix,bottomProbStart:bottomProbEnd)=TempBottom; % To set the last row of the matrix equal to the bottom temperature
    Matrix(leftProbStart:leftProbEnd,1)=TempLeft; % To set the last row of the matrix equal to the bottom temperature
    Matrix(centerProbColStart:centerProbColEnd,centerProbRowStart:centerProbRowEnd)=TempCenter;
    
    
    
    Matrix1=Matrix; % storing the value in another matrix so that it may not replace its own value while updating
    
    
    
    
    
    
    % ===============================Updating the matrix of====================
    RMS=1000; % initialize a random value to start the while loop
    counter1=1; % to initialize the counter started from one so that i can trace and also to start the while lppo condition test
    
    
    
 %----------------------- This is setup of figure------------------------------
    fig=figure; 
        
      
    
    
    
    while ((counter1<MaxIter) & (RMS > Accuracy))% To check the number of iteration as well as the value of accuracy
        
   % ============================Inner section calculate=========================
        
        for R = 2:(RowMatrix-1)% select from second to the nth-1 row
            for C = 2:(ColMatrix-1) % Selection of collum from 2 to the nth-1
                %                 ==================Keeping the center temperature at fix temperature=====================
                
                if( (C>centerProbRowStart) && (C<centerProbRowEnd) && (R>centerProbColStart)  && (R< centerProbColEnd))
                    anik=0;    
                else
                    
                    Matrix1(R,C) =(Matrix(R,C-1)+Matrix(R,C+1)+Matrix(R-1,C)+Matrix(R+1,C))/4; %update the value from nearby four   
                end
                
                
                
            end
        end
        Matrix1;
        
        
        %  =======================Make top side heat insulated===================
        Matrix1(1,1:upperProbStart-1)=Matrix1(2,1:upperProbStart-1); % Update the temperature of the cell brfore probe
        Matrix1(1,upperProbEnd+1:ColMatrix)= Matrix1(2,upperProbEnd+1:ColMatrix) ; % Update the temperature of the cell after probe
        
                %  =======================Make right side heat insulated===================
        Matrix1(1:rightProbStart-1,ColMatrix)=Matrix1(1:rightProbStart-1,ColMatrix-1); % Update the temperature of the cell brfore probe
        Matrix1(rightProbEnd+1:RowMatrix,ColMatrix)= Matrix1(rightProbEnd+1:RowMatrix,ColMatrix-1);  % Update the temperature of the cell after probe 
        
        
        
                %  =======================Make bottom side heat insulated===================
        Matrix1(RowMatrix,1:bottomProbStart-1)=Matrix1(RowMatrix-1,1:bottomProbStart-1); % Update the temperature of the cell brfore probe
        Matrix1(RowMatrix,bottomProbEnd+1:ColMatrix)= Matrix1(RowMatrix-1,bottomProbEnd+1:ColMatrix);  % Update the temperature of the cell after probe
        
        
        
                %  =======================Make left side heat insulated===================
        
        Matrix1(1:leftProbStart-1,1)=Matrix1(1:leftProbStart-1,2) ; % Update the temperature of the cell brfore probe
        Matrix1(leftProbEnd+1:RowMatrix,1)= Matrix1(leftProbEnd+1:RowMatrix,2);  % Update the temperature of the cell after probe 
        
        
       %  =======================Make Center Temp Constant ===================  
            Matrix(centerProbRowStart:centerProbRowEnd,centerProbColStart:centerProbColEnd)=TempCenter;             
        
        
        
        
        % ==========================Error and RMS Calculation Section ===============
        
        Error= Matrix1-Matrix; % to calculate the error
        
        % to change the value of matrix so that it can start second iteration
        counter1=counter1+1 ; % Increment of counter to calculate the iteration number.
        RMS=sqrt(sum(sum(power(Error,2)))/(RowMatrix*ColMatrix)); % Rms equation in short
        Matrix=Matrix1;
        %---------------------------------------------------------------------------------------------
        imagesc(Matrix1) ; % generate image of matrix1 and keep updating
        xlabel('column'); % lebeling the xaxis
        ylabel('row'); %lebeling the y axis
        title('Temperature Image in deg C within a conductive volume'); % This is the title of the image
        colormap('jet'); % The recommended jet colourmap
        caxis([0 1000]); %Set the colorbar axis fixed
        colorbar; % To show the colorbar
        M(counter1-1)=getframe(gcf); % to capture each figure
        
       
        
    end
    % ==============================Check weather solution is in accuracy or not============================
    if (counter1>=MaxIter)
        
        fprintf('=====================================================  \n')
        fprintf('Solution not found to the specified accuracy  \n')
        fprintf('************************************************************* \n')
        
    end

    %========================Plotting section============================   
    
 figure1(counter1,RMS,toc); % To call the figure function which containing drawing instruction
 

     
 %  -------------------------------Video Writting Section--------------------------------
    
    vidObj = VideoWriter('TEMP.MP4','MPEG-4'); % Prepare a new MPEG-4 file.
    vidObj.FrameRate = 20; % Frame rate in frames per second (default is 30)
    open(vidObj); % Open the new file.
    writeVideo(vidObj,M); % Write the movie to the AVI file
    close(vidObj); % Close the file.
 
    
    done=true; % To check weather the input is either Y/y or N/n
    while(done)
        
        decission=input('Enter Y if want again  or N if you want to exit:','s'); % if user give input anything other than y or N  it will sow the statement
        
        if (decission=='n'|| decission=='N' )  % to check the input is weather n or N
            break;   % It will terminate the loop if the user input n/ N
        elseif(decission=='y' || decission=='Y' )
            done=false;
            
        else
            fprintf('Please enter Y or N. No other response is acceptable')
            done=true;   % If the input is other than y or n it will again prompt.
        end
    end
       
end
 
