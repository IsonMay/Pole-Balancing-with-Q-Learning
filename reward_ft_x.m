function [ r ] = reward_ft_x(state)
%reward function, relative with theta and x
if check_state(state)==0
    r = 0;
else
    r = 1-abs(state(3))/2.4;
end

end

