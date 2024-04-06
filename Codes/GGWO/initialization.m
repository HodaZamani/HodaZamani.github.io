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
% This function initialize the first population of wolvess
function Positions=initialization(N,dim,ub,lb)

Boundary_no= size(ub,2); % numnber of boundaries

% If the boundaries of all variables are equal and user enter a signle
% number for both ub and lb
if Boundary_no==1
    Positions=rand(N,dim).*(ub-lb)+lb;
end

% If each variable has a different lb and ub
if Boundary_no>1
    for i=1:dim
        ub_i=ub(i);
        lb_i=lb(i);
        Positions(:,i)=rand(N,1).*(ub_i-lb_i)+lb_i;
    end
end