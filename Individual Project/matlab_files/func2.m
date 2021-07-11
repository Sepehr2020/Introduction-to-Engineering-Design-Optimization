function [c,ceq] = func2(x)
global problem_number

if problem_number == 1
    % Protein ratio//carb ratio//fat ratio//calorie intake and BMR minimum
    c = [0.1-((4*x(1))/(4*x(2) + 9*x(3))); 0.45-((4*x(2))/(4*x(1) + 9*x(3))); 
         0.2-((9*x(3))/(4*x(1) + 4*x(2))); 
         2000 - (4*x(1) + 4*x(2) + 9*x(3) + x(4) - 726*x(5) - 595*x(6) - 858*x(7) - 2000)];
    
    ceq = [];
end
end 