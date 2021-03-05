function [f,g] = func1(x)
global problem_number
%%
if problem_number == 1
    f = ((1/6.931) - ((x(1)*x(2))/(x(3)*x(4))))^2;
end
%%
if problem_number == 2
    a = load('a.mat').a;
    t = 0;
    for i=1:16
        for j=1:16
        t = t + (a(i,j) * (x(i)^2 + x(i) + 1) * (x(j)^2 + x(j) +1));
        end
    end
    f = t;
end
%%
if problem_number == 3
    t = 0;
    q = 0;
    for i=1:3
        t = (x(i) - (1/sqrt(3)))^2 + t;
    end
    f(1) = 1 - exp(-1*t);
    
    for i=1:3
        q = (x(i) + (1/sqrt(3)))^2 + q;
    end
    f(2) = 1 - exp(-1*q);
end
%%
if problem_number == 4
    f(1) = 1 - (exp(-4*x(1)) * sin(6*pi*x(1))^6);
    t = 0;
    for i=2:10
        t = x(i)+t;
    end
    t = t/9;
    g = 1 + (9 * (t)^0.25);
    f(2) = (f(1)/g)^2;

end
end

