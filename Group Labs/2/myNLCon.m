function [c,ceq] = myNLCon(x)
global question_number

if question_number == 3
c = [-(x(2)^2 +2*x(1) - 1.5*x(1)^2 - 1); -(-x(2)^2 - 2*x(1)^2 + 2*x(1) + 4.25)];
ceq = [];
end

if question_number == 4
c = [x(1)^2 + x(2)^2 - 1];
ceq = [];
end

if question_number == 5
c = [-((x(3) - 3)^2 + x(4) - 4);-((x(5) - 3)^2 + x(6) - 4)];
ceq = [];
end

end