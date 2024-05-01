%% Punto 1a - Intento 3 Con Matrices
%Digito 2 es clase 1, digito 9 es clase 0
clc
clear all
close all
load('images2.mat')
load('images9.mat')
images = images2;

%Se guardan todas las imágenes en un solo vector
for i = 1:100
    images(:,:,i+100) = images9(:,:,i);
end

%Punto 2c. For para encontrar el mejor lambda
for j = 1:5 %150
    lambda = 0.001+0.0667*(j-1);
    
    %Vector que es 1 para los valores 2 y 0 para los valores 9
    labels = ones(100,1);
    labels(101:200) = zeros(100,1);
    
    
    h_inicial = [0,0,0,0,1,0,0,0,0];
    w_inicial = ones(197,1);
    w_inicial = w_inicial/(length(w_inicial)-1);
    param = [h_inicial'; w_inicial]; %Vector con datos iniciales.
    
    %Punto 2a - Cálculo de Im
    Im = @(p) imfilter(images,p(1:9));
    
    %Punto 2a - Función de activación
    v = @(p) reshape(Im(p),196,200);
    suma = @(p) p(10) + v(p)'*p(11:end);
    y = @(p) 1./(1+exp(-suma(p)));
    
    %Punto 2b - Optimización para encontrar pesos y coeficientes h
    %Función objetivo
    fun = @(p) sum((labels-y(p)).^2) + lambda*(norm(p(1:9))^2 + norm(p(10:end))^2 );
    
    %Optimización
    w_opt = fminsearch(fun, param)
    
    %Se separa el vector óptimo obtenido en los pesos y h
    h_opt(1:9,1) = w_opt(1:9);
    w_opt2(1:length(w_opt)-9,1) = w_opt(10:length(w_opt));
    
    valor = []; %Este vectot almacernára los errores obtenidos
    error1 = 0; %Indica el número de errores de clasificación del 2
    error2 = 0; %Indica el número de errores de clasificación del 9
    for i = 1 : 200
        valor(i,1) = g(images(:,:,i),w_opt2',h_opt); %Se calcula el valor de cada dato
        
        %Se evalúa si se clasificó correctamente el número o no.
        if valor(i,1) >= 0.5 
            valor(i,1) = 1;
            if i <= 100 
                error1 = error1 + 1;
            end
        else
            valor(i,1) = 0;
            if i >= 101 
                error2 = error2 + 1;
            end
        end
    end
    
    %Gráfico del error
    figure(6)
    scatter(j,error1+error2);
    hold all
end


%% Nuevo cálculo de optimización pero ahora con valores óptimos y mayor tiempo

lambda = 6.4042;
labels = ones(100,1);
labels(101:200) = zeros(100,1);

h_inicial = [0,0,0,0,1,0,0,0,0];
w_inicial = ones(197,1);
w_inicial = w_inicial/(length(w_inicial)-1);
param = [h_inicial'; w_inicial];

Im = @(p) imfilter(images,p(1:9));
v = @(p) reshape(Im(p),196,200);
suma = @(p) p(10) + v(p)'*p(11:end);
y = @(p) 1./(1+exp(suma(p)));

fun = @(p) sum((labels-y(p)).^2) + lambda*(norm(p(1:9))^2 + norm(p(10:end))^2 );

%Opciones para el Fminsearch. La idea es obtener más iteraciones y mas
%funciones evaludadas que por Defecto.
opts = optimset('MaxFunEvals',80000, 'MaxIter',400000);
 
[w_opt,fval,exitflag,output] = fminsearch(fun, param,opts)

h_opt(1:9,1) = w_opt(1:9);
w_opt2(1:length(w_opt)-9,1) = w_opt(10:length(w_opt));

valor = [];
error1 = 0;
error1_indices = [];
error2 = 0;
error2_indices = [];
for i = 1 : 200
    valor(i,1) = g(images(:,:,i),w_opt2',h_opt);        
    if valor(i,1) >= 0.5
        valor(i,1) = 1;
        if i <= 100 
            error1 = error1 + 1;
            error1_indices(length(error1_indices)+1) = i;
        end
    else
        valor(i,1) = 0;
        if i >= 101 
            error2 = error2 + 1;
            error2_indices(length(error2_indices)+1) = i;
        end
    end
end

%Cálculo de errores
error1
error2
errorTotal = error1 + error2
porcentajeError = errorTotal/200

%% Punto 2D Grafico de números 2 mal clasificados
figure(7)
subplot(2,3,1)
imshow(images(:,:,23))
subplot(2,3,2)
imshow(images(:,:,33))
subplot(2,3,3)
imshow(images(:,:,39))
subplot(2,3,4)
imshow(images(:,:,64))
subplot(2,3,5)
imshow(images(:,:,76))
subplot(2,3,6)
imshow(images(:,:,82))
sgtitle('Ejemplos de imágenes en las que falló el algoritmo - Número 2')

%% Punto 2D Grafico de números 9 mal clasificados
figure(8)
subplot(2,3,1)
imshow(images(:,:,108))
subplot(2,3,2)
imshow(images(:,:,109))
subplot(2,3,3)
imshow(images(:,:,110))
subplot(2,3,4)
imshow(images(:,:,136))
subplot(2,3,5)
imshow(images(:,:,199))
sgtitle('Ejemplos de imágenes en las que falló el algoritmo - Número 9')

%% Punto 2D Grafico de números 2 bien clasificados
figure(9)
subplot(2,3,1)
imshow(images(:,:,1))
subplot(2,3,2)
imshow(images(:,:,7))
subplot(2,3,3)
imshow(images(:,:,68))
subplot(2,3,4)
imshow(images(:,:,30))
subplot(2,3,5)
imshow(images(:,:,50))
subplot(2,3,6)
imshow(images(:,:,80))
sgtitle('Ejemplos de imágenes en las que acertó el algoritmo - Número 2')

%% Punto 2D Grafico de números 9 bien clasificados
figure(10)
subplot(2,3,1)
imshow(images(:,:,103))
subplot(2,3,2)
imshow(images(:,:,112))
subplot(2,3,3)
imshow(images(:,:,134))
subplot(2,3,4)
imshow(images(:,:,145))
subplot(2,3,5)
imshow(images(:,:,169))
subplot(2,3,6)
imshow(images(:,:,190))
sgtitle('Ejemplo de imágenes en las que acertó el algoritmo - Número 9')

%% Punto 2D Grafico del filtro resultante e imagenes filtradas
h_opt_mat = reshape(h_opt,3,3);
figure(10)
bar3(abs(h_opt_mat))
title('Grafico de barras en 3D del filtro resultante')

figure(11)
subplot(2,3,1)
imshow(imfilter(images(:,:,1),h_opt_mat))
subplot(2,3,2)
imshow(imfilter(images(:,:,7),h_opt_mat))
subplot(2,3,3)
imshow(imfilter(images(:,:,68),h_opt_mat))
subplot(2,3,4)
imshow(imfilter(images(:,:,30),h_opt_mat))
subplot(2,3,5)
imshow(imfilter(images(:,:,50),h_opt_mat))
subplot(2,3,6)
imshow(imfilter(images(:,:,80),h_opt_mat))
sgtitle('Ejemplos de imágenes en las que acertó el algoritmo - Filtradas - Número 2')

figure(12)
subplot(2,3,1)
imshow(imfilter(images(:,:,103),h_opt_mat))
subplot(2,3,2)
imshow(imfilter(images(:,:,112),h_opt_mat))
subplot(2,3,3)
imshow(imfilter(images(:,:,134),h_opt_mat))
subplot(2,3,4)
imshow(imfilter(images(:,:,145),h_opt_mat))
subplot(2,3,5)
imshow(imfilter(images(:,:,169),h_opt_mat))
subplot(2,3,6)
imshow(imfilter(images(:,:,190),h_opt_mat))
sgtitle('Ejemplos de imágenes en las que acertó el algoritmo - Filtradas - Número 9')


%% Punto 2D Grafico de pesos en 3D

w_opt_mat = abs(reshape(w_opt2(2:end),14,14));
figure(13)
subplot(1,3,1)
bar3(abs(w_opt_mat))
subplot(1,3,2)
bar3(abs(w_opt_mat))
subplot(1,3,3)
bar3(abs(w_opt_mat))
sgtitle('Grafico de barras en 3D de los pesos resultantes')

figure(14)
imagesc(abs(w_opt_mat))
colorbar
title('Grafico en 2D de los pesos resultantes')


