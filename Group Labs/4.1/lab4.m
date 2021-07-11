%Lab4 Part 1
clc
clear all
close
global problem_number
problem_number = 3;
%1 = fmincon Keane
%2 = fmincon Shubert
%3 = Genetic Keane
%4 = Genetic Shubert

fminOptions = optimoptions('fmincon');
fminOptions.MaxFunctionEvaluations = 1000;
% gaOptions = optimoptions('ga');
% gaOptions.MaxGenerations = 1000;


if problem_number == 1          % fmincon Keane
    %fmincon Keane
    for i=1:10                 % 10 runs
        fprintf('FOR RUN %d WE HAVE:\n',i)
        x0 = rand([1 5]);
        [minPos,minVal,exitflag,output] = fmincon(@keaneFunc,x0,[],[],[],[],[0,0,0,0,0],[10,10,10,10,10],@lab4NLCon,fminOptions);
        fprintf('Minimum value found is %d \nfound at location x = %d,%d,%d,%d,%d\n',minVal,minPos(1:5))
        fprintf('Number of iterations = %d \n',output.iterations)
        fprintf('Number of function evaluations = %d \n',output.funcCount)
        fprintf('============================================================\n')
    end
    
elseif problem_number == 2      % fmincon Shubert
    %fmincon Shubert
    for i=1:10                 % 10 runs
        fprintf('FOR RUN %d WE HAVE:\n',i)
        x0 = rand([1,10]);
        lb = -5.12;
        ub = 5.12;
        [minPos,minVal,exitflag,output] = fmincon(@shubertFunc,x0,[],[],[],[],[lb,lb,lb,lb,lb,lb,lb,lb,lb,lb],[ub,ub,ub,ub,ub,ub,ub,ub,ub,ub],@lab4NLCon,fminOptions);
        fprintf('Minimum value found is %d \nfound at location x = %d,%d,%d,%d,%d,%d,%d,%d,%d,%d \n',minVal,minPos(1:10))
        fprintf('Number of iterations = %d \n',output.iterations)
        fprintf('Number of function evaluations = %d \n',output.funcCount)
        fprintf('============================================================\n')
    end
    
elseif problem_number == 3       % Genetic Keane
    %Genetic Algorithm Keane
    for i=1:2                 % 10 runs
        fprintf('FOR RUN %d WE HAVE:\n',i)
        lb = -5.12;
        ub = 5.12;
        [minPos,minVal,exitflag,output] = ga(@keaneFunc,5,[],[],[],[],[lb,lb,lb,lb,lb],[ub,ub,ub,ub,ub],@lab4NLCon);
        fprintf('Minimum value found is %d \nfound at location x = %d,%d,%d,%d,%d\n',minVal,minPos(1:5))
        fprintf('Number of Generations = %d \n',output.generations)
        fprintf('Number of function evaluations = %d \n',output.funccount)
        fprintf('============================================================\n')
    end
    
elseif problem_number == 4        % Genetic Shubert
    %Genetic Algorithm Shubert
    for i=1:2                 % 10 runs
        fprintf('FOR RUN %d WE HAVE:\n',i)
        lb = -5.12;
        ub = 5.12;
        [minPos,minVal,exitflag,output] = ga(@shubertFunc,10,[],[],[],[],[lb,lb,lb,lb,lb,lb,lb,lb,lb,lb],[ub,ub,ub,ub,ub,ub,ub,ub,ub,ub],@lab4NLCon);
        fprintf('Minimum value found is %d \nfound at location x = %d,%d,%d,%d,%d,%d,%d,%d,%d,%d \n',minVal,minPos(1:10))
        fprintf('Number of Generations = %d \n',output.generations)
        fprintf('Number of function evaluations = %d \n',output.funccount)
        fprintf('============================================================\n')
    end
end

