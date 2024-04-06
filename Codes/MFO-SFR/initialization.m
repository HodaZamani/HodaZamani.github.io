% =========================================================================
%
%     MFO-SFR: An enhanced moth-flame optimization algorithm using an 
%         effective stagnation finding and replacing strategy 
%
%  Authors: Mohammad H Nadimi-Shahraki, Hoda Zamani, Ali Fatahi, Seyedali Mirjalili
%           --------------------------------------------- 
% Journal:  Mathematics
% https://www.mdpi.com/2227-7390/11/4/862 
%           ---------------------------------------------
% More materials are available on ResearchGate and for any questions please contact the authors.
% Emails:nadimi.mh@gmail.com, hoda_zamani@yahoo.com 
% =========================================================================

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