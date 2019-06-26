function [ new_state ] = down_emulator(state, f)
%according to [1]
      
    mc = 1; %kg, Mass of cart
    mp=0.1; %kg, Mas of pole
    g = -9.81; %m/s^2, Gravitational Acceleration
    l = 0.5; %m, Distance from pivot to mass centre of pole, length=2*l
    tau = 0.02; %s, Time step
    
    %state=[theta,theta_1,x,x_1]
    theta = state(1); %rad, Pole angle
    theta_1 = state(2); %rad/s, Pole velocity
    x = state(3); %m, Cart position
    x_1 = state(4); %m/s, Cart velocity
    
    %Differential equation of motion of pole
    theta_2 = (g * sin(theta) + cos(theta)*((-f - mp * l * (theta_1)^2 * sin(theta)) / (mc + mp))) / (l * (4/3 - (mp * (cos(theta))^2) / (mc +mp))); %rad/s^2, Pole acceleration
    %Differential equation of motion of cart
    x_2 = (f + mp * l * (theta_1^2 * sin(theta) - theta_2 * cos(theta)) / (mc + mp)); %m/s^2, Cart acceleration
    
    %Discrete time equations for pole angle and angular velocity
    new_theta = theta + tau * theta_1; %rad, Pole angle in new state
    new_theta_1 = theta_1 + tau * theta_2; %rad/s, Pole velocity in the new state
    %Discrete time equations for cart position and velocity
    new_x = x + tau * x_1; %m, Cart position in the new state
    new_x_1 = x_1 + tau * x_2; %m/s, Cart velocity in the new state
    
    %new added 3.14159
    if new_theta > 3.14159
        new_theta = new_theta - 6.28319;
    else
        if new_theta < -3.14159
         new_theta = new_theta + 6.28319;
        end
    end
    %finish
    
    new_state = [new_theta, new_theta_1, new_x, new_x_1];
end

