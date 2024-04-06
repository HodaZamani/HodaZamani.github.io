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
% More materials are available on ResearchGate; for any questions, don't hesitate to contact the authors.
% Emails:nadimi.mh@gmail.com, hoda_zamani@yahoo.com 
% =========================================================================
function [Best_flame_score,Best_flame_pos,Convergence_curve,Div_curve]= MFO_SFR(dim,N,Max_iteration,lb,ub,fobj)
%Initialize the positions of moths
Moth_pos=initialization(N,dim,ub,lb);
Div_curve =zeros(1,Max_iteration);
Convergence_curve = zeros(1,Max_iteration);
Moth_fitness = zeros(1,N);
Iteration=1;
Idx = 1;
lu=[ones(1,dim)*lb;ones(1,dim)*ub];
for i=1:size(Moth_pos,1)
    % Calculate the fitness of moths
    % 	Moth_fitness(1,i)=feval(fhd,Moth_pos(i,:)',Func_name);
    Moth_fitness(1,i) = fobj(Moth_pos(i,:));
end
% Sort the first population of moths
[fitness_sorted, I]=sort(Moth_fitness);
sorted_population=Moth_pos(I,:);
% Update the flames
best_flames=sorted_population;
best_flame_fitness=fitness_sorted;
previous_population=Moth_pos;
previous_fitness=Moth_fitness;
Mem.Size = round(dim*dim * (log(N)));
Mem.Pos = [];
% Main loop
while Iteration<Max_iteration+1
    % Number of flames Eq. (3.14) in the paper
    Flame_no=round(N-Iteration*((N-1)/Max_iteration));
    % a linearly dicreases from -1 to -2 to calculate t in Eq. (3.12)
    a=-1+Iteration*((-1)/Max_iteration);
    if Idx < N
        Memory1 = [Mem.Pos;Moth_pos];
        Memory = Memory1(randperm(N+Idx-1,N),:);
    else
        list = randperm(Idx,N);
        Memory = Mem.Pos(list,:);
    end
    
    distance2=abs(sorted_population-Moth_pos);
    avg_dist = mean(distance2,2);
    avg_dist = avg_dist(avg_dist > 0);
    [~, indx] = sort(avg_dist,'descend');
    s_indxx = size(indx,1);
    if s_indxx < N
        less = N - s_indxx;
        distance2(size(distance2,1)+1:N+less, :) = Memory(randperm(size(Memory,1),less),:);
        indx(s_indxx+1:N) = N + less;
    end
    
    for i=1:size(Moth_pos,1)
        if i<=Flame_no % Update the position of the moth with respect to its corresponsing flame
            for j=1:size(Moth_pos,2)
                % D in Eq. (3.13)
                distance_to_flame=abs(sorted_population(i,j)-Memory(i,j));
                b=1;
                t=(a-1)*rand+1;
                % Eq. (3.12)
                Moth_pos(i,j)=distance_to_flame*exp(b.*t).*cos(t.*2*pi)+sorted_population(i,j);
            end
        end
        
        if i>Flame_no % Upaate the position of the moth with respct to one flame
            for j=1:size(Moth_pos,2)
                % Eq. (3.13)
                distance_to_flame = distance2(indx(i),j);
                b=1;
                t=(a-1)*rand+1;
                % Eq. (3.12)
                Moth_pos(i,j)=distance_to_flame*exp(b.*t).*cos(t.*2*pi)+sorted_population(Flame_no,j);
            end
        end
    end
    for i=1:size(Moth_pos,1)
        % Check if moths go out of the search spaceand bring it back
        Moth_pos(i,:) =((Moth_pos(i,:)>=lu(1,:))&(Moth_pos(i,:)<=lu(2,:))).* Moth_pos(i,:)...
            +(Moth_pos(i,:)<lu(1,:)).*(lu(1,:)+0.25.*(lu(2,:)-lu(1,:)).*rand(1,size(Moth_pos(i,:),2)))+(Moth_pos(i,:)>lu(2,:)).*(lu(2,:)-0.25.*(lu(2,:)-lu(1,:)).*rand(1,size(Moth_pos(i,:),2)));
        % Calculate the fitness of moths
        Moth_fitness(1,i) = fobj(Moth_pos(i,:));
    end
    %% Sort the moths
    double_population=[previous_population;best_flames];
    double_fitness=[previous_fitness best_flame_fitness];
    [double_fitness_sorted, I]=sort(double_fitness);
    double_sorted_population=double_population(I,:);
    fitness_sorted=double_fitness_sorted(1:N);
    sorted_population=double_sorted_population(1:N,:);
    
    %% Update the flames
    best_flames=sorted_population;
    best_flame_fitness=fitness_sorted;
    
    %% Update the position best flame obtained so far
    Best_flame_score=fitness_sorted(1);
    Best_flame_pos=sorted_population(1,:);
    previous_population=Moth_pos;
    previous_fitness=Moth_fitness;
    [Mem,Idx] = CMemory (Mem, sorted_population(1:20,:),Best_flame_pos);
    Convergence_curve(Iteration)=Best_flame_score;
    Iteration=Iteration+1;    
end





