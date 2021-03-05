function df = grad(x)
% define the function gradient here
global problem_number
%% first function
if problem_number == 1
    dfdx = 2*x(1) - x(2) -4;
    dfdy = 2*x(2) - x(1) - 1;
    
    df = [dfdx;dfdy];
end
%% second function
if problem_number == 2
    dfdx = 2*(1-x(1))*-1 + 2*(-1*x(1)^2 + x(2))*(-2*x(1));
    dfdy = 2*(-1*x(1)^2 + x(2));
    
    df = [dfdx;dfdy];
end
%% third function
if problem_number == 3
    dfdx = 2*(x(1)+3*x(2)+x(3)) + 8*(x(1)-x(2)) + sin(x(3));
    dfdy = 2*(x(1)+3*x(2)+x(3))*3 + 8*(x(1)-x(2))*-1;
    dfdz = 2*(x(1)+3*x(2)+x(3)) + x(1)*cos(x(3));
    
    df = [dfdx;dfdy;dfdz];
end
end