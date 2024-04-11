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
%______________________________________________________________________________________________
%  Moth-Flame Optimization Algorithm (MFO)                                                            
%  Source codes demo version 1.0                                                                      
%                                                                                                     
%  Developed in MATLAB R2011b(7.13)                                                                   
%                                                                                                     
%  Author and programmer: Seyedali Mirjalili                                                          
%                                                                                                     
%         e-Mail: ali.mirjalili@gmail.com                                                             
%                 seyedali.mirjalili@griffithuni.edu.au                                               
%                                                                                                     
%       Homepage: http://www.alimirjalili.com                                                         
%                                                                                                     
%  Main paper:                                                                                        
%  S. Mirjalili, Moth-Flame Optimization Algorithm: A Novel Nature-inspired Heuristic Paradigm, 
%  Knowledge-Based Systems, DOI: http://dx.doi.org/10.1016/j.knosys.2015.07.006
%_______________________________________________________________________________________________

% This function creates the first random population of moths

function X=initialization(SearchAgents_no,dim,ub,lb)

Boundary_no= size(ub,2); % numnber of boundaries

% If the boundaries of all variables are equal and user enter a signle
% number for both ub and lb
if Boundary_no==1
    X=rand(SearchAgents_no,dim).*(ub-lb)+lb;
end

% If each variable has a different lb and ub
if Boundary_no>1
    for i=1:dim
        ub_i=ub(i);
        lb_i=lb(i);
        X(:,i)=rand(SearchAgents_no,1).*(ub_i-lb_i)+lb_i;
    end
end