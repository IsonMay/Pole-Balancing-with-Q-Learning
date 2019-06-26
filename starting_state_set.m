function [ state ] = starting_state_set(theta_range,x_range)
%output a random starting contition
%starting pole angle is in (-theta_range,+theta_range),
%starting cart position is in (-x_range,+x_range)

state = [2*theta_range*rand-theta_range, 0, 2*x_range*rand-x_range,0];

end
