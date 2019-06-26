function [ r ] = down_reward_ft_th(state)
%reward function, relative with theta
if down_check_state(state)==0
    r = 0;
else
    r = 1-abs(state(1))/3.14159;
end

end

