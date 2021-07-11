function [output] = shubertFunc(x)

sum1 = 0;
product1 = 1;

for i = 1:10
    
    for j = 1:5
        sum1 = sum1 + j*cos((j+1)*x(i)+j);
    end
    product1 = product1*sum1;
end

output = product1;

end