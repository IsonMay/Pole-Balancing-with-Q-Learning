function [ r ] = reward_ft_th(state)
%reward function, relative with theta
if check_state(state)==0
    r = 0;
else
    r = 1-abs(state(1))/0.209;
end

end

