% Action selection


% Action selection : epsilon-greedy
% rnd = rand;
% if rnd < epsilon
%     action_dash = randi(N_action); % Random action selection
% else
%    [~, action_dash] = max(Q(state,:)); % Greedy action selection
% end


%% Action selection : softmax
p = Q(state, :)/tau;
p = exp(p - max(p)); % a numerical trick. not to `p' become too large value. 
Z = sum(p); 
p = p/Z; % Action selection probability

rnd = rand;
for tmp_action = 1:N_action
    if rnd < sum(p(1:tmp_action))
        action_dash = tmp_action;
        break
    end
end
