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
% with some edits in version: 2.1 that is written by Jingqiao Zhang (jingqiao@gmail.com)

function [rnd1,rnd2] = RandIndex(NP1,SearchAgents_no)
warning off

rnd0 = 1 : SearchAgents_no;
NP0 = length(rnd0);

% == 1
rnd1  = floor(rand(1, NP0) * NP1) + 1;
Idx = (rnd1 == rnd0);
while sum(Idx) ~= 0
    rnd1(Idx) = floor(rand(1, sum(Idx)) * NP1) + 1;
    Idx = (rnd1 == rnd0);
end
% == 2
rnd2  = floor(rand(1, NP0) * NP1) + 1;
Idx = ((rnd2 == rnd1) | (rnd2 == rnd0));
while sum(Idx) ~= 0
    rnd2(Idx) = floor(rand(1, sum(Idx)) * NP1) + 1;
    Idx = ((rnd2 == rnd1) | (rnd2 == rnd0));
end
end