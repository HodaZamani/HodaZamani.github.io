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
clc
clear
warning off
format long
fprintf('QANA: Quantum-based avian navigation optimizer algorithm\n ')
fprintf('---------------------------------------------------------\n');
%% Problem Defination  
PopSize   = 100;      % Number of search agents
problem_size  = 10;   % Number of decisions variables
MaxIt     = 1000;     % Maximum numbef of iterations 
run       = 20;       % Number of times the QANA is executed for a specific problem 
lu        = [-100 * ones(1, problem_size); 100 * ones(1, problem_size)]; % Lower and upper bounds
%% Start
 for Func  = [1,3:30]  %  CEC 2018
    for run_id = 1: run
        [Convergence,Best_pos,Best_Fit] = QANA(problem_size, MaxIt, PopSize, lu, Func);
        fprintf('%d th run, Best-so-far Fitness = %1.8e\n', run_id , Best_Fit)
        QANA_Result(Func).Covergence(run_id,:) = Convergence;
        QANA_Result(Func).Position(run_id,:)   = Best_pos;
        QANA_Result(Func).Fitness(run_id)      = Best_Fit;
        save 'QANA.mat'
    end
end

