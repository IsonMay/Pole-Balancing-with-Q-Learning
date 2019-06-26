function [q] = q_ft_3(state,action,weights)
%cubic approximation of Q function

x = [1,state,action];
w_3_tensor = zeros(6,6,6);
for i=1:216
    w_3_tensor(i) = weights(i);
end
v = zeros(6,1);
for i=1:6
    v(i) = x*w_3_tensor(:,:,i)*x';
end
q = x*v;
end