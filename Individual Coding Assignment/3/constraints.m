function [c,ceq] = constraints(x)
global question_number

if question_number == 1
c = [];
ceq = [];
end

if question_number == 2
c = [];
ceq = [];
end

if question_number == 3
c = [-10*x - 3*y + 25];
ceq = [];
end

end