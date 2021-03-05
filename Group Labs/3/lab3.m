% 1) options = optimoptions('gamultiobj','PlotFcn',@gaplotpareto);
%    ^ this would help for multivaribale visualizations
% 2) use optimoptions ('ga') for more info
% 3) a = load('a.mat').a --> for question 2
close all; clear all; clc;

global problem_number
problem_number = 1;

%% 3.1
if problem_number == 1
    A=[];
    b=[];
    Aeq=[];
    beq=[];
    lb=[14, 14, 14, 14];
    ub=[60, 60, 60, 60];
    Intcon = [1,2,3,4];

    nvar = 4; % number of variables
    [x,fval,exitflag,output] = ga(@func1,nvar,A,b,Aeq,beq,lb,ub, @func2, Intcon);

    iterations= output.generations
    function_eval = output.funccount
    fprintf("\n For Question 1: \n Optimum found is [%.4f,%.4f,%.4f,%.4f] where the function value is %.4f \n", x(1), x(2), x(3), x(4), fval)
end

%% 3.2
if problem_number == 2
    A=[];
    b=[];
    Aeq=[];
    beq=[];
    lb=[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
    ub=[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    Intcon = [];
%     options = gaoptimset ('PopulationSize', 200);
%     options = optimoptions('ga','MutationFcn', {@mutationadaptfeasible, 0.05})
    options = optimoptions('ga','CrossoverFraction', 0.8);
    nvar = 16; % number of variables
    [x,fval,exitflag,output] = ga(@func1,nvar,A,b,Aeq,beq,lb,ub, @func2, Intcon,options)
    iterations= output.generations
    function_eval = output.funccount

% % %     fprintf("\n For Question 2: \n Optimum found is [%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f] where the function value is %.4f \n", x(1), x(2), x(3), x(4), fval)
    
end

%% 3.3 plot objective 1 vs objective 2 ....ex)minimize cost and .... but which one is more importnt tradeoff
if problem_number == 3
    A=[];
    b=[];
    Aeq=[];
    beq=[];
    lb=[];
    ub=[];

    nvar = 3; % number of variables
    [x,fval,exitflag,output] = gamultiobj(@func1,nvar,A,b,Aeq,beq,lb,ub, @func2);  % allowed multiple onj
    iterations= output.generations
    function_eval = output.funccount
    fprintf("\n For Question 3: \n Optimum found is [%.4f,%.4f,%.4f] where the function value is %.4f \n", x(1), x(2), x(3), fval)
end

%% 3.4
if problem_number == 4
    A=[];
    b=[];
    Aeq=[];
    beq=[];
    lb=[0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    ub=[1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

    nvar = 10; % number of variables
    [x,fval,exitflag,output] = gamultiobj(@func1,nvar,A,b,Aeq,beq,lb,ub, @func2)  % allowed multiple onj
    iterations= output.generations
    function_eval = output.funccount
%     fprintf("\n For Question 4: \n Optimum found is [%.4f,%.4f,%.4f] where the function value is %.4f \n", x(1), x(2), x(3), fval)
end


