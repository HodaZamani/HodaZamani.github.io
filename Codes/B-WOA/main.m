
%% ======================================================================== 
%           Feature selection based on whale optimization algorithm 
%                       for diseases diagnosis  
%                Hoda Zamani, Mohammad-Hossein Nadimi-Shahraki

%        International Journal of Computer Science and Information Security
%                   (IJCSIS),Vol. 14, No. 9, September 2016
%            -----------------------------------------------------------
%                    Source codes developed in MATLAB R2016b 
%                                Programmers:                                   
%                 Hoda Zamani, Mohammad-Hossein Nadimi-Shahraki 
%                E-Mail: hoda_zamani@yahoo.com,nadimi@ieee.org                    
%           -----------------------------------------------------------                                                             
%  Homepage: https://scholar.google.com/citations?user=sT0YnDIAAAAJ&hl=en 
%  Homepage: https://scholar.google.com/citations?user=bpZOZWsAAAAJ&hl=en
% ========================================================================  
clc
clear
warning off;
global DataSet trn vald;
tic;
fprintf('==================================================================================\n');
fprintf(' Feature selection based on whale optimization algorithm for diseases diagnosis\n ')
fprintf('   International Journal of Computer Science and Information Security(IJCSIS)\n ')                     
fprintf('                        Vol. 14, No. 9, September 2016\n')  
fprintf('       ------------------------------------------------------------------\n');
start_time = java.lang.System.currentTimeMillis;
warning off
format shortG;
format compact;
%%  Initial parameter values
Runs = 1;              %   The number of runs
Searchagents = 30;      %  The number of search agents
Max_It = 100;           %   The maximum number of iterationS 
%% Missing data:Yes     Numbers of Features:   	 Numbers of Samples: 	Number of classes:  
Data = load('breastUCI.mat');         CaseName = 'Original Wisconsin Breast Cancer';           
DataSet = Data.breast;
Samples = size(DataSet,1);
Features = size(DataSet,2);
Tmp = randperm(size(DataSet,1));
trn = Tmp(1:floor(length(Tmp)*0.8));           %   The maximum number of iterationS
vald = Tmp(floor(length(Tmp)*0.8)+1:end);      %   The maximum number of iterationS
p = size(DataSet,2)-1;
%% Run the BWOA algorithm
Bests = [];
Lbests = [];
BWOA_SFitness = [];
BWOA_MeansErr = [];
fprintf('           Dataset: Original Wisconsin Breast Cancer\n')
fprintf('       Numbers of Samples = %d, Numbers of Features = %d\n',Samples,Features)
for run = 1: Runs  
    [BestChart,Fitness,Fbest,Accuracy,NumFeatures]=  BWOA(Searchagents,Max_It,size(DataSet,2)-1,'AccSz');
    BWOA_NumFeatures(run) = sum (NumFeatures==1);
    BWOA_Convergence(run,:) = BestChart;
    BWOA_SFitness(run) = Fitness;
    BWOA_MeansErr(run) = Fbest;  
    BWOA_Accuracy(run,:) = Accuracy;
    BWOA_MaxAccuracy(run,:) = max(Accuracy);
    save 'BWOA.mat';
end

fprintf('                               %s\n', datestr(now));
fprintf('==================================================================================\n');