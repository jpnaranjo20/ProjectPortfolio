clc, clear all, close all;

%% Leer y organizar datos
I = double(imread('imagen3.png'))/256; % Leer imagen
X=reshape(I,600*800,3); % Vectorizar imagen


%% Graficar im�genes
figure,  % Graficar puntos RBG
plot3(X(:,1),X(:,2),X(:,3),'.','MarkerSize',0.25), grid on, 
xlabel('R'), ylabel('G'), zlabel('B'), title('Imagen en espacio RGB')

figure, % Graficar imagen original
imshow(I), title('Imagen original')


%% Implementar algoritmo de clustering por combinaci�n de Gaussianas
disp('Resolviendo algoritmo EM...')
K=16;
% Esta funci�n debe devolver:
% r (tama�o 480000x1): el �ndice de la distribuci�n a los que cada dato tiene mayor pertenencia
% C (tama�o 16x3): medias de cada Gaussiana


%% Graficar centros
figure, % Graficar puntos RGB
h=plot3(X(:,1),X(:,2),X(:,3),'.','MarkerSize',0.25); grid on,

hold on, % Graficar medias
plot3(C(:,1),C(:,2),C(:,3),'o','LineWidth',8)
xlabel('R'), ylabel('G'), zlabel('B'), title('K Medias de Gaussianas')


%% Discretizar imagen basada en centros
Xv = C(r,:);
Iv=reshape(Xv,600,800,3);
figure, imshow(Iv), title('Imagen comprimida')