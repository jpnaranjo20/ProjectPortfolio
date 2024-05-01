clear all;
close all;
clc;

M = 5;
sigma2 = 4;

% Definición de h[-T] y h[T].
hT = (1/M)*ones(1,M);
hmenosT = 1/(M)*ones(1,M);

% Convlución de h[-T] y h[T], multiplicar por sigma^2 para hallar R_Y[T].
RY = sigma2*conv(hT, hmenosT, 'full');

% Longitud del vector de tiempo
longitud_n = length(hT)+length(hmenosT)-1;

% Ajuste del vector de tiempo sabiendo que empieza desde -2M y se extiende
% length(hmenosT)-1 pasos
n = -2*M:-2*M+longitud_n-1;

% Gráfica
figure
hold on
grid on
stem(n,RY, 'LineWidth', 2)
grid on
xlabel('\tau')
ylabel('R_Y[\tau]')
title('Función de autocorrelación de Y[n]')

