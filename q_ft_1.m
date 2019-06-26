function [q] =q_ft_1(state,action,weights)
%linear approximation of Q function
%weights = [w1,w2,w3,w4,w5]
x = [1,state,action];
q = dot(x,weights);
end