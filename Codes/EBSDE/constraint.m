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
function [Tmp1,Tmp2] = constraint(Sol)

Out1 = sqrt((Sol(2)^2)/4+((Sol(1)+Sol(3))/2)^2); 
Out2 = 6000/(sqrt(2)*Sol(1)*Sol(2));
% ---------------------------------------------------------
Out3 = 6000*(14+(Sol(2)/2));
Out4 = 2*(sqrt(2)*Sol(1)*Sol(2)*((Sol(2)^2/12)+((Sol(1)+Sol(3))/2)^2));
Tmp1(1)= sqrt(Out2^2+((2* Out2 *((Out3*Out1)/Out4) *Sol(2))/(2*Out1))+((Out3*Out1)/Out4)^2) - 13600;
% ---------------------------------------------------------
Tmp1(2)= (6*6000*14)/(Sol(4)*(Sol(3)^2)) - 30000;
Tmp1(3)= Sol(1)-Sol(4);
Tmp1(4)=  0.10471*Sol(1)^2+0.04811*Sol(3)*Sol(4)*(14+Sol(2))-5;
Tmp1(5)=  0.125-Sol(1);
Tmp1(6)=  (4*6000*(14^3))/(30e6 *(Sol(3)^3)*Sol(4)) -0.25;
Tmp1(7)=  6000 - (((4.013* 30e6 *sqrt((Sol(3)^2*Sol(4)^6)/36))/(14^2))*(1-(Sol(3)/(2*14))*sqrt(30e6/(4*12e6))));
Tmp2 = [];
end