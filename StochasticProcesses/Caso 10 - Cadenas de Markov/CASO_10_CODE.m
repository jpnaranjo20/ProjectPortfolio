%% Caso de estudio 10 
% Gabriel Mejia
% Maria Fernanda Martinez
% Juan Pablo Naranjo

%% Punto 1

clear;
clc;

set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
set(0,'defaulttextInterpreter','latex');

% Define parameters of experiments
iters = 1000;
sigma_2 = 4;

% Define time and noise
t = 0:iters;
y_1 = normrnd(0, sqrt(sigma_2), 1, iters+1);

% Plot simulation
figure('Position', [100 100 650 500])
plot(t, y_1, '.-k', 'markersize', 15)
grid on;
ylim([-7,7]);
xlim([0,iters]);
xlabel("$n$", "fontsize", 19);
ylabel("Ruido", "fontsize", 19);
title("Simulaci\'on de trayectoria", "fontsize", 21);

% Calculate FFT
[frec, Xmag] = espectro(y_1);
% Plot frecuency
figure('Position', [100 100 950 500])
subplot(1,2,1)
plot(frec, Xmag, '.-k', 'markersize', 15)
grid on;
ylim([0,160])
xlim([min(frec),max(frec)]);
xlabel("$f$(Hz)", "fontsize", 19);
ylabel("$|Y(f)|$", "fontsize", 19);
title("Transformada de Fourier", "fontsize", 21);

% Calculate multiple experiments
n_exp = 10000;
exp_mat = normrnd(0, sqrt(sigma_2), n_exp, iters+1);
exp_frec = zeros(size(exp_mat));

% Calculate frequencies
for i = 1:n_exp
    [~, exp_frec(i,:)] = espectro(exp_mat(i,:));
end

% Average frequencies
mean_frec = mean(exp_frec);

% Plot average frecuency
subplot(1,2,2)
plot(frec, mean_frec, '.-k', 'markersize', 15)
grid on;
ylim([0,160])
xlim([min(frec),max(frec)]);
xlabel("$f$(Hz)", "fontsize", 19);
ylabel("$|Y(f)|$", "fontsize", 19);
title("Transformada promedio de Fourier", "fontsize", 21);

%% Punto 2

clear;
clc;

set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
set(0,'defaulttextInterpreter','latex');

% Define transition matrix
M = [0.6, 0.2, 0.0, 0.2;...
     0.4, 0.3, 0.1, 0.2;...
     0.1, 0.3, 0.3, 0.3;...
     0.0, 0.2, 0.1, 0.7];

% Put tested alpha
a_test = [0.3, 0.1, 0.5, 0.1];

% Display tested alpha
disp("a*M =")
disp(a_test*M)

% Find state at 4:56
a_0 = [0.6, 0.3, 0.1, 0.0];
a_56 = a_0*M^56;

% Display results at 4:56
disp("The theoretical states fractions in minute 56 are:")
disp("a(56)=")
disp(a_56)


% Define number of iterations
iter = 56;
% Define initial probabilities
p_0 = [0.6, 0.3, 0.1, 0.0];

% Perform one simulation of the experiment
[t_1, y_1] = make_exp(iter, M, p_0);

% Plot simulation
figure('Position', [100 100 650 500])
plot(t_1, y_1, '.--k', 'markersize', 15)
grid on;
ylim([0,5]);
xlim([0,56]);
xlabel("$t$(min)", "fontsize", 19);
ylabel("Estado", "fontsize", 19);
title("Simulaci\'on de trayectoria", "fontsize", 21);


% Perform 10k simulations of the experiment

% Define number of iterations
iter = 56;
% Define initial probabilities
p_0 = [0.6, 0.3, 0.1, 0.0];
% Define number of experiments
n = 10000;

% Define matrix where the trajectories are stored
res_mat = zeros(n, iter+1);

% Make all required experiments
for i = 1:n
    [~, res_mat(i,:)] = make_exp(iter, M, p_0);
end

% Count fractions in all time steps
fractions = zeros(4, iter+1);
for i = 1:4
    bool_mat = res_mat == i;
    fractions(i, :) = sum(bool_mat)./n;
end

% Perform theoretical experiment
t_fractions = zeros(4, iter+1);
t_fractions(:, 1) = p_0';
% Calculate theoretical probabilities
for i = 2:iter+1
    t_fractions(:,i) = t_fractions(:,i-1)'*M; 
end

% Plot probabilities in time
figure('Position', [100 100 650 500])
h = plot(0:iter, fractions, '.-', 'markersize', 10);
set(h, {'color'}, num2cell(turbo(4),2));
hold on 
h_1 = plot(0:iter, t_fractions, '--');
set(h_1, {'color'}, num2cell(turbo(4),2));
grid on;
ylim([0,0.7]);
xlim([0,56]);
xlabel("$t$(min)", "fontsize", 19);
ylabel("$P(S_i)$", "fontsize", 19);
title("Probabilidades en el tiempo", "fontsize", 21);
legend(["$P(X_i = P)$","$P(X_i = E)$","$P(X_i = V)$","$P(X_i = N)$"], 'fontsize', 14)

% Display results
disp("The simulated states fractions in minute 56 are:")
disp(fractions(:,end)')

%% Necessary functions

% Function to get next state
function next = get_next(vec)
    random_num = rand();
    frontiers = cumsum(vec);
    for i = 1:length(frontiers)
        if random_num < frontiers(i)
            next = i;
            break;
        end
    end
end

function [t, y] = make_exp(iter, M, p_0)
    % Declare time vector
    t = 0:iter;
    % Initialize trajectory
    y = zeros(1, iter+1);
    y(1) = get_next(p_0);
    
    % Compute trajectory in cycle
    for i = 2:length(y)
        % Get transition vector
        prob_vec = M(y(i-1), :);
        % Get new state
        y(i) = get_next(prob_vec);
    end
end







