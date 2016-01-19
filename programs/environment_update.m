% Environment Update

map_vec = map(:);

new_state = state;
switch action
    case 1 % UP
        if sum(state == 1:N_row:N_state) == 0
            new_state = state - 1;
        end
    case 2 % DOWN
        if sum(state == N_row:N_row:N_state) == 0
            new_state = state + 1;
        end
    case 3 % RIGHT
        if sum(state == (N_state-N_row):N_state) == 0
            new_state = state + N_row;
        end
    case 4 % LEFT
        if sum(state == 1:N_row) == 0
            new_state = state - N_row;
        end
end


% Reward
Reward = -1;

if map_vec(new_state) == WALL % Wall Treatment
    
    new_state = state;

elseif map_vec(new_state) == GOAL % Goal teratment : episode terminated

    goal_flag = 1;

    Reward = 0; % Reward at the Goal step

end

state_dash = new_state;