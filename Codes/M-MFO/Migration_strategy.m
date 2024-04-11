% =========================================================================
%
%     Migration-based moth-flame optimization algorithm
%          
%
%  Authors: Mohammad H Nadimi-Shahraki, Ali Fatahi, Hoda Zamani 
%       Seyedali Mirjalili, Laith Abualigah, Mohamed Abd Elaziz
%           --------------------------------------------- 
% Journal:  Processes, Volume 9, December 2021, 2276 
% https://www.mdpi.com/2227-9717/9/12/2276
%           ---------------------------------------------
% More materials are available on ResearchGate and for any questions please contact the authors.
% Emails: nadimi.mh@gmail.com, fatahi.ali.edu@gmail.com, hoda_zamani@yahoo.com  
% =========================================================================

function [Mi,F_Mi,guiding_archive,delta] = Migration_strategy(Tau,guiding_archive,delta,Mi,F_Mi,dim,lb,ub)

Tmp = Mi;
f_tmp = F_Mi;

if delta < dim    % The guiding archive is not mature yet. Hence, the algorithm uses Random migration (RM)operator. 

	for i = 1:Tau
        Mr = initialization(1,dim,ub,lb);
        alpha = rand(size(Mi));
        y1 = alpha .* Mi + (1-alpha) .* Mr;    % Crossing over Mi with a randomly generated moth and producing offspring1 based on Eq. (8).
        yf1 = Fitness(y1)';                    % Calculating fitness of offspring1.
    
        y2 = alpha .* Mr + (1-alpha) .* Mi;    % Crossing over Mi with a randomly generated moth and producing offspring2 based on Eq. (9).
        yf2 = Fitness(y2)';                    % Calculating fitness of offspring2.
      
    
        if yf2 < yf1
            y1 = y2;
            yf1 = yf2;
        end
    
        if yf1 < f_tmp
            f_tmp = yf1;
            Tmp = y1;
        end
    end
	if f_tmp < F_Mi
        F_Mi = f_tmp;
        Mi = Tmp;
        guiding_archive(delta,:) = Tmp;
        delta = delta + 1;
    end
    
else                   % The guiding archive is mature enough. Hence, the algorithm uses Guided migration (GM) operator.

	for i = 1:Tau
        LMr = guiding_archive(randi(delta-1,1), :);          
        alpha = rand(size(Mi));                            
        y1 = alpha .* Mi + (1-alpha) .* LMr;               % Crossing over Mi with a a random lucky moth from the guiding archive and producing offspring1 based on Eq. (10).
        yf1 = Fitness(y1)';                                % Calculating fitness of offspring1.
    
        y2 = alpha .* LMr + (1-alpha) .* Mi;               % Crossing over Mi with a a random lucky moth from the guiding archive and producing offspring1 based on Eq. (11).
        yf2 = Fitness(y2)';                                % Calculating fitness of offspring2.
    
    
        if yf2 < yf1
            y1 = y2;
            yf1 = yf2;
        end
    
        if yf1 < f_tmp
            f_tmp = yf1;
            Tmp = y1;
        end
	end  
    
    if f_tmp < F_Mi                                       % Adding the improved moth to the guiaing archive if the migration was successful based on Definition 1.
        F_Mi = f_tmp;
        Mi = Tmp;
        if delta <= size(guiding_archive,1)
            guiding_archive(delta,:) = Tmp;
            delta = delta + 1;
        else
            randn = randi(size(guiding_archive,1));
            guiding_archive(randn, :) = Tmp(1,:);
        end
    end
    
end
end
