%% ======================================================================== 
%           Enhancement of Bernstain-Search Differential Evolution 
%            Algorithm to Solve Constrained Engineering Problems
%
%                  Hoda Zamani, Mohammad H. Nadimi-Shahraki
%                   Shokooh Taghian,Mahdis Banaie-Dezfouli
% 
%         International Journal of Computer Science Engineering (IJCSE)
%                   ISSN : 2319-7323   Vol. 9 No. 6 Nov-Dec 2020, 386-396
%                         DOI: 10.13140/RG.2.2.16902.40004
%            -----------------------------------------------------------
%                    Source codes developed in MATLAB R2016b 
%                                Programmers:                                   
%                 Hoda Zamani, Mohammad-Hossein Nadimi-Shahraki 
%                E-Mail: hoda_zamani@yahoo.com,nadimi@ieee.org                    
%           -----------------------------------------------------------                                                             
%  Homepage: https://scholar.google.com/citations?user=sT0YnDIAAAAJ&hl=en 
%  Homepage: https://scholar.google.com/citations?user=bpZOZWsAAAAJ&hl=en
% ========================================================================  

clear
clc
format shortG;
format compact;
fprintf('==================================================================================\n');
fprintf(' Enhancement of Bernstain-Search Differential Evolution Algorithm to Solve Constrained Engineering Problems\n ')
fprintf('                    International Journal of Computer Science Engineering (IJCSE)\n ')                     
fprintf('                        ISSN : 2319-7323   Vol. 9 No. 6 Nov-Dec 2020\n')  
fprintf('                             DOI: 10.13140/RG.2.2.16902.40004\n')
fprintf('               ------------------------------------------------------------------\n');
start_time = java.lang.System.currentTimeMillis;

SearchAgents = 100;     %   Number of search agents
nvars = 4;              %   The number of decision variables 
Max_iteration = 800;   %   The maximum number of iterations 
%% Parameter Setting
runs  = 10;
lb = [0.1 0.1 0.1 0.1];
ub = [2 10 10 2];
dim = length(lb);
fhandle = @Cost_Function;
fnonlin = @constraint;
fprintf('            The engineering problem name: Welded beam design optimization \n') 
for run = 1:runs

    [EBSD_gbest,EBSD_gbestval,EBSD_Convergance] = EBSD(SearchAgents,dim,lb,ub,Max_iteration,fhandle,fnonlin);
    fprintf('EBSD algorithm run = %d, Result = %d\n', run, EBSD_gbestval)
    WBP_EBSD.Best_score(run) = EBSD_gbestval;
    WBP_EBSD.Best_pos(run,:) = EBSD_gbest;
    WBP_EBSD.Convergance(run,:) = EBSD_Convergance;
    save 'WBP_EBSD_Results'
end
[FinalResult,indx] = min([WBP_EBSD.Best_score]);
fprintf('--------------------------------------\n');
fprintf('The final result of EBSD algorithm  = %d\n',FinalResult)
fprintf('                               %s\n', datestr(now));
fprintf('==================================================================================\n'); 
Convergance = WBP_EBSD.Convergance(indx,:);
semilogy(Convergance,'Color','r', 'LineWidth', 2)
title('Objective space','FontName', 'Times New Roman', 'FontSize', 20)
xlabel('Iterations', 'FontName', 'Times New Roman', 'FontSize', 20);
ylabel('Best score obtained so far', 'FontName', 'Times New Roman', 'FontSize', 20);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 20);
axis tight
grid on
box on
legend('EBSD algorithm', 'FontName', 'Times New Roman', 'FontSize', 20)
 




