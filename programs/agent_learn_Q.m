% Action value (Q function) update

% TD error
if goal_flag ~= 1
    delta = Reward + gamma * max(Q(state_dash, :)) - Q(state, action); % Q-learning
else
    % Update at the termination of the Episode
    
    delta = Reward - Q(state, action); % Q-learning
end


% Q function update!
Q(state, action) = Q(state, action) + alpha * delta;