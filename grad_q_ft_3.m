function [gq_3] = grad_q_ft_3(state,action)
%d(q_function_3)/d(weights)

x = [1,state,action];
gq_2 = [1; state(1); state(2); state(3); state(4); action; %1:6
    state(1); state(1)^2; state(2)*state(1); state(3)*state(1); state(4)*state(1); action*state(1); %7:12
    state(2); state(1)*state(2); state(2)^2; state(3)*state(2); state(4)*state(2); action*state(2); %13:18
    state(3); state(1)*state(3); state(2)*state(3); state(3)^2; state(4)*state(3); action*state(3); %19:24
    state(4); state(1)*state(4); state(2)*state(4); state(3)*state(4); state(4)^2; action*state(4); %25:30
    action; state(1)*action; state(2)*action; state(3)*action; state(4)*action; action^2]; %31:36
gq_3 = zeros(216,1);
for i=1:6
    gq_3((i-1)*36+1:i*36) = gq_2*x(i);
end
end