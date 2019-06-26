%decide the next move under the state=[theta, theta_1, x, x_1]
%policy is the weight function k
function [f_adj] = decide(k, state)
z = dot(k, state);
f = 20 * sigmf(z, [1 0]) - 10;
%rounding to fit Bang-Bang controller
if f <= -1;
    f_adj = -10;
elseif f >= 1;
    f_adj = 10;
else
    f_adj = 0;
end
end