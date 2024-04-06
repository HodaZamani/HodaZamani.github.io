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
function [Convergence,Score_best,X_best]= E_WOA(SearchAgents_no,Max_iter,problem_size,lb,ub)

% Initialize the positions of search agents
Positions = initialization(SearchAgents_no,problem_size,ub,lb);
for j = 1:SearchAgents_no
    Fitness(j,1)  = Function(Positions(j,:));
end
% Set the best position for leader
[temp_fit, sorted_index] = sort(Fitness, 'ascend');
X_best = Positions(sorted_index(1),:);
Score_best = temp_fit(1);
% ==================================================== %
P_rate =  20;                    % The portion rate
Pool.Kappa = 1.5 * SearchAgents_no;   % The maximum pool size  
Pool.position = zeros(0, problem_size);  % The solutions stored in the pool

Idx0 = (SearchAgents_no - (Pool.Kappa * 0.3)+1);
X_worst = Positions(sorted_index(Idx0: end),:);
Pool = Pooling_Mechanism(Pool,problem_size,X_worst, X_best);
 
Convergence = zeros(1,Max_iter);
t = 1;          
% Main loop
while t <= Max_iter
    
    a2 = -1+t*((-1)/Max_iter);
   
    % Randomly select a P portion of the humpback whales
    P_portion = randperm(SearchAgents_no,P_rate);
    
    Pop_Pool = Pool.position;
    [P_rnd1, P_rnd2] = RandIndex(size(Pop_Pool,1),  SearchAgents_no);
    
    %% Probability rate
    p = rand(SearchAgents_no, 1);
    
    %% Cauchy distribution
    A = 0.5 + 0.1 * tan(pi * (rand(SearchAgents_no, 1) - 0.5));
    Idx = find(A <= 0);
    while ~ isempty(Idx)
        A(Idx) = 0.5 + 0.1 * tan(pi * (rand(length(Idx), 1) - 0.5));
        Idx = find(A <= 0);
    end
    A = min(A, 1);   
    
    for i = 1:size(Positions,1)
        if (i ~= P_portion)
            C = 2*rand;      % Eq. (6) in the paper
            b = 1;            
            for j=1:size(Positions,2)
                l=(a2-1)*rand+1;                
                if p(i) < 0.5
                    if A(i) < 0.5     % Enriched encircling prey search strategy
                        rand_leader_index = floor(size(Pop_Pool,1)*rand()+1); % Randomly selected from the matrix Pool
                        P_rnd3 = Pop_Pool(rand_leader_index, j);
                        D_prim = abs(C * X_best(j) - P_rnd3);  % Eq. (17)
                        X(i,j) =  X_best(j)- A(i)*D_prim;      % Eq. (16)
                        
                    elseif A(i)>= 0.5 % Preferential selecting search strategy
                        X(i,j)   = Positions(i,j) + A(i)*( C* Pop_Pool(P_rnd1(i),j)- Pop_Pool(P_rnd2(i),j)) ; % Eq. (15)
                    end
                elseif p(i)>=0.5      % Spiral bubble-net attacking
                    D_prim =  abs(X_best(j)- Positions(i,j));           % Eq. (10)
                    X(i,j)=  D_prim * exp(b.*l).*cos(2*pi*l)+ X_best(j);% Eq. (9)
                end
            end
        end
    end
    %% Migrating search strategy
    best_max = max(X_best);
    best_min = min(X_best);
    P_portion = P_portion';
    X_rnd  =  rand(size(P_portion,1),problem_size).* (ub - lb) + lb;  % Eq.(13)
    X_brnd =  rand(size(P_portion,1),problem_size).*(best_max - best_min)+ best_min  ; % Eq.(14)
    X(P_portion, :)  = X_rnd -  X_brnd; % Eq.(12)
    
    %% Computing the fitness of whales
    for i = 1: size(Positions,1)
        X(i,:)   = boundConstraint(X(i,:), Positions(i,:), lb,ub);
        Fit(i,1) = Function(X(i,:));

        if Fit(i,1) < Score_best
            Score_best =  Fit(i,1);
            X_best   =  X(i,:);
        end
    end    
    I = (Fitness > Fit);
    Ind = find(I == 1);
    X_worst = Positions(Ind, :);
    % Definition 1. (Pooling mechanism)
    Pool = Pooling_Mechanism(Pool, problem_size, X_worst, X_best);
    
    % Updating the position of whales
    Fitness(Ind) = Fit(Ind) ;
    Positions(Ind, :) = X(Ind, :);    
    
    Convergence(t) = Score_best;
    t = t + 1;
end
end
