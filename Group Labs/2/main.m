clc
close all
clear

global question_number
question_number = 1;


optionFlag = 2; %For part 3, different parameters

uncOptions = optimoptions('fminunc');
uncOptions.Display = 'off';
options = optimoptions('fmincon');

if optionFlag == 0 %Default
    
    options.MaxFunctionEvaluations = 3000;
    
elseif optionFlag == 1
    options.OptimalityTolerance = 0.75e-06;
    options.MaxFunctionEvaluations = 100;
    
elseif  optionFlag == 2
    options.SpecifyObjectiveGradient = true;
    
elseif optionFlag == 3
    options.SubproblemAlgorithm = 'cg';
    options.HessianApproximation = 'finite-difference';
end

options.Display = 'off';

startPoint = 1;

posX1_results = [];
posX2_results = [];
posX3_results = [];
posX4_results = [];
posX5_results = [];
posX6_results = [];

minVal_results = [];
numEval_results = [];
numIteration_results = [];





for i = 1:1:5 %Question Number Increment
    
    for j = 1:1:5 %5 Different Runs
        
        if question_number == 1
            x0 = [startPoint,startPoint];
            [minPos,minVal,exitflag,output] = fminunc(@myFun1,x0,uncOptions);
            
            posX1_results(question_number,j) = minPos(1);
            posX2_results(question_number,j) = minPos(2);
            minVal_results(question_number,j) = minVal;
            numIteration_results(question_number,j) = output.iterations;
            numEval_results(question_number,j) = output.funcCount;
            minVal(question_number,j) = minVal(1);
            
            %             test = @(x,x2) ((x.^2 + 12*x2 -1).^2 + (49*x.^2 + 49*x2.^2 + 84*x + 2324*x2 - 681).^2);
            %             fsurf(test,[-1,1]);
            
        end
        
        if question_number == 2
            x0 = [startPoint,startPoint,startPoint,startPoint];
            [minPos,minVal,exitflag,output] = fminunc(@myFun1,x0,uncOptions);
            
            posX1_results(question_number,j) = minPos(1);
            posX2_results(question_number,j) = minPos(2);
            posX3_results(question_number,j) = minPos(3);
            posX4_results(question_number,j) = minPos(4);
            minVal_results(question_number,j) = minVal;
            numIteration_results(question_number,j) = output.iterations;
            numEval_results(question_number,j) = output.funcCount;
        end
        
        if question_number == 3
            x0 = [startPoint,startPoint];
            [minPos,minVal,exitflag,output] = fmincon(@myFun1,x0,[],[],[],[],[],[],@myNLCon,options);
            
            posX1_results(question_number,j) = minPos(1);
            posX2_results(question_number,j) = minPos(2);
            minVal_results(question_number,j) = minVal;
            numIteration_results(question_number,j) = output.iterations;
            numEval_results(question_number,j) = output.funcCount;
            
            
            
            %     test = @(x1,x2)  4*x1.^2 + x1 - x2 - 2.5;
            %     fsurf(test,[-2,2])
        end
        
        if question_number == 4
            x0 = [startPoint,startPoint];
            [minPos,minVal,exitflag,output] = fmincon(@myFun1,x0,[],[],[],[],[],[],@myNLCon,options);
            
            posX1_results(question_number,j) = minPos(1);
            posX2_results(question_number,j) = minPos(2);
            minVal_results(question_number,j) = minVal;
            numIteration_results(question_number,j) = output.iterations;
            numEval_results(question_number,j) = output.funcCount;
        end
        
        if question_number == 5
            x0 = [startPoint,startPoint,startPoint,startPoint,startPoint,startPoint];
            [minPos,minVal,exitflag,output] = fmincon(@myFun1,x0,[-1,-1,0,0,0,0;1,-3,0,0,0,0;1,1,0,0,0,0],[-2;2;6],[],[],[0,0,1,0,1,0],[inf,inf,5,6,5,10],@myNLCon,options);
            
            posX1_results(question_number,j) = minPos(1);
            posX2_results(question_number,j) = minPos(2);
            posX3_results(question_number,j) = minPos(3);
            posX4_results(question_number,j) = minPos(4);
            posX5_results(question_number,j) = minPos(5);
            posX6_results(question_number,j) = minPos(6);
            minVal_results(question_number,j) = minVal;
            numIteration_results(question_number,j) = output.iterations;
            numEval_results(question_number,j) = output.funcCount;
        end
        
    end
    
    question_number = question_number + 1;
end

posX1_results
posX2_results
posX3_results
posX4_results
posX5_results
posX6_results
minVal_results
numIteration_results
numEval_results

