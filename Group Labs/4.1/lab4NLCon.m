function [c,ceq] = lab4NLCon(x)
global problem_number

prod = 1;
sum = 0;
if problem_number == 1 || problem_number == 3
    for k = 1:5
        prod = prod*x(k);
        sum = sum + x(k);
    end
    
    c = [0.75-prod;sum-7.5*5];
    ceq = [];
elseif problem_number == 2 || problem_number == 4
    c = [];
    ceq = [];
else
    c = [];
    ceq = [];
end
end