% =========================================================================
%
%     Migration-based moth-flame optimization algorithm
%          
%
%  Authors: Mohammad H Nadimi-Shahraki, Ali Fatahi, Hoda Zamani 
%       Seyedali Mirjalili, Laith Abualigah, Mohamed Abd Elaziz
%           --------------------------------------------- 
% Journal:  Processes, Volume 9, December 2021, 2276 
% https://www.mdpi.com/2227-9717/9/12/2276
%           ---------------------------------------------
% More materials are available on ResearchGate and for any questions please contact the authors.
% Emails: nadimi.mh@gmail.com, fatahi.ali.edu@gmail.com, hoda_zamani@yahoo.com  
% =========================================================================
close all
clear
clc

Algorithm_Name = 'M_MFO';

N = 100; % Number of moths
Function_name = 'F1'; 
Max_iteration = 500; 
[lb,ub,dim,fobj] = Get_Functions_details(Function_name);

[Fbest,Lbest,Convergence_curve] = M_MFO(dim,N,Max_iteration,lb,ub,fobj);
display(['The best solution obtained by M_MFO is : ', num2str(Lbest)]);
display(['The best optimal value of the objective funciton found by M_MFO is : ', num2str(Fbest)]);

figure('Position',[500 500 660 290])
subplot(1,2,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])
subplot(1,2,2);
semilogy(Convergence_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('M-MFO')