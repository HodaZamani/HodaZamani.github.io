%_______________________________________________________________________________________%
%  source code:  GGWO: Gaze cues learning-based grey wolf optimizer and                 %
%                its applications for solving engineering problems                      %
%                                                                                       %
%  Developed in: MATLAB R2018a                                                          %
% --------------------------------------------------------------------------------------%
%  Main paper:   GGWO: Gaze cues learning-based grey wolf optimizer and                 %
%                its applications for solving engineering problems                      %
%                Mohammad H Nadimi-Shahraki, Shokooh Taghian, Seyedali Mirjalili,       %
%                Hoda Zamani, Ardeshir Bahreininejad                                    %
%                Journal of Computational Science                                       %
%                Volume 61, May 2022, 101636                                            %
%                DOI: 10.1016/j.jocs.2022.101636                                        %
%                https://www.sciencedirect.com/science/article/pii/S1877750322000588    %
%                                                                                       %
%  Emails:       nadimi@ieee.org, shokooh.taghian94@gmail.com, ali.mirjalili@gmail.com, %
%                hoda_zamani@yahoo.com, bahreininejad@gmail.com                        %
%_______________________________________________________________________________________%

% You can simply define your cost in a seperate file and load its handle to fobj 
% The initial parameters that you need are:
%__________________________________________
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of generations
% N = number of search agents
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% If all the variables have equal lower bound you can just
% define lb and ub as two single number numbers

% To run GGWO: [Fbest,Lbest,Convergence_curve] = GGWO(dim,N,Max_iter,lb,ub,fobj)
%__________________________________________

close all
clear
clc

Algorithm_Name = 'GGWO';

N = 30; % Number of wolves
Function_name = 'F1'; % Name of the test function that can be from F1 to F23 
Max_iteration = 500; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj] = Get_Functions_details(Function_name);

[Fbest,Lbest,Convergence_curve] = GGWO(dim,N,Max_iteration,lb,ub,fobj);
display(['The best solution obtained by GGWO is : ', num2str(Lbest)]);
display(['The best optimal value of the objective funciton found by GGWO is : ', num2str(Fbest)]);

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
legend('GGWO')


