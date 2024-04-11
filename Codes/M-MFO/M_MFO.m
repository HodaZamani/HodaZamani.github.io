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

function [Best_flame_score,Best_flame_pos,Convergence_curve]=M_MFO(dim,N,MaxIt,lb,ub,fobj)

% Display('MFO is optimizing your problem');

%Initialize the positions of moths. Eq. (1)
M=initialization(N,dim,ub,lb);
Convergence_curve=zeros(1,MaxIt);
delta = 1;                                     % The number of guiding archive members.
Maxarch = round(dim * (log(N)));               % Determining the maximum size of the archive using Eq. (6)
guiding_archive = zeros(Maxarch,dim);          % Constructing the guiding archive based on Definition 1
t=1;
for i=1:size(M,1)
    % Calculate the fitness of moths. Eq. (2)
    OM(1,i) = fobj(M(i,:));
end

% Main loop
while t<MaxIt+1
    
    % Updating number of flames based on Eq. (3) in the paper.
    Flame_no=round(N-t*((N-1)/MaxIt));
    
    if t==1
        % Sorting the first population of moths
        [fitness_sorted, I]=sort(OM);
        sorted_population=M(I,:);
        
        % Updating the flames
        best_flames=sorted_population;
        best_flame_fitness=fitness_sorted;
    else
        
        % Sort the moths
        double_population=[previous_population;best_flames];
        double_fitness=[previous_fitness best_flame_fitness];
        
        [double_fitness_sorted, I]=sort(double_fitness);
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
    
    previous_population=M;
    previous_fitness=OM;
    % a linearly dicreases from -1 to -2 to calculate k in Eq.(3)
    a=-1+t*((-1)/MaxIt);
    for i=1:size(M,1)
        for j=1:size(M,2)
            if i<=Flame_no % Updating the position of the moth with respect to its corresponsing flame
                % Computing the distance between moth and flame using Eq.(4)
                distance_to_flame=abs(sorted_population(i,j)-M(i,j));
                b=1;
                k=(a-1)*rand+1;
                % Updating the position of Mi using Eq. (3).
                M(i,j)=distance_to_flame*exp(b.*k).*cos(k.*2*pi)+sorted_population(i,j);
            end
            if i>Flame_no % Upaate the position of the moth with respct to one flame
                % Eq.(4)
                distance_to_flame=abs(sorted_population(i,j)-M(i,j));
                b=1;
                k=(a-1)*rand+1;
                % Eq. (3)
                M(i,j)=distance_to_flame*exp(b.*k).*cos(k.*2*pi)+sorted_population(Flame_no,j);
            end
        end
        % Check if moths go out of the search space and bring it back
        Flag4ub=M(i,:)>ub;
        Flag4lb=M(i,:)<lb;
        M(i,:)=(M(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        % Computing the fitness value of Mi(t) and update OMi(t)
        OM(1,i)=fobj(M(i,:))';
        
        if (previous_fitness(1,i)<OM(1,i)) && t > 1             % Detecting unlucky moths by comparing their previous fitness and current fitness.
            Tau = randi(dim);
            [M(i,:),OM(1,i),guiding_archive,delta] = Migration_strategy(Tau,guiding_archive,delta,M(i,:),OM(1,i),dim,lb,ub);
        end
    end
    Convergence_curve(t)=Best_flame_score;
    t=t+1;
end