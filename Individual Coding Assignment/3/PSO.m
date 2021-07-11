%% PSO Code
clear all; close all; clc;
%% Author's Notes:
%  - Author Name: Sepehr Rezvani
%% Choose problems number 
global problem_number
problem_number = 1;
%% Function 1
if problem_number == 1
    fprintf('Solution for question %d is:\n\n\n', problem_number);
    %% Define parameters
    nparticles = 30;
    nvars=2;
    w = 0.7;
%     c1 = 2;
%     c2 = 2;
    c1 = 5;
    c2 = 5;
    r1 = rand(1);
    r2 = rand(1);
    
    %% Initialize particles - Randomly assign particles
    x = randi([-100,100],nparticles,nvars);
    
    % Initialize velocity matrix
    v = randi([-1000,1000],nparticles,nvars);
    vmax = 100;         % if v>100 --> change to v=100 
    
    %% Define stopping criteria AND initialize variables
%     tol = 1;
%     tol_desired = 1e-6;
    max_iter = 400;
    iter = 0;
    
    xg = x(1,:);
    xg1 = xg; xg_new = xg;
    xp = x;
    xp_new = xp;
    v_new = zeros(nparticles, nvars);
    x_new = zeros(nparticles, nvars);
    %% Main loop
    while (iter<max_iter)
        % PSO code
        fprintf('Iteration number %d: \n', iter+1);
 
        for i=1:1:nparticles            % Calculate best group position
            if func(xg) > func(x(i,:))
                xg = x(i,:);
            end
        end
        xg1 = xg;
        
        for i=1:1:nparticles            % Calculate particle velocity
            v_new(i,:) = w*v(i,:) + c1*r1*(xp(i,:)-x(i,:)) + c2*r2*(xg1-x(i,:));
            if v_new(i,1) > vmax
                v_new(i,1) = vmax;
            elseif v_new(i,2) > vmax
                v_new(i,2) = vmax;
            end
        end
        
        x_new = x + v_new;              % Update particle position
        for i=1:1:nparticles
            if x_new(i,1) > 100
                x_new(i,1) = 100;
            elseif x_new(i,1) < -100
                x_new(i,1) = -100;
            elseif x_new(i,2) > 100
                x_new(i,2) = 100;
            elseif x_new(i,2) < -100
                x_new(i,2) = -100;
            end
        end
        
        for i=1:1:nparticles            % Update best personal position 
            if func(xp(i,:)) > func(x_new(i,:)) || func(xp(i,:)) == func(x_new(i,:))
                xp_new(i,:) = x_new(i,:);
            else
                xp_new(i,:) = xp(i,:);
            end
        end
        
        for i=1:1:nparticles            % Update best group position
            if func(xp_new(i,:)) < func(xg1) || func(xp_new(i,:)) == func(xg1)
                xg1 = xp_new(i,:);
            end
        end
        xg_new = xg1;
        
        if func(xg_new) <= (-7 + 1e-6)       % tolerance condition changed to this instead
            break
        end
        
        x = x_new;
        v = v_new;
        xp = xp_new;
        xg = xg_new;
        
        
        iter=iter+1;
        fprintf('Solution for this iteration is:\n%.20f\n%.20f\n', func(xg_new),xg_new);
        fprintf('============================================== \n');
    end
end



%% Functions 2
if problem_number == 2 
    fprintf('Solution for question %d is:\n\n\n', problem_number);
    %% Define parameters
    nparticles = 30;
    nvars=2;
    w = 0.7;
    c1 = 2;
    c2 = 2;
%     c1 = 0.5;
%     c2 = 0.5;
    r1 = rand(1);
    r2 = rand(1);
    
    %% Initialize particles - Randomly assign particles
    x = randi([-100,100],nparticles,nvars);
    
    % Initialize velocity matrix
    v = randi([-1000,1000],nparticles,nvars);
    vmax = 100;         % if v>100 --> change to v=100 
    
    %% Define stopping criteria AND initialize variables
