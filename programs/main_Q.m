  clear all; close all; clc
figure(1)
figure(2)

fprintf('-----------------------------------------------\n')
fprintf('RL learning algorithm in the Maze World!\n')
fprintf('Naoto Yoshida 09-11-2014\n')
fprintf('\n')
fprintf('Press any key to START! \n')
pause

% Experiment settings
maxEpisode = 300;

% Map of the environment
% 0 : none
% 1 : wall
% 2 : start
% 3 : goal
WALL  = 1;
START = 2;
GOAL  = 3;
map = [ 0 0 0 0 0 0 0 1 3;
    0 0 1 0 0 0 0 1 0;
    2 0 1 0 0 0 0 1 0;
    0 0 1 0 0 0 0 0 0;
    0 0 0 0 0 1 0 0 0;
    0 0 0 0 0 0 0 0 0];


N_col    = size(map,2);
N_row    = size(map,1);
N_state  = N_col * N_row;
N_action = 4;



% Visualization variables
V = zeros(N_state, 1); % Value function : max_a (Q(s,a)) (Action value with respect to the greedy action)
Steps_to_goal = zeros(maxEpisode, 1); % Steps to the goal @ each episodes



% Agent parameters
alpha    = 0.1;  % learning rate
gamma    = 0.95; % discount factor
% epsilon  = 0.1;  % epsilon-greedy action selection parameter
tau      = 1;  % sofmax action selection parameter


% Initialization
Q = 0.0001 * randn(N_state, N_action); % Q-function with random initialization


% Main loop
for episode = 1:maxEpisode
    steps      = 0;
    goal_flag  = 0;
    [~, state] = max(map(:) == 2); % initial state is at `2'
    
    
    while goal_flag == 0
        % action selection : get action
        agent_policy
        action = action_dash;
        
        % environment update : get state_dash, reward
        environment_update
        
        % agent learning step
        agent_learn_Q
        
        % update
        steps  = steps + 1;
        state  = state_dash;
        
        
        %         Show current situation
%        figure(1) % Show Environment
%        a_pos = reshape((1:N_state == state_dash), N_row, N_col);
%        visual = 0.6* a_pos - map/3;
%        set(gca, 'YDir','normal')
%        imagesc(visual)
%        caxis([-1, 1])

		% Comment out if you run the program in MATLAB!!
        fflush(stdout);
        
		% elese comment out if you want to watch more slowly 
        % pause(0.2)

		drawnow
    end
    

	fprintf('Episode %d ::: steps to the GOAL : %d steps \n', episode, steps)

    % show episodic performance and value function
    Steps_to_goal(episode) = steps;
    for s = 1:N_state
        V(s) = max(Q(s, :));
    end
    
    figure(2)
    subplot(2,1,1)
    imagesc(reshape(V, N_row, N_col)) % plot value function
    title('Value Function')
	
    subplot(2,1,2)
    plot(Steps_to_goal(1:episode)) % plot performance
    axis([1, maxEpisode, 0, 800])
    title('Performance')
	
	drawnow
end


% show obtained action
showAction


fprintf('Experiment Finished.\n')
