function Bstep = Bstep_B_MFO(pos,Moth_pos,N,dim,ID)

%% S-shaped
if ID==1
    s=1./(1+exp(-2.*pos)); %S1 transfer function
end
if ID==2
    s=1./(1+exp(-pos));   %S2 transfer function
end
if ID==3
    s=1./(1+exp(-pos./2)); %S3 transfer function
end
if ID==4
    s=1./(1+exp(-pos./3));  %S4 transfer function
end

%% V-shaped
if ID==5
    v=abs(erf(((sqrt(pi)/2)*pos))); %V1 transfer function
end
if ID==6
    v=abs(tanh(pos)); %V2 transfer function
end
if ID==7
    v=abs(pos./sqrt((1+pos.^2))); %V3 transfer function
end
if ID==8    %  we use this one  8
    v=abs((2/pi)*atan((pi/2)*pos)); %V4 transfer function
end

%% U-shaped

if ID==9
    u=abs(pos.^1.5); %S1 transfer function
end
if ID==10
    u=abs(pos.^2);  %S2 transfer function
end
if ID==11
    u=abs(pos.^3); %S3 transfer function
end
if ID==12
    u=abs(pos.^4);  %S4 transfer function
end



%%
if ID<=4 %S-shaped transfer functions
    Bstep=rand(N,dim)<s; % Equation (4) and (8)
end

if ID>4 && ID<=8 %V-shaped transfer functions  
    temp=rand(N,dim)<v;
    moving=find(temp==1);
    Moth_pos(moving)=~Moth_pos(moving);    
    Bstep=Moth_pos;
end

if ID>8 && ID<=12 %U-shaped transfer functions    
    % Condition
    for i=1:size(pos,1)
        for j=1:size(pos,2)
            if ((u(i,j)>1))
                u(i,j)=1;
            end
        end
    end    
    temp=rand(N,dim)<u;
    moving=find(temp==1);
    Moth_pos(moving)=~Moth_pos(moving);    
    Bstep=Moth_pos;
end

end