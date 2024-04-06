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
clc
clear
warning off
format long;
format compact;
rand('seed', sum(100 * clock));
fprintf('---------------------------------------------------------\n');
fprintf('      E-WOA: An enhanced whale optimization algorithm\n')
fprintf('---------------------------------------------------------\n');
%% Problem Defination
SearchAgents_no   = 100;   % Number of search agents
problem_size  = 10;        % Number of decisions variables
MaxIt = (10000*problem_size)/SearchAgents_no;   % Maximum number of iterations
run  = 2;   % Number of times that the E_WOA is executed for a specific problem
lb  = -10 * ones(1, problem_size); % Lower bound
ub  =  10 * ones(1, problem_size); % Upper bound

%% Start
for j = 1: run
    [Convergence,score_best,X_best] = E_WOA(SearchAgents_no, MaxIt,problem_size,lb,ub);
    fprintf('%d th run, Best-so-far Fitness = %1.8e\n', j , score_best)
    E_WOA_Result.Covergence(j,:) = Convergence;
    E_WOA_Result.Fitness(j)      = score_best;
    E_WOA_Result.Position(j,:)   = X_best;
    save 'E_WOA_Results.mat'
end

%% Print 
fprintf('---------------------------------------------------------\n');
fprintf('The results of E-WOA are summarized as follows: \n')
fprintf('  Average = %1.8e\n', mean (E_WOA_Result.Fitness));
fprintf('  Std = %1.8e\n', std (E_WOA_Result.Fitness));
fprintf('  Min = %1.8e\n', min (E_WOA_Result.Fitness));
fprintf('------------------------------\n');
 
%% Draw  
[~,MinId] = min (E_WOA_Result.Fitness);
plot(E_WOA_Result.Covergence(MinId,:), 'LineWidth', 2 ,'Color','r')
title ('Convergence curve');
xlabel('Iteration', 'FontSize', 12);
ylabel('Best score', 'FontSize', 12);

grid on
box on
legend('E-WOA')
set(gca,'FontName','Times New Roman','FontSize',20 );