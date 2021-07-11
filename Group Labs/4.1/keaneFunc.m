function [output] = keaneFunc(x)

sum1 = 0;
product1 = 1;
sum2 = 0;

for i = 1:5
sum1 = sum1 + cos(x(i))^4;
product1 = product1*cos(x(i))^2;
sum2 = sum2 + (i*x(i)^2);
end


output = -((sum1-2*product1)/(sum2)^0.5);

end