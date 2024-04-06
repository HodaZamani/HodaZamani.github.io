% =========================================================================
%     QANA: Quantum-based avian navigation optimizer algorithm
%        Engineering Applications of Artificial Intelligence
%              Volume 104, September 2021, 104314
%   https://www.sciencedirect.com/science/article/abs/pii/S0952197621001627
%   https://www.researchgate.net/publication/352644454_QANA_Quantum-based_
%            avian_navigation_optimizer_algorithm/comments
%   https://doi.org/10.1016/j.engappai.2021.104314
%           ---------------------------------------------
%  Authors: HodaZamani, Mohammad H.Nadimi-Shahraki*, Amir H.Gandomi
%  *Corresponding author: Faculty of Computer Engineering, Najafabad 
%                Branch, Islamic Azad University, Najafabad, Iran.
%  e-Mails: hoda_zamani@yahoo.com, nadimi@ieee.org, 
%           nadimi.mh@gmail.com, a.h.gandomi@gmail.com
% =========================================================================
function [Convergence,Best_pos,Best_Fit]  = QANA ( problem_size, MaxIt, PopSize, lu,Func)
%% Parameter Settings for QANA
t = 1;
FN          = 10;                 % Number of flocks
FS          = PopSize/FN;         % Number of search agents in each flock
Mutant_St   = 2;                  % Number of proposed quantum mutation strategies
STMSize     = 50;                 % Maximum size of short-term Memory
Mem_QunOrnt = 0.5 .* ones(problem_size, 1);   % Self-adaptive Quantum Orientation
LTMSize     = 9;                  % Mmaximum size of the Long-term Memory
LTM.Pop = zeros(0, problem_size); % Solutions stored in the Long-term Memory
LTM.Fitness = zeros(0, 1);        % Function value of the solutions
LTM.CurrentSize = zeros(0, 1);    % Current Size of the Long-term Memory
memory_pos  = 1;
Policy_perc = 70; % The majority of flocks is assigned to the winner mutation strategy.  
%% Population Initialization and Policy determination of the first iteration 
GeoPos = repmat(lu(1,:), FN,1)+ rand(FN,problem_size).* (repmat(lu(2,:)-lu(1,:),FN,1));
First = 1; Popold = [];
for i = 1: FN
    Popold = [Popold ; max(GeoPos(i,:)) + (min(GeoPos(i,:)) - max(GeoPos(i,:)))* rand(FS,problem_size)];
    Flock_id(i,:)= First: i * FS;
    First = size(Popold,1)+1;
