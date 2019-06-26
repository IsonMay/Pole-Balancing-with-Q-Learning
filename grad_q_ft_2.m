function [gq_2] = grad_q_ft_2(state,action)
%d(q_function_2)/d(weights)

x = [1,state,action];
gq_1 = [1; state(1); state(2); state(3); state(4); action];
gq_2 = zeros(36,1);
for i=1:6
    gq_2((i-1)*6+1:i*6) = gq_1*x(i);
end