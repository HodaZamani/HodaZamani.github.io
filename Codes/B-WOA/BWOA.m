
%% ======================================================================== 
%           Feature selection based on whale optimization algorithm 
%                       for disease diagnosis  
%                Hoda Zamani, Mohammad-Hossein Nadimi-Shahraki

%        International Journal of Computer Science and Information Security
%                   (IJCSIS),Vol. 14, No. 9, September 2016
%            -----------------------------------------------------------
%                    Source codes developed in MATLAB R2016b 
%                                Programmers:                                   
%                 Hoda Zamani, Mohammad-Hossein Nadimi-Shahraki 
%                E-Mail: hoda_zamani@yahoo.com,nadimi@ieee.org                    
%           -----------------------------------------------------------                                                             
%  Homepage: https://scholar.google.com/citations?user=sT0YnDIAAAAJ&hl=en 
%  Homepage: https://scholar.google.com/citations?user=bpZOZWsAAAAJ&hl=en
% ========================================================================  

function [ Convergence_curve,Leader_score,Error,Accuracy,Leader_pos]=BWOA(SearchAgents_no,Max_iter,dim,fobj)
global SzW
rand('state',sum(100*clock))
% initialize position vector and score for the leader
Leader_pos=zeros(1,dim);
Leader_score=inf; %    change this to -inf for maximization problems
Positions = randi([0 1],SearchAgents_no,dim);%  Initialize the positions of search agents
Convergence_curve = zeros(1,Max_iter);

t=0;         % Loop counter
% Main loop
while t<Max_iter
    for i=1:size(Positions,1)
        % Calculate objective function for each search agent
        fitness=feval(fobj,Positions(i,:));
        % Update the leader
        if fitness<Leader_score % Change this to > for maximization problem
            Leader_score= fitness; % Update alpha
            Leader_pos=Positions(i,:);
            xx = Leader_pos;
            Acc = ((SzW*sum(xx)/length(xx))-Leader_score)/(1-SzW)+1;
            Error = 1-Acc;
        end
    end
    a=2-t*((2)/Max_iter); % a decreases linearly fron 2 to 0 in Eq. (2.3)
    % a2 linearly dicreases from -1 to -2 to calculate t in Eq. (3.12)
    a2=-1+t*((-1)/Max_iter);    
    % Update the Position of search agents
    for i=1:size(Positions,1)
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]        
        A=2*a*r1-a;  % Eq. (2.3) in the paper
        C=2*r2;      % Eq. (2.4) in the paper        
        b=1;               %  parameters in Eq. (2.5)
        l=(a2-1)*rand+1;   %  parameters in Eq. (2.5)    
        p = rand();        % p in Eq. (2.6)        
        for j=1:size(Positions,2)
            
            if p<0.5
                if abs(A)>=1
                    rand_leader_index = floor(SearchAgents_no*rand()+1);
                    X_rand = Positions(rand_leader_index, :);
                    D_X_rand=abs(C*X_rand(j)-Positions(i,j)); % Eq. (2.7)
                    Positions(i,j)=X_rand(j)-A*D_X_rand;      % Eq. (2.8)
                    
                elseif abs(A)<1
                    D_Leader=abs(C*Leader_pos(j)-Positions(i,j)); % Eq. (2.1)
                    Positions(i,j)=Leader_pos(j)-A*D_Leader;      % Eq. (2.2)
                end
                
            elseif p>=0.5
                
                distance2Leader=abs(Leader_pos(j)-Positions(i,j));
                % Eq. (2.5)
                Positions(i,j)=distance2Leader*exp(b.*l).*cos(l.*2*pi)+Leader_pos(j);   
            end   
        end
    end
    %%% movement
    S = 1./(1+exp(-Positions));
    Positions = rand(SearchAgents_no,dim)<S;
    t = t+1;
    Convergence_curve(t)= abs(Error);
    Mean_curve(t)=mean(fitness);
    Accuracy(t) = (1-abs(Error))*100;
    disp(['Iteration= ',num2str(t),', Accuracy= ',  num2str(Accuracy(t))]);
end
fprintf('BWOA algorithm: Accuracy:%7.4f\tFitness:%7.4f\t#Selected Features:%d\n',((1-Error)*100),Leader_score,(sum(Leader_pos,2)));

