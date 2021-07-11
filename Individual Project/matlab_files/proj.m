close all; clear all; clc;

global problem_number
problem_number = 1;

%% target = 3000 cal max
if problem_number == 1
    x0 = [137.5001  700.0000  300.0000  300.0002    1.0000    1.0000    1.0000];
%     x0 = [10,10,10,10,10,10,10];
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    lb = [100,700,300,300,0,0,0];
    ub = [750,750,333.3,500,1,1,1];
    [x,fval,exitflag, output] = fmincon(@func1,x0,A,b,Aeq,beq,lb,ub,@func2);
    iter = output.iterations
    numEval_results = output.funcCount    
    
    disp(x);
    disp(fval);
end

