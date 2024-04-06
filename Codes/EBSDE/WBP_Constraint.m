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

function Out = WBP_Constraint(fnonlin,Sol)
Penalty = 10^15;
lam = Penalty; lameq = Penalty;
Out = 0;
[Tmp_1,Tmp_2] = fnonlin(Sol);
for k=1:length(Tmp_1)
    Out=Out+ lam*Tmp_1(k)^2*getH(Tmp_1(k));
end
for k=1:length(Tmp_2)
    Out=Out+lameq*Tmp_2(k)^2*geteqH(Tmp_2(k));
end
