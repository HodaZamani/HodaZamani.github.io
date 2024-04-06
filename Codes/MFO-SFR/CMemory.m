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
function [Mem,Idx] = CMemory (Mem, N20,Best_flame_pos)

Idx = size(Mem.Pos,1);
MeanPop = mean(N20);
NewEntry = [MeanPop;Best_flame_pos];

if  (Idx < Mem.Size)
    Mem.Pos = [Mem.Pos;NewEntry];
end
%% 3) Full
if  (Idx > Mem.Size)
    RepId =  randi (Idx,size(NewEntry,1),1);
    Mem.Pos(RepId,:)= NewEntry;
end
[Mem.Pos,~,~] = unique(Mem.Pos,'rows','stable');
Idx = size(Mem.Pos,1);
end