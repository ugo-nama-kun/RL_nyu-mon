% Show Obtained Optimal Action

greedyAction = zeros(N_state,1);
for s = 1:N_state
      [V(s), greedyAction(s)] = max(Q(s, :));
end

figure(3)
action_map = reshape(greedyAction, N_row, N_col);

imagesc(reshape(V, N_row, N_col))        
hold on
for i=1:N_row
    for j=1:N_col
        if map(N_row * (j-1) + i) == GOAL || map(N_row * (j-1) + i) == WALL
           continue;
        end
        
        switch action_map(i,j)
            case 1
                dp = [0 -0.3];
            case 2
                dp = [0 +0.3];
            case 3
                dp = [0.3, 0];
            case 4
                dp = [-0.3, 0];
        end
        
        p = [j i];
        vectarrow(p-dp,p+dp)
    end
end
hold off
title('Obtained Action and VF')