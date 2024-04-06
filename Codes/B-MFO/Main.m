%___________________________________________________________________________%
%  B-MFO: A binary moth-flame optimization for feature selection from       %
%  medical datasets                                                         %
%  source codes version 1.0                                                 %
%                                                                           %
%  Developed in MATLAB R2018a                                               %
%                                                                           %
%  Author and programmer: Mohammad H. Nadimi-Shahraki, M. Banaie-Dezfouli,  %
%  Hoda Zamani, S. Taghian, S. Mirjalili                                    %
%                                                                           %
%  e-Mail: nadimi@iaun.ac.ir, mahdisdezfoulli@yahoo.com,                    %
%  hoda_zamani@yahoo.com, shokooh.taghian94@gmail.com,                      %
%  ali.mirjalili@gmail.com                                                  %
%                                                                           %
%  Computers 2021, 10, 136. https://doi.org/10.3390/computers10110136       %                                               %
%___________________________________________________________________________%
%% Binary moth-flame optimization 
clc, clear, close
% Benchmark data set 
load ionosphere.mat; 

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho,'Stratify',false);

% Parameter setting
N        = 10; 
max_Iter = 100;
% Binary moth-flame optimization
[sFeat,Sf,Nf,curve] = B_MFO(feat,label,N,max_Iter,HO);

% Plot convergence curve
plot(1:max_Iter,curve);
xlabel('Number of Iterations');
ylabel('Fitness Value');
title('B_MFO'); grid on;

