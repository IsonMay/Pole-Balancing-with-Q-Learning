function [ state ] = starting_state_push()
%output a random starting contition
%give a random force [-2,+2] N at [0,0,0,0]

f = 2*rand-4;
state = emulator(zeros(1,4),f);

end

