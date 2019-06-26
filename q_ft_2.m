function [q] = q_ft_2(state,action,weights)
%quadratic approximation of Q function

x = [1,state,action];
w_matrix = [weights(1:6),weights(7:12),weights(13:18),weights(19:24),weights(25:30),weights(31:36)];
q = x*w_matrix*x';
end