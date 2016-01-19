% Action value (Q function) update

% TD error
if goal_flag ~= 1
    delta = Reward + gamma * max(Q(state_dash, action_dash)) - Q(state, action); % SARSA
else
    % Update at the termination of the Episode    
    delta = Reward - Q(state, action); % SARSA
end


% Q function update!
Q(state, action) = Q(state, action) + alpha * delta;