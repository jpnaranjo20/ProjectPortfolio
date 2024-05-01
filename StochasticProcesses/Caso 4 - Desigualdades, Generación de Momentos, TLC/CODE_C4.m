%% Caso de estudio 4 
% Gabriel Mejia
% Maria Fernanda Martinez
% Juan Pablo Naranjo

%% Punto 4

%Limpiar espacio
clear;
clc;
% Settear interpretador
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
set(0,'defaulttextInterpreter','latex');


% Vector de repeticiones disponibles
n = [1, 2, 3, 5, 10, 100, 1000, 100000];
% 
% Ciclo de graficacion
figure
for i = 1:8
    subplot(2,4,i)
    histogram(make_exp(n(i)));
    xlabel("$Y_n$","fontsize",19);
    ylabel("Frecuencia","fontsize",19);
    title("$n="+num2str(n(i))+"$","fontsize",19);
    grid on;
    ylim([0,450]);
    xlim([-4,4]);
end

% Funcion para hacer experimentos con arbitratio numero de variables
function v = make_exp(n)
% Estadisticos poblacionales
mu = 3;
var = 1/3;

% Generacion de N variables
gen = @(n) 2*rand(1,n)+2;
% Generacion de Sn
Sn = @(n) sum(gen(n));
%Generacion de Yn
Yn = @(n) (Sn(n)-n*mu)/(sqrt(n*var));

% Definicion de vector de salida
v = zeros(1,5000);
for i = 1:length(v)
    v(i) = Yn(n);
end
end
