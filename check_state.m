        function [yes] = check_state(state)
            %check, if condition is available, -0.209<theta<0.209, -2.4<x<2.4
            yes = 0;
            if ((state(1)>-0.209 && state(1)<0.209) && (state(3)>-2.4 && state(3)<2.4))
                yes = 1;
            end
        end
        