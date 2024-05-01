clc, clear all, close all;

%% Leer y organizar datos
I = double(imread('imagen3.png'))/256; % Leer imagen
X = reshape(I,600*800,3); % Vectorizar imagen


%% Graficar imágenes
figure,  % Graficar puntos RBG
subplot(1,3,1)
plot3(X(:,1),X(:,2),X(:,3),'.','MarkerSize',0.25), grid on, 
xlabel('R'), ylabel('G'), zlabel('B')

subplot(1,3,2)
plot3(X(:,1),X(:,2),X(:,3),'.','MarkerSize',0.25), grid on, 
xlabel('R'), ylabel('G'), zlabel('B')

subplot(1,3,3)
plot3(X(:,1),X(:,2),X(:,3),'.','MarkerSize',0.25), grid on, 
xlabel('R'), ylabel('G'), zlabel('B')

sgtitle('Imagen en espacio RGB')

figure, % Graficar imagen original
imshow(I), title('Imagen original')


%% Implementar algoritmo de clustering por combinación de Gaussianas
disp('Resolviendo algoritmo EM...')
K=16; %Número de Gaussianas
lambda = 7e-3; %Valor usado para la regularización dentro de algoritmoEM

%Este algoritmo puede tardar entre 20 minutos a 1 hora, por lo que, 
%También se adjuntan unos datos ya calculados en caso de que
%No desee correr este algoritmo, estos datos se encuetran en el
%archivo "datosYaCalculadosEM.mat"
[mu, c, alpha] = algoritmoEM(X,K,lambda);


%% Graficar centros de medias Gaussianas
figure, % Graficar puntos RGB

