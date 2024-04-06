function X = boundConstraint (X, Positions, lb,ub)

% if the boundary constraint is violated, set the value to be the middle
% of the previous value and the bound
%
% Version: 1.1   Date: 11/20/2007
% Written by Jingqiao Zhang, jingqiao@gmail.com
lu(1, :) = lb; lu(2, :) = ub;
[NP, ~] = size(Positions);   

%% check the lower bound
X_l = repmat(lu(1, :), NP, 1);
pos = X < X_l;
X(pos) = (Positions(pos) + X_l(pos)) / 2;

%% check the upper bound
xu = repmat(lu(2, :), NP, 1);
pos = X > xu;
X(pos) = (Positions(pos) + xu(pos)) / 2;
end