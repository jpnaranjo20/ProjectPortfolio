%% Caso de estudio 1 
% Gabriel Mejia
% Maria Fernanda Martinez
% Juan Pablo Naranjo

%% Punto 3

% Limpiar espacio
clear;
clc;


% Numeros de prueba en los experimentos
nums = [10, 100, 1e3, 1e6, 1e8];

% Ciclo de solucion y display de todo
for i = 1:length(nums)
    % Tabla de salida
    out_table = zeros(3,6);
    % Ciclo de experimentos
    for j = 1:3
        % Realizacion de un experimento
        [A, B, AUB, A_and_B, AGB, BGA] = get_experiment(nums(i));
        % Asignacion de valores
        out_table(j,:) = [A, B, AUB, A_and_B, AGB, BGA];
    end
    % Display de resultados
    disp("Tabla para N = "+num2str(nums(i)));
    disp(out_table);
end

%% Funciones necesrias para la implementacion

% Funcion de conteo de diversos eventos
function [x_ev, num] = find_ev(x, low, up)
    x_ev = x( x >= low & x <= up);
    num = length(x_ev);
end

% Funcion de hacer todo un intento con todos los eventos especificados
function [A, B, AUB, A_and_B, AGB, BGA] = get_experiment(N)
    % Vector del experimento
    x = rand(N, 1);
    % Calculo de eventos
    [x_A, num_A] = find_ev(x, 0, 0.4);
    [x_B, num_B] = find_ev(x, 0.2, 0.5);
    [~, num_AUB] = find_ev(x, 0, 0.5);
    [~, num_A_and_B] = find_ev(x, 0.2, 0.4);
    [~, num_AGB] = find_ev(x_B, 0, 0.4);
    [~, num_BGA] = find_ev(x_A, 0.2, 0.5);
    % Frecuenciasde salida
    A = num_A/N;
    B = num_B/N;
    AUB = num_AUB/N;
    A_and_B = num_A_and_B/N;
    AGB = num_AGB/num_B;
    BGA = num_BGA/num_A;
end
