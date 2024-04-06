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
%  e-Mails: hoda_zamani@yahoo.com, zamanie_hoda@ymail.com, nadimi@ieee.org, 
%           nadimi.mh@gmail.com, a.h.gandomi@gmail.com
% =========================================================================
function [H,L,R,FLeft,FRight]  = V_Echolon_Topology(Group,Fitness)
% Definition 3 (V-echelon Topology).
 
[~, id] = sort(Fitness(Group), 'ascend');
Group   = Group(id)';          % Property V1 
H       = Group(1);            % Property V2 
member  = Group(2:end,1);      % Property V?
A       = (1:size(member,1))';
even    = rem(A,2) == 0;
Aeven   = A(rem(A,2)== 0);
Aodd    = A(~even);
L       = member(Aodd);   % Property V4: members of left-line  (L)
R       = member(Aeven);  % Property V4: members of right-line (R)
FLeft   = [H; L(1:end-1)];   
FRight  = [H; R(1:end-1)];   
end