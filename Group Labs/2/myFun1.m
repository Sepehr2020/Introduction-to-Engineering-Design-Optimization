function [f,g] = myFun1(x)
global question_number

if question_number == 1
    f = (x(1)^2 + 12*x(2) -1)^2 + (49*x(1)^2 + 49*x(2)^2 + 84*x(1) + 2324*x(2) - 681)^2;
end

if question_number == 2
    f = (x(1)+10*x(2))^2 + 5*(x(3)-x(4))^2 + (x(2)-2*x(3))^4 + 10*(x(1)-x(4))^4;
end

if question_number == 3
    f = 4*x(1)^2 + x(1) - x(2) - 2.5;
    g = [8*x(1);-1];
end

if question_number == 4
    f = 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
    g = [-400*(x(2)-x(1)^2)*x(1)-2*(1-x(1));200*(x(2)-x(1)^2)];

end

if question_number == 5
    f = -[25*(x(1) - 2)^2 + (x(2) - 2)^2 + (x(3) - 1)^2 + (x(4) - 4)^2 + (x(5) - 1)^2 + (x(6) - 4)^2 ];
    g = [-50*(x(1)-2);-2*(x(2)-2);-2*(x(3)-1);-2*(x(4)-4);-2*(x(5)-1);-2*(x(6)-4)];
end

end