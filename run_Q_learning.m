%Initialization
action = [-10, 0, 10];
ep_max = 1e8; %max episode
t_max = 9e4; %max time steps, T
steps = 0; %step counter
%choose grade of function approximator
q_function = @(state,action,theta) q_ft_2(state,action,theta); 
grad_q_function = @(state,action) grad_q_ft_2(state,action);
weights = weights_zero_q_2; %weights for Q function
q_s_a = @(state,action) q_function(state,action,weights); %initialize the Q function
%setting the starting_state method, (0,0) is push, else set(theta_range,x_range)
theta_range = 0; %feasible range [0, 0.209]
x_range = 0; %feasible range [0, 2.4]
reward = @(state) check_state(state); %reward function 
epsilon = 0.5; %probability for a random action
gamma = 0.9; %discount rate
alpha = 1e-4; %learning rate, ??opt:2<1e-3,*4;3<1e-6,*8;4<1e-8

%Algorithm
for ep=1:ep_max
    %initialize starting state for each episode
    if theta_range==0 && x_range==0
        s = starting_state_push;
    else
        s = starting_state_set(theta_range,x_range);
    end
    t = 1;
    disp('episode:');
    disp(ep);
    while t<=t_max && check_state(s)==1
        e = rand;
        rand_act = epsilon; %probability to take a random action
        if e<rand_act
            i = randi(3);
            a = action(i);
        else
            q_max = zeros(1,3);
            for i=1:3
                q_max(i) = q_s_a(s,action(i));
            end
            [~, argmax] = max(q_max);
            a = action(argmax);
        end
        s_nxt = emulator(s,a);
        r = reward(s_nxt);
        if check_state(s_nxt)~=1
            y = r;
        else
            q_y = zeros(1,3);
            for i=1:3
                q_y(i) = q_s_a(s_nxt,action(i));
            end
            q_max_y = max(q_y);
            y = r+gamma*q_max_y;
        end
        %gradient descent
        grad_loss = (y-q_s_a(s,a))*grad_q_function(s,a);
        weights = weights+alpha*grad_loss;
        steps = steps+1;
        q_s_a = @(state,action) q_function(state,action,weights); %update Q function
        s = s_nxt;
        t = t+1;
    end
    %p = reshape(theta,[36,36]);
    %[u1,d1,v1] = svd(p);
    %disp(diag(1000*d1));
    
    
    %Test
    disp('test');
    score = 0;
    while score<10 && play_q_learning(theta_range,x_range,q_s_a,9e4)==9e4
        score = score+1;
        disp('score:')
        disp(score);
        disp(ep);
        disp(steps);
    end
    if score==10
        disp('done')
        disp('episodes:');
        disp(ep);
        disp('steps:');
        disp(steps);
        break
    end
    
end
