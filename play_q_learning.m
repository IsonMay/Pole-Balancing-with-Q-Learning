function [t] = play_q_learning(theta_range,x_range,q_s_a,t_max)
%return the playing time
%q_s_a is the Q function

%input (0,0,*,*) for using starting state_push, elsewise starting_state_set
if theta_range==0 && x_range==0
    state = starting_state_push;
else
    state = starting_state_set(theta_range,x_range);
end

t = 0;
action = [-10,0,10];
for i=1:t_max
    q = zeros(1,3);
    for j=1:3
        q(j) = q_s_a(state,action(j));
    end
    [~, argmax] = max(q);
    f = action(argmax);
    state = emulator(state, f);
    if check_state(state)~=1
        break
    end
    t = t+1;
end
disp('playing time (minutes):')
disp(t/(50*60))
disp('terminated state:');
disp(state);
end