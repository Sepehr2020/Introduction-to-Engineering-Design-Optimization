function f = myfunc(x)

global problem_number
%% first function
if problem_number == 1
    f = x(1)^2 + x(2)^2 -x(1)*x(2) - 4*x(1) - x(2); 
end
%% second function
if problem_number == 2
    f = (1 - x(1))^2 + (-1*x(1)^2 + x(2))^2;
end
%% third function
if problem_number == 3
    f = (x(1) + 3*x(2) + x(3))^2 + 4*(x(1)-x(2))^2 + x(1)*sin(x(3));
end
end