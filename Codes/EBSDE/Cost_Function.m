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
function Cost = Cost_Function(Sol)
Cost = 1.10471 * Sol(1)^2 * Sol(2)+ 0.04811 * Sol(3) * Sol(4)*( 14 + Sol(2));  
end