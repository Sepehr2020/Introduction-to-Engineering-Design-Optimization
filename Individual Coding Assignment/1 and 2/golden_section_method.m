function [fx_min,x] = golden_section_method(func,tolerance,lb, ub)
% global fcount;
% fcount = 0;

%% 
x1 = lb;             % initial lower bound 
x4 = ub;             % initial upper bound 
e = 1; 
e_desired = tolerance;   % Desired tolerance 

%%
n = 0;                  % current iteration 
iteration_limit = 100;  % iteration limit

k = 2/(1+sqrt(5));      % Inverse of Golden Section Number 


while (n < iteration_limit)
    x2 = x1 + (e_desired * (1/k)^n);
    x3 = x2 + (e_desired * (1/k)^(n+1));
    x4 = x3 + (e_desired * (1/k)^(n+2));
    x1 = x4;
    if (func(x2) < func(x1) && func(x2) < func(x3))
        lower = x1;
        mid = x2;
        upper = x3;
        break
    end
    x1 = x4;
    n = n+1;
end


interval = upper - lower;
a = lower + (1-k)*interval;
b = upper +  (k)*interval;


while (n < iteration_limit) 
    if func(a) < func(b)
        upper = b;
        b = a;
        interval = upper - lower;
        a = lower + (1-k)*interval;
        if interval < e_desired
            minpoint = (lower + upper)/2;
            break
        end
    
    elseif func(a) > func(b)
        lower = a;
        a = b;
        interval = upper - lower;
        b = lower + (k)*interval;
        if interval < e_desired
            minpoint = (lower + upper)/2;
            break
        end
    elseif func(a) == func(b)
        lower = a;
        upper = b;
        interval = upper - lower;
        a = lower + (1-k)*interval;
        b = lower +  (k)*interval;
    end
    
    if interval < e_desired
        break
    end
    n = n+1;
end




if (n == iteration_limit)
    disp('No solution found');
    disp('ERROR: iterations reached max');
else
    fprintf('Minimum value found is %d found at location x = %d \n',func(minpoint), minpoint)
    fprintf('Number of iterations is %d \n',n)
end
end