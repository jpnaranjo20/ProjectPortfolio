clc, clear all, close all;  
%% a) Leer y organizar los datos
I = double(imread('imagen3.png'))/256; % Leer imagen
X = reshape(I,600*800,3); % Vectorizar imagen
% La primera columna es R, la segunda es G y la tercera es B.

figure,  % Graficar puntos RGB
plot3(X(:,1),X(:,2),X(:,3),'.','MarkerSize',0.25), grid on, 
xlabel('R'), ylabel('G'), zlabel('B')
title('Imgaen en espacio RGB')

figure, % Graficar imagen original
imshow(I), title('Imagen original')
%% b) Algoritmo EM

disp('Resolviendo algoritmo EM...')
K=16; %Número de Gaussianas
lambda = 7e-3; %Valor usado para la regularización dentro de algoritmoEM

%Este algoritmo puede tardar entre 20 minutos a 1 hora, por lo que, 
%También se adjuntan unos datos ya calculados en caso de que
%No desee correr este algoritmo, estos datos se encuetran en el
%archivo "datosYaCalculadosEM.mat"
[mu, c, alpha] = algoritmoEM(X,K,lambda);

 % Graficar puntos RGB
figure
plot3(mu(1,:)',mu(2,:)',mu(3,:)','or','LineWidth',8)
hold all
h=plot3(X(:,1),X(:,2),X(:,3),'.','color',[0 0.4470 0.7410],'MarkerSize',0.25); grid on,
xlabel('R'), ylabel('G'), zlabel('B'), grid on

%% c)
% Ya teniendo las 16 medias y 16 matrices de covarianza, se procede a
% asignar cada uno de los 480,000 datos a su respectiva media, generando
% así una matriz de 480,000x3 en la que cada fila tiene una media,
% dependiendo de a cuál media pertenece el dato en la fila i. 

% Vamos a usar la función mvnpdf, en la que podemos poner a evaluar el dato
% en X(:,1) con todas las medias y covarianzas en las matrices mu y c de
% una vez, por lo que nos retornará un vector de 16x1, en el que cada fila
% se encuentra el resultado de evaluar el dato X(:,1) con su respectiva
% media y matriz de covarianza.

% Creamos arreglos para guardar los datos de R, G y B.
datos_R1 = [];
datos_G1 = [];
datos_B1 = [];

datos_R2 = [];
datos_G2 = [];
datos_B2 = [];

datos_R3 = [];
datos_G3 = [];
datos_B3 = [];

datos_R4 = [];
datos_G4 = [];
datos_B4 = [];

datos_R5 = [];
datos_G5 = [];
datos_B5 = [];

datos_R6 = [];
datos_G6 = [];
datos_B6 = [];

datos_R7 = [];
datos_G7 = [];
datos_B7 = [];

datos_R8 = [];
datos_G8 = [];
datos_B8 = [];

datos_R9 = [];
datos_G9 = [];
datos_B9 = [];

datos_R10 = [];
datos_G10 = [];
datos_B10 = [];

datos_R11 = [];
datos_G11 = [];
datos_B11 = [];

datos_R12 = [];
datos_G12 = [];
datos_B12 = [];

datos_R13 = [];
datos_G13 = [];
datos_B13 = [];

datos_R14 = [];
datos_G14 = [];
datos_B14 = [];

datos_R15 = [];
datos_G15 = [];
datos_B15 = [];

datos_R16 = [];
datos_G16 = [];
datos_B16 = [];

% Recorremos todos los datos del arreglo X

