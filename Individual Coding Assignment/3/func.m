function f = func(x)

global problem_number
%% First function
if problem_number == 1
    f = x(1)^2 + x(2)^2 - x(1)*x(2) - 4*x(1) - x(2); 
end
%% Second function
if problem_number == 2
    f = (1 - x(1))^2 + (-1*x(1)^2 + x(2))^2;
end
%% Third function
if problem_number == 3
    g = (1 - x(1))^2 + (-1*x(1)^2 + x(2))^2;
    r = 10000;
    h = -10*x(1) - 3*x(2) + 25;
    if h <= 0
        h = 0;
    else
        h = h;
    end
    f = g + r*h;    
end
end