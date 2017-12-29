%Particle Swarm Optimization

%Initialization
clc;
clear;
close all;
iteration = 30;
inertia = 1.0;
correction_factor = 2.0;
swarms = 50;

%Initial swarm position
swarm = zeros(50,7);
step = 1;
for i= 1 : 50
    swarm(step, 1:7) = i;
    step=step+1;
end

swarm(:, 7) = 1000   %Greater than maximum possible value
swarm(:, 6)=0        %initial velocity
swarm(:, 5)=0        %initial velocity

%Iterations
for iter = 1 : iteration
    
    %Position of Swarms
    for i = 1: swarms
        swarm(i, 1) = swarm(i, 1) + swarm(i, 5)/1.2  %update u poition
        swarm(i, 2) = swarm(i, 2) + swarm(i, 6)/1.2  %update v position
        u=swarm(i, 1)
        v=swarm(i, 2)
        
        value = (u - 20)^2 + (v - 10)^2     %Objective function
        
        if value <swarm(i,7)        %Always true
            swarm(i,3)=swarm(i,1)   %Update best position of u
            swarm(i,4)=swarm(i,2)   %Update best position of u
            swarm(i,7)=value;       %Best updated minimum value
        end
    end
    
    [temp,gbest] = min(swarm(:,7));  %gbest position
    
    %Updating velocity of swarms
    for i = 1 :swarms
        swarm(i, 5) = rand*inertia*swarm(i, 5)+ correction_factor*rand*(swarm(i,3)...
            -swarm(i,1)) + correction_factor*rand*(swarm(gbest, 3)- swarm(i,1))     %u velocity parameters
        swarm(i, 6) = rand*inertia*swarm(i, 6)+ correction_factor*rand*(swarm(i,4)...
            -swarm(i,2)) + correction_factor*rand*(swarm(gbest, 4)- swarm(i,2))     %v velocity parameters
    end
    
    %Plotting
    clf;
    plot(swarm(: , 1), swarm(:, 2), 'x')       %drawing swarms
    axis([-10,50,-10,50])
    pause(.1)
end

        
    
        
        

    