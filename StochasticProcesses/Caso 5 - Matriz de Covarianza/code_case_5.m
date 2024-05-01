%% Caso de estudio 5
% Gabriel Mejia
% Maria Fernanda Martinez
% Juan Pablo Naranjo

%% Punto 1
clear;
clc;
% Pre-especificar el interpretador
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
set(0,'defaulttextInterpreter','latex');

% Declaracion de matrices de entrada
Cy = [25, 1; 1, 9];
Cx = [1, 0.1; 0.1, 2];
% Calculo de matriz de transformacion
A = Cx^(0.5)*Cy^(-0.5);
% Display de matriz de transformacion
disp("A:")
disp(A)
% Prueba de funcionalidad
Cx_test = A*Cy*A';
% Display de resultado de test
disp("Cx_test:")
disp(Cx_test)


%% Punto 2

% Matrices de entrada
A = [25, 20; 20 9];
B = [3, -2; -2, 3];
D = diag([4,3,5]);

% Calculo de vectores propios
eigA = eig(A);
eigB = eig(B);
eigD = eig(D);

% Print de resultados
disp("Lambda_A ="+ num2str(eigA));
disp("Lambda_B ="+ num2str(eigB));
disp("Lambda_D ="+ num2str(eigD));

%% Punto 3
% Matriz inversa
Cx_inv = [18, 2; 2, 30];
% Calculo de matriz de covarianza real
Cx = inv(Cx_inv);
% Calculo del determinante
detCx = det(Cx);
% Calculo de R
R = 1/((2*pi)^(2/2)*sqrt(detCx));

% Display de resultados
disp("Cx:")
disp(Cx)
disp("Det(Cx):")
disp(detCx)
disp("R:")
disp(R)

%% Punto 5

% Declaracion de medias
mu = [0,0];
% Declaracion de Matriz de covarianza
covM = eye(2);
% Obtencion de vectores con media cero y covarianza = I_2
X = mvnrnd(mu,covM, 5000)';


% Declaracion de matriz de transformacion
A = [2,-1;-1,9]^(0.5);
b = [3;-4];

% Print de resultados
disp("A:")
disp(A)
disp("b:")
disp(b)


% Transformacion del vector X
Y = A*X+b;

% Scatter 
figure
subplot(1,2,1)
plot(X(1,:),X(2,:),'.k')
grid on
xlabel("$X_1$",'fontsize', 19)
ylabel("$X_2$",'fontsize', 19)
title("Dispersi\'on de $X$",'fontsize', 21)
xlim([-15,15])
ylim([-15,15])
subplot(1,2,2)
plot(Y(1,:),Y(2,:),'.r')
xlim([-15,15])
ylim([-15,15])
grid on
xlabel("$Y_1$",'fontsize', 19)
ylabel("$Y_2$",'fontsize', 19)
title("Dispersi\'on de $Y$",'fontsize', 21)


% Declaracion de vector de rango a probar
y = linspace(-15,15, 1000);
% Declaracion de PDFs teoricas
pdfy1 = normpdf(y, b(1), sqrt(2));
pdfy2 = normpdf(y, b(2), sqrt(9));

% Graficacion de sobrelapamientos
figure
histogram(Y(1,:), 'normalization', 'pdf','facecolor','red');
hold on;
plot(y,pdfy1,'r','linewidth', 1.3)
histogram(Y(2,:), 'normalization', 'pdf','facecolor','black');
plot(y,pdfy2,'k','linewidth', 1.3)
grid on
legend('Histograma $Y_1$', "PDF $Y_1$",'Histograma $Y_2$', "PDF $Y_2$",...
    'fontsize', 12, 'location', 'best')
title("Histogramas Vs PDFs", 'fontsize', 21);
xlabel("$y$",'fontsize', 19)
ylabel("PDF/Frecuencia relativa",'fontsize', 19)
xlim([-15,15]);












