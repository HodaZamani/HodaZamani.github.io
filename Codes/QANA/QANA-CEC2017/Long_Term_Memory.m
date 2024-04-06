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
function LTM = Long_Term_Memory(t,LTM,Fitness,popold,pop_size,LTMSize)
% Definition 1 (Long-term Memory)
if t == 1
    for i = 1: pop_size
        LTM(i).Pop(t,:) =  popold(i,:);
        LTM(i).Fitness(t) = Fitness(i);
        LTM(i).CurrentSize = 1;
    end
else
    for i = 1: pop_size
        MemSize = size (LTM(i).Pop,1);  % Current size of LTM for ith search agent
        if Fitness(i)< LTM(i).Fitness(MemSize)
            if LTM(i). CurrentSize  < LTMSize
                LTM(i).Pop(MemSize+1,:) =  popold(i,:);
                LTM(i).Fitness(MemSize+1) = Fitness(i);
                LTM(i).CurrentSize = LTM(i).CurrentSize + 1;
            else % Whenever the size of the ith long-term memory exceeds
                 % A new solution is replaced with the farthest existing solution
                 % found by the Euclidean distance.
                PopLTM = [LTM(i).Pop];
                Dis = pdist2(PopLTM,popold(i,:),'euclidean'); % Euclidean distance
                [~, idx] = max(Dis);
                LTM(i).Pop(idx,:) =  popold(i,:);
                LTM(i).Fitness(idx) = Fitness(i);
            end
        end
    end
end
end