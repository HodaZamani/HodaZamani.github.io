%___________________________________________________________________________%
%  B-MFO: A binary moth-flame optimization for feature selection from       %
%  medical datasets                                                         %
%  source codes version 1.0                                                 %
%                                                                           %
%  Developed in MATLAB R2018a                                               %
%                                                                           %
%  Author and programmer: Mohammad H. Nadimi-Shahraki, M. Banaie-Dezfouli,  %
%  Hoda Zamani, S. Taghian, S. Mirjalili                                      %
%                                                                           %
%  e-Mail: nadimi@iaun.ac.ir, mahdisdezfoulli@yahoo.com,                    %
%  hoda_zamani@yahoo.com, shokooh.taghian94@gmail.com,                     %
%  ali.mirjalili@gmail.com                                                  %
%                                                                           %
%  Computers 2021, 10, 136. https://doi.org/10.3390/computers10110136       %                                               %
%___________________________________________________________________________%
%  Moth-Flame Optimization Algorithm (MFO)                                  %                                                     
%  Source codes demo version 1.0                                            %                                                                     
%                                                                                                     
%  Developed in MATLAB R2011b(7.13)                                                                   
%                                                                                                     
%  Author and programmer: Seyedali Mirjalili                                                          
%                                                                                                     
%         e-Mail: ali.mirjalili@gmail.com                                                             
%                 seyedali.mirjalili@griffithuni.edu.au                                               
%                                                                                                     
%       Homepage: http://www.alimirjalili.com                                                         
%                                                                                                     
%  Main paper:                                                                                        
%  S. Mirjalili, Moth-Flame Optimization Algorithm: A Novel
%  Nature-inspired Heuristic Paradigm, 
%  Knowledge-Based Systems, 
%  DOI: http://dx.doi.org/10.1016/j.knosys.2015.07.006 
%___________________________________________________________________________%
function [sFeat,Sf,Nf,curve] = B_MFO(feat,label,N,Max_iteration,HO)

fun = @jFitnessFunction; 
dim = size(feat,2); 
for i = 1:N
  for d = 1:dim
    if rand() > 0.5
      Moth_pos(i,d) = 1;
    end
  end
end

fit = zeros(1,N);
for i = 1:N
  fit(i) = fun(feat,label,Moth_pos(i,:),HO);
end 

curve = inf;
Iteration=1;

% Main loop
while Iteration<Max_iteration+1
    
    % Number of flames Eq. (3.14) in the paper
    Flame_no=round(N-Iteration*((N-1)/Max_iteration));    
    for i=1:size(Moth_pos,1)        
        % Calculate the fitness of moths
        fit(i) = fun(feat,label,Moth_pos(i,:),HO);        
        Moth_fitness(1,i) = fit(i);        
    end         
    if Iteration==1
        % Sort the first population of moths
        [fitness_sorted I]=sort(Moth_fitness);
        sorted_population=Moth_pos(I,:);         
        % Update the flames
        best_flames=sorted_population;
        best_flame_fitness=fitness_sorted;               
    else        
        % Sort the moths
        double_population=[previous_population;best_flames];
        double_fitness=[previous_fitness best_flame_fitness];        
        [double_fitness_sorted I]=sort(double_fitness);
        double_sorted_population=double_population(I,:);        
        fitness_sorted=double_fitness_sorted(1:N);
        sorted_population=double_sorted_population(1:N,:);        
        % Update the flames
        best_flames=sorted_population;
        best_flame_fitness=fitness_sorted;        
    end    
    % Update the position best flame obtained so far
    Best_flame_score=fitness_sorted(1);
    Best_flame_pos=sorted_population(1,:);        
    previous_population=Moth_pos;
    previous_fitness=Moth_fitness;    
    % a linearly dicreases from -1 to -2 to calculate t in Eq. (3.12)
    a=-1+Iteration*((-1)/Max_iteration);    
    for i=1:size(Moth_pos,1)        
        for j=1:size(Moth_pos,2)
            if i<=Flame_no % Update the position of the moth with respect to its corresponsing flame                
                % D in Eq. (3.13)
                distance_to_flame=abs(sorted_population(i,j)-Moth_pos(i,j));
                b=1;
                t=(a-1)*rand+1;                
                % Eq. (3.12)
                pos(i,j)=distance_to_flame*exp(b.*t).*cos(t.*2*pi)+sorted_population(i,j);
            end            
            if i>Flame_no % Update the position of the moth with respct to one flame                
                % Eq. (3.13)
                distance_to_flame=abs(sorted_population(i,j)-Moth_pos(i,j));
                b=1;
                t=(a-1)*rand+1;                
                % Eq. (3.12)
                pos(i,j)=distance_to_flame*exp(b.*t).*cos(t.*2*pi)+sorted_population(Flame_no,j);
            end            
        end
    end
    
    %% transfer functions
      Moth_pos= Bstep_B_MFO(pos,Moth_pos,N,dim,2);
    
     curve(Iteration) = Best_flame_score; 
     fprintf('\nIteration %d Best (B_MFO)= %f',Iteration,curve(Iteration))
     Iteration=Iteration+1;
end
Pos   = 1:dim;
Sf    = Pos(Best_flame_pos == 1);
Nf    = length(Sf); 
sFeat = feat(:,Sf); 
end












