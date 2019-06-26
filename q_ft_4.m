function [q] = q_ft_4(state,action,weights)
%quartic approximation of Q function

x = [1,state,action];
w_4_tensor = zeros(6,6,6,6);
for i=1:1296
    w_4_tensor(i) = weights(i);
end
m = zeros(6);
for i=1:6
    for j=1:6
        m(j,i) = x*w_4_tensor(:,:,j,i)*x';
    end
end
q = x*m*x';
end