subplot(1,3,1)
plot3(mu(1,:)',mu(2,:)',mu(3,:)','or','LineWidth',8)
hold all
h=plot3(X(:,1),X(:,2),X(:,3),'.','color',[0 0.4470 0.7410],'MarkerSize',0.25); grid on,
xlabel('R'), ylabel('G'), zlabel('B'), grid on

subplot(1,3,2)
plot3(mu(1,:)',mu(2,:)',mu(3,:)','or','LineWidth',8)
hold all
h=plot3(X(:,1),X(:,2),X(:,3),'.','color',[0 0.4470 0.7410],'MarkerSize',0.25); grid on,
xlabel('R'), ylabel('G'), zlabel('B'), grid on

subplot(1,3,3)
plot3(mu(1,:)',mu(2,:)',mu(3,:)','or','LineWidth',8) 
hold all
h=plot3(X(:,1),X(:,2),X(:,3),'.','color',[0 0.4470 0.7410],'MarkerSize',0.25); grid on,
xlabel('R'), ylabel('G'), zlabel('B'), grid on
sgtitle('Imagen en Espacio RGB con Medias de Gaussianas')



%% se obtiene para cada punto su correspondiente media Gaussiana asociada
%Este algoritmo puede demorarse entre 5 minutos y 10 minutos en correr
%También se adjuntan unos datos ya calculados en caso de que
%No desee correr este algoritmo, estos datos se encuetran en el
%archivo "datosYaCalculadosColores.mat"

%Se le asignan tres vector de posición a cada Gaussiana, con el fin de
%Que sea mas facil colorear cada punto asociada a una media Gaussiana
datos_x_1 = [];
datos_y_1 = [];
datos_z_1 = [];

datos_x_2 = [];
datos_y_2 = [];
datos_z_2 = [];

datos_x_3 = [];
datos_y_3 = [];
datos_z_3 = [];

datos_x_4 = [];
datos_y_4 = [];
datos_z_4 = [];

datos_x_5 = [];
datos_y_5 = [];
datos_z_5 = [];

datos_x_6 = [];
datos_y_6 = [];
datos_z_6 = [];

datos_x_7 = [];
datos_y_7 = [];
datos_z_7 = [];

datos_x_8 = [];
datos_y_8 = [];
datos_z_8 = [];

datos_x_9 = [];
datos_y_9 = [];
datos_z_9 = [];

datos_x_10 = [];
datos_y_10 = [];
datos_z_10 = [];

datos_x_11 = [];
datos_y_11 = [];
datos_z_11 = [];

datos_x_12 = [];
datos_y_12 = [];
datos_z_12 = [];

datos_x_13 = [];
datos_y_13 = [];
datos_z_13 = [];

datos_x_14 = [];
datos_y_14 = [];
datos_z_14 = [];

datos_x_15 = [];
datos_y_15 = [];
datos_z_15 = [];

datos_x_16 = [];
datos_y_16 = [];
datos_z_16 = [];

%En este for se recorre cada uno de los 480000 puntos y se determina a cual
%media Gaussiana pertenece
primero = 1;
for i = 1:length(X(:,1))
    valor = mvnpdf(X(i,1:end),mu',c).*alpha;
    %maxi es el valor máximo del punto evaluado para las 16 Gaussianas
    %max_gauss indica en cual de las 16 Gaussianas se dio la mayor probabilidad 
    [maxi, max_gauss] = max(valor);
    if max_gauss == 1
        datos_x_1(length(datos_z_1) + 1) = X(i,1);
        datos_y_1(length(datos_z_1) + 1) = X(i,2);
        datos_z_1(length(datos_z_1) + 1) = X(i,3);
    elseif max_gauss == 2
        datos_x_2(length(datos_z_2) + 1) = X(i,1);
        datos_y_2(length(datos_z_2) + 1) = X(i,2);
        datos_z_2(length(datos_z_2) + 1) = X(i,3);
    elseif max_gauss == 3
        datos_x_3(length(datos_z_3) + 1) = X(i,1);
        datos_y_3(length(datos_z_3) + 1) = X(i,2);
        datos_z_3(length(datos_z_3) + 1) = X(i,3);
    elseif max_gauss == 4
        datos_x_4(length(datos_z_4) + 1) = X(i,1);
        datos_y_4(length(datos_z_4) + 1) = X(i,2);
        datos_z_4(length(datos_z_4) + 1) = X(i,3);
    elseif max_gauss == 5
        datos_x_5(length(datos_z_5) + 1) = X(i,1);
        datos_y_5(length(datos_z_5) + 1) = X(i,2);
        datos_z_5(length(datos_z_5) + 1) = X(i,3);
    elseif max_gauss == 6
        datos_x_6(length(datos_z_6) + 1) = X(i,1);
        datos_y_6(length(datos_z_6) + 1) = X(i,2);
        datos_z_6(length(datos_z_6) + 1) = X(i,3);
    elseif max_gauss == 7
        datos_x_7(length(datos_z_7) + 1) = X(i,1);
        datos_y_7(length(datos_z_7) + 1) = X(i,2);
        datos_z_7(length(datos_z_7) + 1) = X(i,3);
    elseif max_gauss == 8
        datos_x_8(length(datos_z_8) + 1) = X(i,1);
        datos_y_8(length(datos_z_8) + 1) = X(i,2);
        datos_z_8(length(datos_z_8) + 1) = X(i,3);
    elseif max_gauss == 9
        datos_x_9(length(datos_z_9) + 1) = X(i,1);
        datos_y_9(length(datos_z_9) + 1) = X(i,2);
        datos_z_9(length(datos_z_9) + 1) = X(i,3);
    elseif max_gauss == 10
        datos_x_10(length(datos_z_10) + 1) = X(i,1);
        datos_y_10(length(datos_z_10) + 1) = X(i,2);
        datos_z_10(length(datos_z_10) + 1) = X(i,3);
    elseif max_gauss == 11
        datos_x_11(length(datos_z_11) + 1) = X(i,1);
        datos_y_11(length(datos_z_11) + 1) = X(i,2);
        datos_z_11(length(datos_z_11) + 1) = X(i,3);
    elseif max_gauss == 12
        datos_x_12(length(datos_z_12) + 1) = X(i,1);
        datos_y_12(length(datos_z_12) + 1) = X(i,2);
        datos_z_12(length(datos_z_12) + 1) = X(i,3);
    elseif max_gauss == 13
        datos_x_13(length(datos_z_13) + 1) = X(i,1);
        datos_y_13(length(datos_z_13) + 1) = X(i,2);
        datos_z_13(length(datos_z_13) + 1) = X(i,3);
    elseif max_gauss == 14
        datos_x_14(length(datos_z_14) + 1) = X(i,1);
        datos_y_14(length(datos_z_14) + 1) = X(i,2);
        datos_z_14(length(datos_z_14) + 1) = X(i,3);
    elseif max_gauss == 15
        datos_x_15(length(datos_z_15) + 1) = X(i,1);
        datos_y_15(length(datos_z_15) + 1) = X(i,2);
        datos_z_15(length(datos_z_15) + 1) = X(i,3);
    else
        datos_x_16(length(datos_z_16) + 1) = X(i,1);
        datos_y_16(length(datos_z_16) + 1) = X(i,2);
        datos_z_16(length(datos_z_16) + 1) = X(i,3);
    end
        nuevo_v(i,1) = mu(1,max_gauss);
        nuevo_v(i,2) = mu(2,max_gauss);
        nuevo_v(i,3) = mu(3,max_gauss);
end
%% Se grafica cada punto de la imagen en el espacio RGB con un color 
%correspondiente a cada media Gaussiana encontrada

figure
subplot(1,3,1)
hold all
color1 = rand(1,3);
plot3(datos_x_1,datos_y_1,datos_z_1,'.','Color',color1,'MarkerSize',0.25);
color2 = rand(1,3);
plot3(datos_x_2,datos_y_2,datos_z_2,'.','Color',color2,'MarkerSize',0.25);
color3 = rand(1,3);
plot3(datos_x_3,datos_y_3,datos_z_3,'.','Color',color3,'MarkerSize',0.25);
color4 = rand(1,3);
plot3(datos_x_4,datos_y_4,datos_z_4,'.','Color',color4,'MarkerSize',0.25);
color5 = rand(1,3);
plot3(datos_x_5,datos_y_5,datos_z_5,'.','Color',color5,'MarkerSize',0.25);
color6 = rand(1,3);
plot3(datos_x_6,datos_y_6,datos_z_6,'.','Color',color6,'MarkerSize',0.25);
color7 = rand(1,3);
plot3(datos_x_7,datos_y_7,datos_z_7,'.','Color',color7,'MarkerSize',0.25);
color8 = rand(1,3);
plot3(datos_x_8,datos_y_8,datos_z_8,'.','Color',color8,'MarkerSize',0.25);
color9 = rand(1,3);
plot3(datos_x_9,datos_y_9,datos_z_9,'.','Color',color9,'MarkerSize',0.25);
color10 = rand(1,3);
plot3(datos_x_10,datos_y_10,datos_z_10,'.','Color',color10,'MarkerSize',0.25);
color11 = rand(1,3);
plot3(datos_x_11,datos_y_11,datos_z_11,'.','Color',color11,'MarkerSize',0.25);
color12 = rand(1,3);
plot3(datos_x_12,datos_y_12,datos_z_12,'.','Color',color12,'MarkerSize',0.25);
color13 = rand(1,3);
plot3(datos_x_13,datos_y_13,datos_z_13,'.','Color',color13,'MarkerSize',0.25);
color14 = rand(1,3);
plot3(datos_x_14,datos_y_14,datos_z_14,'.','Color',color14,'MarkerSize',0.25);
color15 = rand(1,3);
plot3(datos_x_15,datos_y_15,datos_z_15,'.','Color',color15,'MarkerSize',0.25);
color16 = rand(1,3);
plot3(datos_x_16,datos_y_16,datos_z_16,'.','Color',color16,'MarkerSize',0.25);
xlabel('R'), ylabel('G'), zlabel('B'), grid on
hold all

subplot(1,3,2)
hold all
plot3(datos_x_1,datos_y_1,datos_z_1,'.','Color',color1,'MarkerSize',0.25);
plot3(datos_x_2,datos_y_2,datos_z_2,'.','Color',color2,'MarkerSize',0.25);
plot3(datos_x_3,datos_y_3,datos_z_3,'.','Color',color3,'MarkerSize',0.25);
plot3(datos_x_4,datos_y_4,datos_z_4,'.','Color',color4,'MarkerSize',0.25);
plot3(datos_x_5,datos_y_5,datos_z_5,'.','Color',color5,'MarkerSize',0.25);
plot3(datos_x_6,datos_y_6,datos_z_6,'.','Color',color6,'MarkerSize',0.25);
plot3(datos_x_7,datos_y_7,datos_z_7,'.','Color',color7,'MarkerSize',0.25);
plot3(datos_x_8,datos_y_8,datos_z_8,'.','Color',color8,'MarkerSize',0.25);
plot3(datos_x_9,datos_y_9,datos_z_9,'.','Color',color9,'MarkerSize',0.25);
plot3(datos_x_10,datos_y_10,datos_z_10,'.','Color',color10,'MarkerSize',0.25);
plot3(datos_x_11,datos_y_11,datos_z_11,'.','Color',color11,'MarkerSize',0.25);
plot3(datos_x_12,datos_y_12,datos_z_12,'.','Color',color12,'MarkerSize',0.25);
plot3(datos_x_13,datos_y_13,datos_z_13,'.','Color',color13,'MarkerSize',0.25);
plot3(datos_x_14,datos_y_14,datos_z_14,'.','Color',color14,'MarkerSize',0.25);
plot3(datos_x_15,datos_y_15,datos_z_15,'.','Color',color15,'MarkerSize',0.25);
plot3(datos_x_16,datos_y_16,datos_z_16,'.','Color',color16,'MarkerSize',0.25);
xlabel('R'), ylabel('G'), zlabel('B'), grid on
hold all

subplot(1,3,3)
hold all
plot3(datos_x_1,datos_y_1,datos_z_1,'.','Color',color1,'MarkerSize',0.25);
plot3(datos_x_2,datos_y_2,datos_z_2,'.','Color',color2,'MarkerSize',0.25);
plot3(datos_x_3,datos_y_3,datos_z_3,'.','Color',color3,'MarkerSize',0.25);
plot3(datos_x_4,datos_y_4,datos_z_4,'.','Color',color4,'MarkerSize',0.25);
plot3(datos_x_5,datos_y_5,datos_z_5,'.','Color',color5,'MarkerSize',0.25);
plot3(datos_x_6,datos_y_6,datos_z_6,'.','Color',color6,'MarkerSize',0.25);
plot3(datos_x_7,datos_y_7,datos_z_7,'.','Color',color7,'MarkerSize',0.25);
plot3(datos_x_8,datos_y_8,datos_z_8,'.','Color',color8,'MarkerSize',0.25);
plot3(datos_x_9,datos_y_9,datos_z_9,'.','Color',color9,'MarkerSize',0.25);
plot3(datos_x_10,datos_y_10,datos_z_10,'.','Color',color10,'MarkerSize',0.25);
plot3(datos_x_11,datos_y_11,datos_z_11,'.','Color',color11,'MarkerSize',0.25);
plot3(datos_x_12,datos_y_12,datos_z_12,'.','Color',color12,'MarkerSize',0.25);
plot3(datos_x_13,datos_y_13,datos_z_13,'.','Color',color13,'MarkerSize',0.25);
plot3(datos_x_14,datos_y_14,datos_z_14,'.','Color',color14,'MarkerSize',0.25);
plot3(datos_x_15,datos_y_15,datos_z_15,'.','Color',color15,'MarkerSize',0.25);
plot3(datos_x_16,datos_y_16,datos_z_16,'.','Color',color16,'MarkerSize',0.25);
xlabel('R'), ylabel('G'), zlabel('B'), grid on
hold all
sgtitle('Imagen en Espacio RGB - Colores Asociados a cada Media')

%Se eliminan las variables que contenían los 16 colores
clear color1
clear color2
clear color3
clear color4
clear color5
clear color6
clear color7
clear color8
clear color9
clear color10
clear color11
clear color12
clear color13
clear color14
clear color15
clear color16
%% Se grafican todos los puntos, pero, ubicados en la misma posición en 
% donde se encuentra su media Guassiana correspondiente
figure
plot3(nuevo_v(:,1),nuevo_v(:,2),nuevo_v(:,3),'or','LineWidth',8);
xlabel('R'), ylabel('G'), zlabel('B'), grid on
title('Imagen en Espacio RGB - Puntos Ubicados a su Respectiva Media')
%% Discretizar imagen basada en centros

Xv = nuevo_v(:,:);
Iv=reshape(Xv,600,800,3);
figure
imshow(I), title('Imagen original')

figure
imshow(Iv), title('Imagen comprimida')


