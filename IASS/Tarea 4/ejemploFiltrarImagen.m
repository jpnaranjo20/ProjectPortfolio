%%% Generar imagen borrosa
clc, clear all, close all;

%% Leer imagen
I=imread('ladron.jpg');
%I=double(rgb2gray(I))/256; % Si es a color
I=double(I)/256; % Valor de pixeles queda entre 0 y 1

%% Tamaño de la imagen
M=size(I,1); 
N=size(I,2);

%% Kernel de 5x5 que promedia
h = (1/25)*ones(5);

%% Filtrar imagen 
Ib = imfilter(I, h);

%% Graficar imagenes
figure, 
subplot(121), imshow(I), title('Imagen original')
subplot(122), imshow(Ib), title('Imagen filtrada')
