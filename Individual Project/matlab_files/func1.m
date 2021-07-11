function [f,g] = func1(x)
global problem_number

if problem_number == 1
    % x1 = protein(gram)// x2 = carb(gram)//x3 = fat(gram)// x4 = empty calories 
    % x5 = hours of lap swimming (Moderate Intensity)//
    % x6 = hours of lap stationary cycling (Moderate Intensity)// x7 = hours of running (Moderate Intensity)
    % 2000 --> BMR(Basal Metabolic Rate, based on sex, age, weight, height)
    f = 4*x(1) + 4*x(2) + 9*x(3) + x(4) - 726*x(5) - 595*x(6) - 858*x(7) - 2000; % net calorie intake 
end
end

