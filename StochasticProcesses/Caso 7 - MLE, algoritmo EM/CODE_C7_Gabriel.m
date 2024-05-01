%% Caso de estudio 7 
% Gabriel Mejia
% Maria Fernanda Martinez
% Juan Pablo Naranjo

%% Punto 1

%Clean space
clear;
clc;
% Set interpreter
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
set(0,'defaulttextInterpreter','latex');


% Read data
datSunRad = readmatrix("Sun_Rad.txt");
datTempCO2 = readmatrix("Temp_CO2.txt");

annual_sun_rad = zeros(30,2);

% Compute annual average for sun rad
for i = min(datSunRad(:,1)):max(datSunRad(:,1))
    % Find indexes of that year
    indexes = datSunRad(:,1) == i;
    % Assign mean to array
    annual_sun_rad(i-min(datSunRad(:,1))+1,:) = [1900+i, mean(datSunRad(indexes,3))];
end

% Plot de señales en el tiempo
figure('Position', [100 300 1200 400])
subplot(1,3,1)
plot(datTempCO2(:,1),datTempCO2(:,2),'.-k', 'markersize', 10)
xlabel("A\~no", "fontsize", 19)
ylabel("$\Delta T (^oC)$", "fontsize", 19)
title(["Cambio de temperatura ", "en el tiempo"], "fontsize", 21)
grid on

subplot(1,3,2)
plot(datTempCO2(:,1),datTempCO2(:,3),'.-k', 'markersize', 10)
xlabel("A\~no", "fontsize", 19)
ylabel("Concantraci\'on CO$_2$ (ppm)", "fontsize", 19)
title(["Concentraci\'on de CO$_2$", "en el tiempo"], "fontsize", 21)
grid on

subplot(1,3,3)
plot(annual_sun_rad(:,1),annual_sun_rad(:,2),'.-k', 'markersize', 10)
xlabel("A\~no", "fontsize", 19)
ylabel("Radiacion solar (kWh/m$^2$)", "fontsize", 19)
title(["radiaci\'on solar", "en el tiempo"], "fontsize", 21)
grid on


% Plot de parejas de variables
figure('Position', [100 300 1000 400])
subplot(1,2,1)
plot(annual_sun_rad(:,2), datTempCO2(:,2),'.k', 'markersize', 10)
xlabel("Radiacion solar (kWh/m$^2$)", "fontsize", 19)
ylabel("$\Delta T (^oC)$", "fontsize", 19)
title(["Cambio de temperatura ", "Vs radiaci\'on solar"], "fontsize", 21)
grid on

subplot(1,2,2)
plot(datTempCO2(:,3),datTempCO2(:,2),'.k', 'markersize', 10)
xlabel("Concantraci\'on CO$_2$ (ppm)", "fontsize", 19)
ylabel("$\Delta T (^oC)$", "fontsize", 19)
title(["Cambio de temperatura ", "Vs Concentraci\'on de CO$_2$"], "fontsize", 21)
grid on

% Calculo de estimacion
est_Q_t_co2 = ML_cov_estimation(datTempCO2(:,2),datTempCO2(:,3));
est_Q_t_rad = ML_cov_estimation(datTempCO2(:,2),annual_sun_rad(:,2));
% Calculo de rhos totales
rho_tot_t_co2 = find_rho(est_Q_t_co2);
rho_tot_t_rad = find_rho(est_Q_t_rad);

% Display de resultados
disp("Matriz de covarianza estimada entre temperatura y CO2:")
disp(est_Q_t_co2)
disp("Matriz de covarianza estimada entre temperatura y radiacion:")
disp(est_Q_t_rad)
disp("Rho estimado entre temperatura y CO2:")
disp(rho_tot_t_co2)
disp("Rho estimado entre temperatura y radiacion:")
disp(rho_tot_t_rad)


% Moving windoy size
win = 10;
% correlation coefficient vector declaration
mov_rho_t_co2 = zeros(1,length(datTempCO2)-win);
mov_rho_t_rad = zeros(1,length(datTempCO2)-win);

% Moving cycle computing
for i = 1:length(datTempCO2(:,2))-win
    act_est_Q_t_co2 = ML_cov_estimation(datTempCO2(i:i+win,2),datTempCO2(i:i+win,3));
    act_est_Q_t_rad = ML_cov_estimation(datTempCO2(i:i+win,2),annual_sun_rad(i:i+win,2));
    mov_rho_t_co2(i) = find_rho(act_est_Q_t_co2);
    mov_rho_t_rad(i) = find_rho(act_est_Q_t_rad);
end

% declaration of final year vector
final_year = min(datTempCO2(:,1))+win:max(datTempCO2(:,1));

% plot del coeficientede correlacion
figure('Position', [100 300 600 400])
hold on;
plot(final_year, mov_rho_t_co2, '.-k', 'markersize', 10)
plot(final_year, mov_rho_t_rad, '.-r', 'markersize', 10)
grid on
xlabel("A\~no final de la ventana", "fontsize", 19)
ylabel("$\rho$", "fontsize", 19)
title(["Correlaci\'on en ventana movible"], "fontsize", 21)
legend(["$\rho_{_{\Delta T,CO_2}}$","$\rho_{_{\Delta T,Rad}}$"], "fontsize", 15, 'location', 'northwest')


%% Punto 2

% Clear space
clear;
% Read data
data = readmatrix("greenhouseCaso7.txt");
t = data(:,1);
h = data(:,2);

% Plot observations
figure('Position', [100 200 600 500])
plot(h,t,'.k','markersize',10)
grid on
xlabel("Humedad (\%)", "fontsize", 19)
ylabel("Temperatura ($^oC$)", "fontsize", 19)
title("Humedad Vs temperatura", "fontsize", 21)




% Funcion que calcula el estimador de maxima verosimilitud de lamatriz de 
% covarianza entre 2 señales
% x y y son vectores columna
function Q = ML_cov_estimation(x,y)
    mu = [mean(x); mean(y)];
    complete_vec = [x, y]';
    norm_vec = complete_vec-mu;
    Q = zeros(2,2);
    for i=1:length(norm_vec)
        Q = Q + norm_vec(:,i)*norm_vec(:,i)';
    end
    Q = Q/(length(norm_vec)-1);
end

% Funcion que calcula rhoa partir de la matriz de covarianza
function rho = find_rho(Q)
    rho = Q(1,2)/sqrt(Q(1,1)*Q(2,2));
end
