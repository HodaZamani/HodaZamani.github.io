function vi = boundrycheck (vi, pop, lu)
[NP, D] = size(pop);  

%% check the lower bound
xl = repmat(lu(1, :), NP, 1); 
pos = vi < xl;
vi(pos) = (pop(pos) + xl(pos)) / 2; % if the lower bound is violated, set the value to be the middle of the previous value and the lower bound

%% check the upper bound
xu = repmat(lu(2, :), NP, 1);
pos = vi > xu;
vi(pos) = (pop(pos) + xu(pos)) / 2; % if the upper bound is violated, set the value to be the middle of the previous value and the upper bound