end
Fitness = cec17_func(Popold',Func)';
[Best_Fit,Id] = min(Fitness);
Best_pos =  Popold(Id, :);

temp = repmat(1: Mutant_St ,1,FN/2); Policy = temp(randperm(FN,FN));
[~, Wst]    = sort(Fitness, 'descend');
STM.Pop     = Popold(Wst(1:STMSize), :);
% Main
while t <= MaxIt
    Pop = Popold;
    LTM =  Long_Term_Memory(t,LTM,Fitness,Pop,PopSize,LTMSize);
    %% Definition 5 (Self-adaptive Quantum Orientation).
    y      = rand; w = 1.760859708 ;  k = 0.3;
    mu_Si  = Mem_QunOrnt(ceil(problem_size * rand(PopSize, 1)));
    Phi_Si = (( 6 .*(k ^2)+ 5 .*(w^2)+(w ^2) .*cos(2.* y))./(16 *(k^2 + w^2)))';
    Si     =  mu_Si +(max((rand(PopSize, 1) - 0.5) + rand *(Phi_Si  -  mean(Phi_Si)),[],2));
    pos    = find(Si <= 0);
    while ~  isempty(pos)
        Si(pos) = mu_Si(pos)+(max((rand(length(pos), 1) - 0.5) + rand *(Phi_Si  -  mean(Phi_Si)),[],2));
        pos     = find(Si <= 0);
    end
    pos     = find(Si > 1);
    while ~  isempty(pos)
        Si(pos) = mu_Si(pos)+(max((rand(length(pos), 1) - 0.5) + rand *(Phi_Si  -  mean(Phi_Si)),[],2));
        pos = find(Si > 1);
    end
    %% Definition 6 (Qubit-crossover Probability).
    Theta = rand(PopSize, 1) * (pi/2);
    ket_0 = [1;0];  ket_1 = [0;1];
    for i = 1: PopSize
        for j = 1 : problem_size
            cr_temp = rand *(cos(Theta(i,1)/2)* ket_0) + (exp(1i*Theta(i,1)/2)* sin(Theta(i,1)/2)*ket_1);
            cr1 = imag(cr_temp(1))^2  + real(cr_temp(1))^2;
            cr2 = imag(cr_temp(2))^2  + real(cr_temp(2))^2;
            Qubit_cr (i,j) =  cr1 + cr2;
            Qubit_cr (i,j) = min(Qubit_cr (i,j), 1); Qubit_cr (i,j) = max(Qubit_cr (i,j), 0);
        end
    end   
%% Migration
    for y = 1:  FN
        % V-echelon communication topology
        [H,L,R,Vechelon_Left,Vechelon_Right] = V_Echolon_Topology(Flock_id(y,:),Fitness);        
        LTM_Left  = cell2mat({LTM(L).Pop}');
        LTM_Right = cell2mat({LTM(R).Pop}');
        if Policy(y) == 1       % Quantum mutation strategy 1
            S01 = randperm (size(STM.Pop,1),length(L));
            S02 = randperm (size(STM.Pop,1),length(R)); % Rand indexes for Short-term memory 
            [L01, L02, R01, R02 ] = RndLTM (L,LTM_Left,R,LTM_Right);  % Rand indexes for Long-term memory            
            vi (L,:) = Best_pos +Si(L,:).*(Pop(Vechelon_Left,:)- LTM_Left(L01,:) )+ ...
                Si(L,:).*(Pop (Vechelon_Left,:)- Best_pos)+ Si(L,:).*(LTM_Left(L02,:) -  STM.Pop(S01,:));
            r2 = randperm(size(R,1));
            vi (R,:) = Best_pos +Si(R,:).*(Pop(Vechelon_Right,:)- LTM_Right(R01,:) )+ ...
                Si(R,:).*(Pop (Vechelon_Right,:)-Best_pos)+ Si(R,:).*(LTM_Right(R02,:) - STM.Pop(S02,:));
            vi (H,:) = Si(H,:).* Best_pos + (lu(1,:) +(lu(2,:)-lu(1,:)).* rand(1,problem_size));
            % -----------------------------------------------------------------
        else  % Quantum mutation strategy 2
            S01 = randperm (size(STM.Pop,1),length(L));
            S02 = randperm (size(STM.Pop,1),length(R)); % Rand indexes for Short-term memory
            [L01, ~, R01, ~ ] = RndLTM (L,LTM_Left,R,LTM_Right);  % Rand indexes for Long-term memory
            vi (L,:) =  Si(L,:).*(Best_pos - Pop(Vechelon_Left,:)) + Si(L,:).*( Pop(L,:)+ LTM_Left(L01,:)-  STM.Pop(S01,:));
            vi (R,:) =  Si(R,:).*(Best_pos - Pop(Vechelon_Right,:))+ Si(R,:).*( Pop(R,:)+ LTM_Right(R01,:)- STM.Pop(S02,:));
            vi (H,:)  = Si(H,:).* Best_pos + (lu(1,:) +(lu(2,:)-lu(1,:)).* rand(1,problem_size));
        end
    end
%% Check and correct the bound
     Lower = repmat(lu(1, :), PopSize, 1);
     vi(vi < Lower) = (Pop(vi < Lower) + Lower(vi < Lower)) / 2;
     Upper = repmat(lu(2, :), PopSize, 1);
     vi(vi > Upper) = (Pop(vi > Upper) + Upper(vi > Upper)) / 2;
%% Qubit-Crossover oprator
    mask = rand(PopSize, problem_size)<= Qubit_cr;
    cols = floor(rand(PopSize, 1) * problem_size)+1;
    jrand = sub2ind([PopSize problem_size], (1 : PopSize)', cols);
    mask(jrand) = false;
    ui = vi; ui(mask) = Pop(mask);
    children_fitness = cec17_func(ui',Func)'; 
%%  Best fitness and position  
    [~, id] = min (children_fitness);
    if children_fitness(id) < Best_Fit
        Best_Fit = children_fitness(id);
        Best_pos = ui(id, :);
    end 
%% Definition 4 (SPD Policy). The success-based population distribution policy
    Policy = SPD (Policy,Policy_perc ,Mutant_St,FN, Flock_id, Fitness,children_fitness);
    STM =  Short_Term_Memory(STM,STMSize,Fitness,children_fitness,Pop); 
%% [R.Tanabe, A.Fukunaga, 2013, SHADE]
    dif = abs(Fitness - children_fitness);
    I = (Fitness > children_fitness);  
    goodF = Si(I == 1);
    dif_val = dif(I == 1);
    [Fitness, I] = min([Fitness, children_fitness], [], 2);
    Popold = Pop;
    Popold(I == 2, :) = ui(I == 2, :);
    num_success_params = numel(goodF);   
    if num_success_params > 0
        sum_dif = sum(dif_val);
        dif_val = dif_val / (sum_dif);
        Mem_QunOrnt(memory_pos) = (dif_val' * (goodF .^ 2)) / (dif_val' * goodF);
        memory_pos = memory_pos + 1;
        if memory_pos > problem_size;  memory_pos = 1;
        end
    end
%% Flock Construction.
    FS = floor (PopSize/FN);  Flock_id = reshape (randperm(PopSize) ,[FN,FS]);
%  Save results    
    Convergence(t) = Best_Fit;
    MeanFitness(t) = mean(Fitness);
    fprintf('%d th iteration, Best-so-far Fitness = %1.8e\n', t , Best_Fit)
    t = t + 1; 
end
end % end function
 
function [L01, L02, R01, R02 ] = RndLTM(L,LTM_Left,R,LTM_Right)
    L01 = randperm (size(LTM_Left,1),length(L));
    L02 = randperm (size(LTM_Left,1),length(L));
    pos = find(L01 == L02);
    while ~ isempty(pos)
        L02(pos) = floor(rand(length(pos), 1) * length(L)) + 1;
        pos = find(L02 == L01);
    end
    R01 = randperm (size(LTM_Right,1),length(R)); 
    R02 = randperm (size(LTM_Right,1),length(R)); 
    pos = find(R01 == R02);
    while ~ isempty(pos)
        R02(pos) = floor(rand(length(pos), 1) * length(R)) + 1;
        pos = find(R02 == R01);
    end
end 
 