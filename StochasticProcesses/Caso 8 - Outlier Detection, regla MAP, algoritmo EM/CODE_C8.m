%% Caso de estudio 8 
% Gabriel Mejia
% Maria Fernanda Martinez
% Juan Pablo Naranjo

%% Punto 1 just one gaussian

%Clean space
clear;
clc;
% Set interpreter
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
set(0,'defaulttextInterpreter','latex');

% Read data
data = readmatrix("Datos invernadero\greenhouseData3d.txt");
% Visualize initial data
figure('Position', [100 100 650 620])
scatter3(data(:,1),data(:,2),data(:,3),300, '.k')
formatPlot("$T(^oC)$", "H$(\%)$", "$[CO_2]$(ppm)","Visualizaci\'on inicial de datos");

% Declare variables
temp = data(:,1);
humm = data(:,2);
co2 = data(:,3);

% Unique gaussian estimation
[Q_unique, mu_unique] = ML_cov_estimation(temp,humm,co2);

% Make plot of outliers depending of gamma
num = 100;
gamma = logspace(-10,-4,num);
outlier_fraction = zeros(1,num);

for i = 1:num
    finded = sum(mvnpdf(data,mu_unique',Q_unique)<gamma(i));
    outlier_fraction(i) = finded*100/length(temp);
end

figure('Position', [100 100 650 500])
plot(gamma, outlier_fraction, '.k', 'markersize', 10);
set(gca, 'xscale', 'log', 'yscale', 'log')
grid on;
xlabel("$\gamma$", "fontsize", 19);
ylabel("Outlier fraction (\%)", "fontsize", 19);
title("Caracterizaci\'on de $\gamma$", "fontsize", 21);

% Finded optimal gamma
gamm_opt_unique = gamma(63);

% Produce random box
num = 5000;
rand_box = rand(num, 3);
% Adjust maximum values
rand_box(:,1) = rand_box(:,1)*(max(temp)-min(temp))+min(temp);
rand_box(:,2) = rand_box(:,2)*(max(humm)-min(humm))+min(humm);
rand_box(:,3) = rand_box(:,3)*(max(co2)-min(co2))+min(co2);

% Find random colours
rand_colors = mvnpdf(rand_box,mu_unique',Q_unique)>gamm_opt_unique;

%Plot random colors
figure('Position', [100 100 650 620])
scatter3(rand_box(rand_colors,1),rand_box(rand_colors,2),rand_box(rand_colors,3),100, '.k');
hold on;
scatter3(rand_box(~rand_colors,1),rand_box(~rand_colors,2),rand_box(~rand_colors,3),100, '.r');
xlim([min(rand_box(:,1)), max(rand_box(:,1))]);
ylim([min(rand_box(:,2)), max(rand_box(:,2))]);
zlim([min(rand_box(:,3)), max(rand_box(:,3))]);
formatPlot("$T(^oC)$", "H$(\%)$", "$[CO_2]$(ppm)","Visualizaci\'on regi\'on de rechazo");

% read new data
new_data = readmatrix("Datos invernadero\datosNuevos_greenhouseData3d.txt");
% Find random colours
rand_colors = mvnpdf(new_data,mu_unique',Q_unique)>gamm_opt_unique;
disp("Outlier fraction from new data (one gaussian):");
disp(num2str(100*sum(~rand_colors)/length(rand_colors))+"%");

%Plot of new data rejection
figure('Position', [100 100 650 620])
scatter3(new_data(rand_colors,1),new_data(rand_colors,2),new_data(rand_colors,3),100, '.k');
hold on;
scatter3(new_data(~rand_colors,1),new_data(~rand_colors,2),new_data(~rand_colors,3),100, '.r');
xlim([min(new_data(:,1)), max(new_data(:,1))]);
ylim([min(new_data(:,2)), max(new_data(:,2))]);
zlim([min(new_data(:,3)), max(new_data(:,3))]);
formatPlot("$T(^oC)$", "H$(\%)$", "$[CO_2]$(ppm)","Visualizaci\'on fallas en datos nuevos");



%% Punto 1 three gaussians

% Control random seed

random_par = 10;

a_0 = ones(1,3)/3;
mu_0 = mu_unique' + random_par*rand(3,3);
c_0 = Q_unique+ random_par*rand(3,3,3);

[a,mu,c] = em_algorithm(data, a_0, mu_0, c_0, 100);


%% Punto 2
clear;
clc;
% Set interpreter
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
set(0,'defaulttextInterpreter','latex');


data_wine_x = readmatrix("Datos calidad vino\XtrainVinos.txt");
data_wine_y = readmatrix("Datos calidad vino\YtrainVinos.txt");
data_wine_y = data_wine_y(:,4);

% Subset of train in terms of quality
train_q_wine = data_wine_x(data_wine_y==1,:);
train_nq_wine = data_wine_x(data_wine_y==0,:);

% Estimation for quality and not quality
[q_Q, q_mu] = ML_general_cov_estimation(train_q_wine);
[nq_Q, nq_mu] = ML_general_cov_estimation(train_nq_wine);

% Display of results
disp("Estimation parameter for quality (1 gaussian):")
disp("Q:")
disp(q_Q)
disp("mean:")
disp(q_mu)
disp("Estimation parameter for non quality (1 gaussian):")
disp("Q:")
disp(nq_Q)
disp("mean:")
disp(nq_mu)

% Read test data
test_wine_x = readmatrix("Datos calidad vino\XtestVinos.txt");
test_wine_y = readmatrix("Datos calidad vino\YtestVinos.txt");
test_wine_y = test_wine_y(:,4);

% Predict classes
prob_q = normal_density_log(test_wine_x,q_mu',q_Q);
prob_nq = normal_density_log(test_wine_x,nq_mu',nq_Q);
% Find predictions
pred = prob_q>prob_nq;

% Calculate error
error = sum(pred~=test_wine_y)/length(test_wine_y);
disp("The error rate using single gaussian estimation is:")
disp(num2str(100*error)+"%");


%% Bonus
% Set interpreter
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
set(0,'defaulttextInterpreter','latex');


rng(2);% For reproducibility
random_par_space = logspace(-3,-1, 20);

err_mat = zeros(6,10);


for k = 1:6
    for l = 1:20
        % Control of randomnez
        random_par = random_par_space(l);
        % Control of number of distributions
        %k = 3;
        
        % Initial conditions
        a_0_q = ones(1,k)/k;
        mu_0_q = q_mu' + random_par*(rand(k,11)-0.5);
        c_0_q = q_Q+ random_par*(rand(11,11,k)-0.5);
        
        a_0_nq = ones(1,k)/k;
        mu_0_nq = nq_mu' + random_par*(rand(k,11)-0.5);
        c_0_nq = nq_Q+ random_par*(rand(11,11,k)-0.5);
        
        % Function estimation
        [a_q_multi,mu_q_multi,c_q_multi] = em_algorithm(train_q_wine, a_0_q, mu_0_q, c_0_q, 100);
        [a_nq_multi,mu_nq_multi,c_nq_multi] = em_algorithm(train_nq_wine, a_0_nq, mu_0_nq, c_0_nq, 100);
        
        
        % Multiple probability estimation
        prob_q_multi = zeros(size(test_wine_x,1), 1);
        prob_nq_multi = zeros(size(test_wine_x,1), 1);
        for i = 1:k
            prob_q_multi = prob_q_multi + a_q_multi(i)*...
                normal_density(test_wine_x,mu_q_multi(i,:),c_q_multi(:,:,i));
            prob_nq_multi = prob_nq_multi + a_nq_multi(i)*...
                normal_density(test_wine_x,mu_nq_multi(i,:),c_nq_multi(:,:,i));
        end
        
        
        % Find predictions
        pred_multi = prob_q_multi>prob_nq_multi;
        
        % Calculate error
        error = sum(pred_multi~=test_wine_y)/length(test_wine_y);
        disp("The error rate using multiple gaussian estimation with k = "+num2str(k)+...
            " and rand = "+num2str(random_par)+" is:")
        disp(num2str(100*error)+"%");
        
        err_mat(k,l) = error;
        
    end
end

y_lab = 1:6;
x_lab = random_par_space;
figure('Position', [100 100 1400 500])
heatmap(x_lab,y_lab,err_mat)
colormap parula
xlabel("Rand")
ylabel("k")
title("Hyperparameter Tunning")

%% Functions
function formatPlot(x_lab, y_lab, z_lab, tit)
grid on;
xlabel(x_lab, "fontsize", 19);
ylabel(y_lab, "fontsize", 19);
zlabel(z_lab, "fontsize", 19);
title(tit, "fontsize", 21);
end

% Funcion que calcula el estimador de maxima verosimilitud de la matriz de 
% covarianza entre 3 señales
% x, y y z son vectores columna
function [Q, mu] = ML_cov_estimation(x,y,z)
    mu = [mean(x); mean(y); mean(z)];
    complete_vec = [x, y, z]';
    norm_vec = complete_vec-mu;
    Q = zeros(3,3);
    for i=1:length(norm_vec)
        Q = Q + norm_vec(:,i)*norm_vec(:,i)';
    end
    Q = Q/(length(norm_vec)-1);
end

% Funcion que calcula el estimador de maxima verosimilitud de la matriz de 
% covarianza entre una cantidad arbitraria de seniales que son vectores
% columna
function [Q, mu] = ML_general_cov_estimation(x)
    mu = mean(x)';
    complete_vec = x';
    norm_vec = complete_vec-mu;
    Q = zeros(size(x,2),size(x,2));
    for i=1:size(x,1)
        Q = Q + norm_vec(:,i)*norm_vec(:,i)';
    end
    Q = Q/(size(x,1)-1);
end




function pdf_vec = normal_density(x,mu,c)
    exponent = @(obs, mu, c) (-1/2)*(obs-mu)'*(c\(obs-mu));
    den = (sqrt(det(c))*(2*pi)^(size(x,2)/2));
    pdf_vec = zeros(size(x,1),1);
    for i = 1:size(x,1)
        pdf_vec(i) = (1/den)*exp(exponent(x(i,:)',mu',c)); 
    end
end

function log_pdf_vec = normal_density_log(x,mu,c)
    exponent = @(obs, mu, c) (-1/2)*(obs-mu)'*(c\(obs-mu));
    log_pdf_vec = zeros(size(x,1),1);
    for i = 1:size(x,1)
        log_pdf_vec(i) = -log(sqrt(det(c)))-log((2*pi)^(size(x,2)/2))+exponent(x(i,:)',mu',c); 
    end
end


function gamma = e_step(a,x,mu,c)
    % Asignation of matrix of PDFs
    pdf_mat = zeros(length(x), length(a));
    for i = 1:length(a)
        pdf_mat(:,i) = normal_density(x,mu(i,:),c(:,:,i));
    end
    % Denominator calculation
    den = sum(a.*pdf_mat, 2);
    gamma = a.*pdf_mat;
    gamma = gamma./den;
end

function [a, mu, c] = m_step(gamma, x)
    N = sum(gamma, 1);
    mu = zeros(size(gamma,2), size(x,2));
    for i = 1:size(gamma,2)
        mu(i,:) = (1/N(i)).*sum(gamma(:,i).*x, 1); 
    end
    a = N/size(x,1);
    c = zeros(size(x,2), size(x,2), size(gamma,2));
    for i = 1:size(gamma,2)
        norm_x = x-mu(i,:);
        acum = zeros(size(x,2),size(x,2));
        for j = 1:size(x,1)
            acum = acum + gamma(j,i)*norm_x(j,:)'*norm_x(j,:);
        end
        acum = acum/N(i);
        c(:,:,i) = acum;
    end
end

function [a,mu,c] = em_algorithm(x, a_0, mu_0, c_0, max_iters)
    tol = 1e-5;
    ended = 0;
    it = 0;
    prev_a = a_0;
    prev_mu = mu_0;
    prev_c = c_0;
    while((~ended)&&(it<max_iters))
        gamma = e_step(prev_a,x,prev_mu,prev_c);
        [a, mu, c] = m_step(gamma, x);
        
        if(norm(a-prev_a)<tol)
            ended = 1;
        end
        prev_a = a;
        prev_mu = mu;
        prev_c = c;
    end
end