for i=1:length(X)
   % Evaluamos el dato X(:,i) en una función Gaussiana
   val = mvnpdf(X(i,:),mu',c).*alpha;
   % Encontramos el máximo valor dentro del vector que retorna la función
   % mvnpdf para saber a cuál de las 16 distribuciones pertenece.
   % valMax es el valor máximo del punto evaluado para las 16 Gaussianas
   % index indica en cual de las 16 Gaussianas se dio la mayor probabilidad 
   [valmax, index] = max(val);
   
   % Preguntamos a cuál de todas perteneció para agregar el dato a su
   % correspondiente lista.
   if index == 1
       datos_R1(length(datos_B1)+1) = X(i, 1);
       datos_G1(length(datos_B1)+1) = X(i, 2);
       datos_B1(length(datos_B1)+1) = X(i, 3);
   elseif index == 2
       datos_R2(length(datos_B2)+1) = X(i, 1);
       datos_G2(length(datos_B2)+1) = X(i, 2);
       datos_B2(length(datos_B2)+1) = X(i, 3);
   elseif index == 3
       datos_R3(length(datos_B3)+1) = X(i, 1);
       datos_G3(length(datos_B3)+1) = X(i, 2);
       datos_B3(length(datos_B3)+1) = X(i, 3);  
   elseif index == 4
       datos_R4(length(datos_B4)+1) = X(i, 1);
       datos_G4(length(datos_B4)+1) = X(i, 2);
       datos_B4(length(datos_B4)+1) = X(i, 3);
   elseif index == 5
       datos_R5(length(datos_B5)+1) = X(i, 1);
       datos_G5(length(datos_B5)+1) = X(i, 2);
       datos_B5(length(datos_B5)+1) = X(i, 3);           
   elseif index == 6
       datos_R6(length(datos_B6)+1) = X(i, 1);
       datos_G6(length(datos_B6)+1) = X(i, 2);
       datos_B6(length(datos_B6)+1) = X(i, 3);
   elseif index == 7
       datos_R7(length(datos_B7)+1) = X(i, 1);
       datos_G7(length(datos_B7)+1) = X(i, 2);
       datos_B7(length(datos_B7)+1) = X(i, 3);
   elseif index == 8
       datos_R8(length(datos_B8)+1) = X(i, 1);
       datos_G8(length(datos_B8)+1) = X(i, 2);
       datos_B8(length(datos_B8)+1) = X(i, 3);
   elseif index == 9
       datos_R9(length(datos_B9)+1) = X(i, 1);
       datos_G9(length(datos_B9)+1) = X(i, 2);
       datos_B9(length(datos_B9)+1) = X(i, 3);
   elseif index == 10
       datos_R10(length(datos_B10)+1) = X(i, 1);
       datos_G10(length(datos_B10)+1) = X(i, 2);
       datos_B10(length(datos_B10)+1) = X(i, 3);
   elseif index == 11
       datos_R11(length(datos_B11)+1) = X(i, 1);
       datos_G11(length(datos_B11)+1) = X(i, 2);
       datos_B11(length(datos_B11)+1) = X(i, 3);
   elseif index == 12
       datos_R12(length(datos_B12)+1) = X(i, 1);
       datos_G12(length(datos_B12)+1) = X(i, 2);
       datos_B12(length(datos_B12)+1) = X(i, 3); 
   elseif index == 13
       datos_R13(length(datos_B13)+1) = X(i, 1);
       datos_G13(length(datos_B13)+1) = X(i, 2);
       datos_B13(length(datos_B13)+1) = X(i, 3);                                            
   elseif index == 14
       datos_R14(length(datos_B14)+1) = X(i, 1);
       datos_G14(length(datos_B14)+1) = X(i, 2);
       datos_B14(length(datos_B14)+1) = X(i, 3);                                                
   elseif index == 15
       datos_R15(length(datos_B15)+1) = X(i, 1);
       datos_G15(length(datos_B15)+1) = X(i, 2);
       datos_B15(length(datos_B15)+1) = X(i, 3);                                                    
   elseif index == 16
       datos_R16(length(datos_B16)+1) = X(i, 1);
       datos_G16(length(datos_B16)+1) = X(i, 2);
       datos_B16(length(datos_B16)+1) = X(i, 3);
   end
   % Aquí creamos el arreglo nuevo (también de 480,000x3) en tonde
   % guardaremos en cada posición la media asociada al valor original.
   nuevo_v(i,1) = mu(1,index);
   nuevo_v(i,2) = mu(2,index);
   nuevo_v(i,3) = mu(3,index);
   
end

% Ahora vamos a graficar los datos pero coloreando de diferente color los
% datos asociados a cada media.
figure
hold all
grid on
color1 = rand(1,3);
plot3(datos_R1,datos_G1,datos_B1,'.','Color',color1,'MarkerSize',0.25);
color2 = rand(1,3);
plot3(datos_R2,datos_G2,datos_B2,'.','Color',color2,'MarkerSize',0.25);
color3 = rand(1,3);
plot3(datos_R3,datos_G3,datos_B3,'.','Color',color3,'MarkerSize',0.25);
color4 = rand(1,3);
plot3(datos_R4,datos_G4,datos_B4,'.','Color',color4,'MarkerSize',0.25);
color5 = rand(1,3);
plot3(datos_R5,datos_G5,datos_B5,'.','Color',color5,'MarkerSize',0.25);
color6 = rand(1,3);
plot3(datos_R6,datos_G6,datos_B6,'.','Color',color6,'MarkerSize',0.25);
color7 = rand(1,3);
plot3(datos_R7,datos_G7,datos_B7,'.','Color',color7,'MarkerSize',0.25);
color8 = rand(1,3);
plot3(datos_R8,datos_G8,datos_B8,'.','Color',color8,'MarkerSize',0.25);
color9 = rand(1,3);
plot3(datos_R9,datos_G9,datos_B9,'.','Color',color9,'MarkerSize',0.25);
color10 = rand(1,3);
plot3(datos_R10,datos_G10,datos_B10,'.','Color',color10,'MarkerSize',0.25);
color11 = rand(1,3);
plot3(datos_R11,datos_G11,datos_B11,'.','Color',color11,'MarkerSize',0.25);
color12 = rand(1,3);
plot3(datos_R12,datos_G12,datos_B12,'.','Color',color12,'MarkerSize',0.25);
color13 = rand(1,3);
plot3(datos_R13,datos_G13,datos_B13,'.','Color',color13,'MarkerSize',0.25);
color14 = rand(1,3);
plot3(datos_R14,datos_G14,datos_B14,'.','Color',color14,'MarkerSize',0.25);
color15 = rand(1,3);
plot3(datos_R15,datos_G15,datos_B15,'.','Color',color15,'MarkerSize',0.25);
color16 = rand(1,3);
plot3(datos_R16,datos_G16,datos_B16,'.','Color',color16,'MarkerSize',0.25);

plot3(nuevo_v(:,1),nuevo_v(:,2),nuevo_v(:,3),'or','LineWidth',8);
xlabel('R'), ylabel('G'), zlabel('B')
title('Imagen en Espacio RGB - Puntos Ubicados a su Respectiva Media')

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
%% d) Comparación imagen original con imagen comprimida

Xv = nuevo_v(:,:);
Iv = reshape(Xv,600,800,3);

figure
imshow(I), title('Imagen original')

figure
imshow(Iv), title('Imagen comprimida')