%     tol = 1;
%     tol_desired = 1e-6;
    max_iter = 400;
    iter = 0;
    
    xg = x(1,:);
    xg1 = xg; xg_new = xg;
    xp = x;
    xp_new = xp;
    v_new = zeros(nparticles, nvars);
    x_new = zeros(nparticles, nvars);
    %% Main loop
    while(iter<max_iter)
        % PSO code
        fprintf('Iteration number %d: \n', iter+1);
 
        for i=1:1:nparticles            % Calculate best group position
            if func(xg) > func(x(i,:))
                xg = x(i,:);
            end
        end
        xg1 = xg;
        
        for i=1:1:nparticles            % Calculate particle velocity
            v_new(i,:) = w*v(i,:) + c1*r1*(xp(i,:)-x(i,:)) + c2*r2*(xg1-x(i,:));
            if v_new(i,1) > vmax
                v_new(i,1) = vmax;
            elseif v_new(i,2) > vmax
                v_new(i,2) = vmax;
            end
        end
        
        x_new = x + v_new;              % Update particle position
        for i=1:1:nparticles
            if x_new(i,1) > 100
                x_new(i,1) = 100;
            elseif x_new(i,1) < -100
                x_new(i,1) = -100;
            elseif x_new(i,2) > 100
                x_new(i,2) = 100;
            elseif x_new(i,2) < -100
                x_new(i,2) = -100;
            end
        end
        
        for i=1:1:nparticles            % Update best personal position 
            if func(xp(i,:)) > func(x_new(i,:)) || func(xp(i,:)) == func(x_new(i,:))
                xp_new(i,:) = x_new(i,:);
            else
                xp_new(i,:) = xp(i,:);
            end
        end
        
        for i=1:1:nparticles            % Update best group position
            if func(xp_new(i,:)) < func(xg1) || func(xp_new(i,:)) == func(xg1)
                xg1 = xp_new(i,:);
            end
        end
        xg_new = xg1;
        
        if func(xg_new) <= 1e-6         % tolerance condition changed to this instead
            break
        end
        
        x = x_new;
        v = v_new;
        xp = xp_new;
        xg = xg_new;
        
        
        iter=iter+1;
        fprintf('Solution for this iteration is:\n%.20f\n', func(xg_new));
        fprintf('============================================== \n');
    end
end


%% Functions 3
if problem_number == 3 
    fprintf('Solution for question %d is:\n\n\n', problem_number);
    %% Define parameters
    nparticles = 30;
    nvars=2;
    w = 0.7;
    c1 = 2;
    c2 = 2;
%     c1 = 0.5;
%     c2 = 0.5;
    r1 = rand(1);
    r2 = rand(1);
    
    %% Initialize particles - Randomly assign particles
    x = randi([-100,100],nparticles,nvars);
    
    % Initialize velocity matrix
    v = randi([-1000,1000],nparticles,nvars);
    vmax = 100;         % if v>100 --> change to v=100 
    
    %% Define stopping criteria AND initialize variables
%     tol = 1;
%     tol_desired = 1e-6;
    max_iter = 400;
    iter = 0;
    
    xg = x(1,:);
    xg1 = xg; xg_new = xg;
    xp = x;
    xp_new = xp;
    v_new = zeros(nparticles, nvars);
    x_new = zeros(nparticles, nvars);
    %% Main loop
    while(iter<max_iter)
        % PSO code
        fprintf('Iteration number %d: \n', iter+1);
 
        for i=1:1:nparticles            % Calculate best group position
            if func(xg) > func(x(i,:))
                xg = x(i,:);
            end
        end
        xg1 = xg;
        
        for i=1:1:nparticles            % Calculate particle velocity
            v_new(i,:) = w*v(i,:) + c1*r1*(xp(i,:)-x(i,:)) + c2*r2*(xg1-x(i,:));
            if v_new(i,1) > vmax
                v_new(i,1) = vmax;
            elseif v_new(i,2) > vmax
                v_new(i,2) = vmax;
            end
        end
        
        x_new = x + v_new;              % Update particle position
        for i=1:1:nparticles
            if x_new(i,1) > 100
                x_new(i,1) = 100;
            elseif x_new(i,1) < -100
                x_new(i,1) = -100;
            elseif x_new(i,2) > 100
                x_new(i,2) = 100;
            elseif x_new(i,2) < -100
                x_new(i,2) = -100;
            end
        end
        
        for i=1:1:nparticles            % Update best personal position 
            if func(xp(i,:)) > func(x_new(i,:)) || func(xp(i,:)) == func(x_new(i,:))
                xp_new(i,:) = x_new(i,:);
            else
                xp_new(i,:) = xp(i,:);
            end
        end
        
        for i=1:1:nparticles            % Update best group position
            if func(xp_new(i,:)) < func(xg1) || func(xp_new(i,:)) == func(xg1)
                xg1 = xp_new(i,:);
            end
        end
        xg_new = xg1;
        
        if func(xg_new) < 0.44         % tolerance condition changed to this instead
            break
        end
        
        x = x_new;
        v = v_new;
        xp = xp_new;
        xg = xg_new;
        
        
        iter=iter+1;
        fprintf('Solution for this iteration is:\n%.20f\n', func(xg_new));
        fprintf('============================================== \n');
    end
end


