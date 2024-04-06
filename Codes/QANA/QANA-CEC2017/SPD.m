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
%% Definition 4 (SPD Policy). The success-based population distribution policy
function Policy = SPD (Policy,Policy_perc ,Mutant_St,FN, Flock_id, Fitness,children_fitness)
 
Mutat_1 = [];
Mutat_2 = [];
for i  = 1:FN
    if Policy(i) == 1
        I = (Fitness(Flock_id(i,:)) > children_fitness(Flock_id(i,:)));
        Mutat_1 = [Mutat_1 ; sum(I == 1)/size(I,1)];
    else
        I = (Fitness(Flock_id(i,:)) > children_fitness(Flock_id(i,:)));
        Mutat_2 = [Mutat_2; sum(I == 1)/size(I,1)];
    end
end
Mp_1 = (sum(Mutat_1)/size(Mutat_1,1))*100;
Mp_2 = (sum(Mutat_2)/size(Mutat_2,1))*100;
if Mp_1 > Mp_2
    num1 = (Policy_perc/100)*FN;
    
    Policy(1:num1) = 1;
    Policy(num1+1:end) = 2;
    Policy = Policy(randperm(FN,FN));%  Randomly assign to the flock
    
elseif Mp_1 <  Mp_2
    num2 = (Policy_perc/100)*FN;
    Policy(1:num2) = 2;
    Policy(num2+1:end) = 1;
    Policy = Policy(randperm(FN,FN));%  Randomly assign to the flock
     
elseif Mp_1 == Mp_2
    temp   = repmat(1: Mutant_St ,1,FN/2); 
    Policy = temp(randperm(FN,FN));
end
end