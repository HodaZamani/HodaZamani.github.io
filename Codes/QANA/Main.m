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
close all
clear
warning off

Algorithm_Name = 'QANA';

N = 100; % Number of Migratory Birds
Function_name = 'F1'; % Name of the test function that can be from F1 to F23 
Max_iteration = 500; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj] = Get_Functions_details(Function_name);
lu        = [lb * ones(1, dim); ub * ones(1, dim)]; % Lower and upper bounds
[Convergence_curve,Lbest,Fbest] = QANA(dim,Max_iteration,N,lu,fobj);
 
display(['The best solution obtained by QANA is : ', num2str(Lbest)]);
display(['The best optimal value of the objective funciton found by QANA is : ', num2str(Fbest)]);

%% 
figure('Position',[500 500 660 290])
%Draw search space
subplot(1,2,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

%Draw objective space
subplot(1,2,2);
semilogy(Convergence_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('QANA')


