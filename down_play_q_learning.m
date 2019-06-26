function [score,state_seq] = down_play_q_learning(q_s_a,t_max)
%return the playing time
%q_s_a is the Q function

%input (0,0,*,*) for using starting state_push, elsewise starting_state_set
state = down_starting_state();
score = 0;
action = [-10,0,10];
state_seq = zeros(t_max,2);
for i=1:t_max
    q = zeros(1,3);
    for j=1:3
        q(j) = q_s_a(state,action(j));
    end
    [~, argmax] = max(q);
    f = action(argmax);
    state = down_emulator(state, f);
    if check_state(state)==1
        score = score+1;
    end
    if down_check_state(state)~=1
        break
    end
    %disp(state);
    state_seq(i,1)=state(1);
    state_seq(i,2)=state(3);
end
disp('score:')
disp(score);
disp('terminated state:');
disp(state);
end