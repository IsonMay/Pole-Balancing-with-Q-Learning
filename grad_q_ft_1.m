function [gq] = grad_q_ft_1(state,action)
%d(q_function_1)/d(weights)

gq = [1;
    state(1);
    state(2);
    state(3);
    state(4);
    action];
end