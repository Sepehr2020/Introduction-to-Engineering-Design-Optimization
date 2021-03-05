clear all; close all; clc;
%% Author's Notes:
%  - Author Name: Sepehr Rezvani
%  - golden_section_method code works perfectly, but according to the 
%    textbook, there is a better and more efficient way to find the 
%    optimum values, and that is by solving for alpha at the begining of
%    each loop's iteration.
%  - golden_section_method will also be submitted with codes for assignment
%    number 2.
%  - Line 30 must change according to the question beind solved.

%  - IMPORTANT INSTRUCTIONS
%       1) First start by choosing the correct problem_number, that being
%       the desired questions to be solved, then press run.
%       2) Once MATLAB has completed running, go over the information
%       printed in Command Window.
%       3) Scroll down to the last iteration, and observe the following
%       information:
%           a. "B Matrix for iteration...": This is B matrix, and updates
%           automatically at the end of each loop.
%           b. "New Point" indicated the point where the function is
%           minimized.
%           c. "New Function value" is the minimum function value.
%           d. Points a-c are the most important, others can be useful
%           depending on the information that is required.

%% BFGS starts here
% IMPORTANT ---------> CHOOSE FUNCTION/QUESTION NUMBER HERE
global problem_number
problem_number = 2;
%% starting point 1
if problem_number == 1
    x_old = [4;4];
end
%% starting point 2
if problem_number == 2
    x_old = [1.2;1.25];
end
%% starting point 3
if problem_number == 3
    x_old = [-1;-1;-1];
end
fprintf('Solution for question %d is:\n', problem_number);
%%
gradd1 = grad(x_old);         % Gradient at this point --> called gradient of function AKA c(k)
hess1 = eye(length(x_old));   % Initial Hessian of cost function (H(0))


con_parameter = 100;          % Random value assigned just to enter the while loop initially
iternum = 1;

tolerance = 1e-9;             % choose accordingly
while(con_parameter > tolerance)                 
    syms alpha                             % alpha is later solved 
    search_dir = (hess1)\(-1*gradd1);      % detertmines search direction
    z = x_old + (alpha * search_dir);                               % ...these 4 lines are for
    f = myfunc(z);                                                  % ...finding exact value of 
    alpha = vpa(real(solve (diff(f,alpha) == 0, 'MaxDegree', 6)));  % ...alpha for each
    alpha = alpha(1);                                               % ...iteration

    x_new = x_old + (alpha * search_dir); % finds exact value of new point in current iteration
    
    % lb and ub loop limits
    if problem_number == 1                                          % ...this if/else loop
        if abs(myfunc(x_new)- myfunc(x_old)) < 1e-8                 % ...stops while loop's   
            break                                                   % ...cycle, once the 
        end                                                         % ...function values
    elseif problem_number == 2                                      % ...are approaching
        if abs(myfunc(x_new)- myfunc(x_old)) < 1e-4                 % ...a common value 
            break                                                   
        end                                                            
    elseif problem_number == 3                                      
        if abs(myfunc(x_new)- myfunc(x_old)) < 1e-3                    
            break
        end
    end
    
    gradd2 = grad(x_new);                   % computes the new gradient vector
    change_des = alpha * search_dir;        % change in design 
    change_grad = gradd2 - gradd1;          % change in gradient
    
    % updates while loop condition --> con_parameter
    i = length(gradd1);
    sum = 0;
    for j=1:1:i
        sum = sum + gradd1(j)^2;
    end
    con_parameter = sqrt(sum);
    
    % calculates correction matrices
    r = dot(change_grad,change_des);
    correction_matrix1 = (change_grad * transpose(change_grad)) / r;
    
    s = dot(gradd1,search_dir);
    correction_matrix2 = (gradd1 * transpose(gradd1)) / s;
    hess2 = hess1 + correction_matrix1 + correction_matrix2;
    
    %% print various data
    fprintf('B Matrix for iteration number %d is: \n', iternum);
    vpa(inv(hess2),5)           % ...Note that in BFGS method, we are interested in 
                                % ...B matrix that is inverse of Hessian Matrix
    fprintf('Once iteration number %d was completed, we have the following values: \n', iternum);
    % for 2 variables
    if (problem_number == 1 || problem_number == 2) 
        fprintf('Old Point: (%f, %f)\n', x_old(1), x_old(2));
        fprintf('New Point: (%f, %f)\n', x_new(1), x_new(2));
        fprintf('----------------------------------- \n');
    end
    % for 3 variables
    if problem_number == 3
        fprintf('Old Point: (%f, %f, %f)\n', x_old(1), x_old(2), x_old(3));
        fprintf('New Point: (%f, %f, %f)\n', x_new(1), x_new(2), x_new(3));
        fprintf('----------------------------------- \n');
    end
    % continues printing various data 
    fprintf('Old Function value: %f\n', myfunc(x_old));
    fprintf('New Function value: %f\n', myfunc(x_new));
    fprintf('----------------------------------- \n');
    fprintf('Alpha(step-size): %f\n', alpha);
    fprintf('----------------------------------- \n');
    fprintf('Old Gradient: (%f, %f)\n', gradd1(1), gradd1(2));
    fprintf('New Gradient: (%f, %f)\n', gradd2(1), gradd2(2));
    fprintf('----------------------------------- \n');
    fprintf('Direction Vector: (%f, %f)\n', search_dir(1), search_dir(2));
    fprintf('============================================== \n');
    

    
    
    % reassigns new variables for next itteration
    hess1 = hess2;
    x_old = x_new;
    gradd1 = gradd2; 
    
    % updates loop counter
    iternum = iternum+1;

end

fprintf('Tolerance was set at: %d\n', tolerance);


