%return the df/dk, gradient of f
function [gf] = grad_f(k, state)
z = dot(k,state);
%f = 20*sigmf(z,[1 0])-10;
gf = [20*sigmf(z,[1 0])*(1-sigmf(z,[1 0]))*state(1);
    20*sigmf(z,[1 0])*(1-sigmf(z,[1 0]))*state(2);
    20*sigmf(z,[1 0])*(1-sigmf(z,[1 0]))*state(3);
    20*sigmf(z,[1 0])*(1-sigmf(z,[1 0]))*state(4)];
end
