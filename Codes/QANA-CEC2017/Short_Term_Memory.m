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
%  e-Mails: hoda_zamani@yahoo.com, nadimi@ieee.org, 
%           nadimi.mh@gmail.com, a.h.gandomi@gmail.com
% =========================================================================
function STM =  Short_Term_Memory (STM,STMSize,Fitness,children_fitness,Pop)
% Definition 2(Short-term Memory).

I = (Fitness > children_fitness);

if sum(I==1) == STMSize
    STM.Pop     = Pop(I == 1, :);
elseif sum(I==1) < STMSize
    A = abs (STMSize - sum(I==1));
    Tmp = STM.Pop(randperm (STMSize ,A),:);
    STM.Pop = Pop(I == 1, :);
    STM.Pop(size(STM.Pop,1)+1:STMSize,:) = Tmp;    
elseif sum(I==1) > STMSize
    STM.Pop = Pop(randperm (sum(I==1),STMSize), :);
end
end