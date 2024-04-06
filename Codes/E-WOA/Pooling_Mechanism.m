% =========================================================================
%
%     Enhanced whale optimization algorithm (E-WOA) source codes 
%
%  Authors: Mohammad H.Nadimi-Shahraki, Hoda Zamani,Seyedali Mirjalili
% 
%           --------------------------------------------- 
% Papers: Enhanced whale optimization algorithm for medical feature selection: A COVID-19 case study
%         Computers in Biology and Medicine,Volume 148, September 2022, 105858.
% https://www.sciencedirect.com/science/article/pii/S0010482522006126 
% https://doi.org/10.1016/j.compbiomed.2022.105858
%           ---------------------------------------------
% More materials are available on ResearchGate and for any questions please contact the authors.
% Emails:nadimi.mh@gmail.com, hoda_zamani@yahoo.com, ali.mirjalili@gmail.com
% =========================================================================
function Pool = Pooling_Mechanism(Pool,problem_size,X_worst, X_best)
 
% Definition 1. (Pooling mechanism) 
best_max = max(X_best);
best_min = min(X_best);

B = randi([0 1], size(X_worst,1),size(X_worst,2));
X_brnd = rand(size(X_worst,1),problem_size).*(best_max - best_min) + best_min ; % Eq.(14)
P = B.* X_brnd  + ~B .* X_worst;   % Eq.(11)

%% Store to Pool
PoolCrntSize = size(Pool.position,1);
FreeSpace = abs(Pool.Kappa - PoolCrntSize ) ;
P = unique(P, 'rows');
if FreeSpace ~= 0
    if size (P,1) <= FreeSpace
        PopAll = [Pool.position ; P];
        PopAll = unique(PopAll, 'rows');
        Pool.position = PopAll;
    else
        Pool.position (PoolCrntSize+1:Pool.Kappa,:) = P(1:FreeSpace,:);
        Rm  = size(P,1) - FreeSpace;
        rnd = randi(PoolCrntSize,Rm,1);
        Pool.position(rnd,:) = P(FreeSpace+1:end,:);
    end
else
    rnd = randi(PoolCrntSize,size(P,1),1);
    Pool.position(rnd,:) = P;
end
Pool.position = unique(Pool.position, 'rows');
end
