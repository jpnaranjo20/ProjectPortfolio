%% Literal a.
close all
clc
clear all

figure(1)
imshow('images/004_o_m_a_a.jpg')
load('landmarks/004_o_m_a_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(2)
imshow('images/004_o_m_d_a.jpg')
load('landmarks/004_o_m_d_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(3)
imshow('images/004_o_m_f_a.jpg')
load('landmarks/004_o_m_f_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(4)
imshow('images/004_o_m_h_a.jpg')
load('landmarks/004_o_m_h_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(5)
imshow('images/004_o_m_n_a.jpg')
load('landmarks/004_o_m_n_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(6)
imshow('images/004_o_m_s_a.jpg')
load('landmarks/004_o_m_s_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

%% Literal a.
close all
clc
clear all

figure(1)
imshow('images/005_o_f_a_a.jpg')
load('landmarks/005_o_f_a_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(2)
imshow('images/005_o_f_d_a.jpg')
load('landmarks/005_o_f_d_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(3)
imshow('images/005_o_f_f_b.jpg')
load('landmarks/005_o_f_f_b.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(4)
imshow('images/005_o_f_h_a.jpg')
load('landmarks/005_o_f_h_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(5)
imshow('images/005_o_f_n_a.jpg')
load('landmarks/005_o_f_n_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(6)
imshow('images/005_o_f_s_a.jpg')
load('landmarks/005_o_f_s_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

%% Literal a.
close all
clc
clear all

figure(1)
imshow('images/014_m_m_a_a.jpg')
load('landmarks/014_m_m_a_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(2)
imshow('images/014_m_m_d_a.jpg')
load('landmarks/014_m_m_d_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(3)
imshow('images/014_m_m_f_a.jpg')
load('landmarks/014_m_m_f_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(4)
imshow('images/014_m_m_h_a.jpg')
load('landmarks/014_m_m_h_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(5)
imshow('images/014_m_m_n_a.jpg')
load('landmarks/014_m_m_n_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

figure(6)
imshow('images/014_m_m_s_a.jpg')
load('landmarks/014_m_m_s_a.mat')
hold all
scatter(faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2))

%% Literal b y c
clc
clear all
close all
figure(1)
hold on
S = zeros(67,67);
primero = 1;
for i = 4:22 %Recorre los landmarks
    for j = 1:6 %Recorre cada uno de los archivos de los landmarks
        if i == 4
            letra1 = 'o';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
            
        elseif i == 5
            letra1 = 'o';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
                letra4 = 'b';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 6
            letra1 = 'm';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
                letra4 = 'b';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 7
            letra1 = 'm';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
            
        elseif i == 8
            letra1 = 'y';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 10
            letra1 = 'y';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 11
            letra1 = 'm';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 12
            letra1 = 'o';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 13
            letra1 = 'y';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 14
            letra1 = 'm';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 15
            letra1 = 'o';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 16
            letra1 = 'y';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 18
            letra1 = 'o';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 19
            letra1 = 'm';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'd';
            elseif j == 2
                letra3 = 'f';
            elseif j == 3
                letra3 = 'h';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 20
            letra1 = 'y';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'd';
            elseif j == 2
                letra3 = 'f';
                letra4 = 'b';
            elseif j == 3
                letra3 = 'h';
            elseif j == 4
                letra3 = 'n';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 21
            letra1 = 'o';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 22
            letra1 = 'y';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
                letra4 = 'b';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        end
        
        
        if i ~= 9 && i ~= 17
            if i~=19 || (i == 19 && j <= 3)
                if i~=20 || (i == 20 && j <= 4)
                    if i~=22 || (i == 22 && j <= 5)
                        if i < 10
                            texto = ['landmarks/00' int2str(i) '_' letra1 '_' letra2 '_' letra3 '_' letra4 '.mat'];

                        else
                            texto = ['landmarks/0' int2str(i) '_' letra1 '_' letra2 '_' letra3 '_' letra4 '.mat'];

                        end
                        load(texto) %Se carga el texto
                        
                        %Se grafican los landmarks sin ningún ajuste
                        figure(1)
                        scatter(faceCoordinatesUnwarped(:,1),-faceCoordinatesUnwarped(:,2),'.k')
                        title('Landmarks Originales')
                        hold on
                        
                        % Se guardan los datos de cada forma en dos
                        % vectores
                        
                        wr = faceCoordinatesUnwarped(:,1);
                        wc = faceCoordinatesUnwarped(:,2);
                        
                        % Se remueve la media de cada forma
                        wr = wr-sum(wr)/length(wr);
                        wc = wc-sum(wc)/length(wc);

                        figure(2)
                        scatter(wr,-wc,'.k')
                        title('Landmarks con media removida')
                        hold on
                        
                        % Se hace que la norma de cada forma sea 1
                        wr = wr/norm(wr);
                        wc = wc/norm(wc);
                        
                        figure(3)
                        scatter(wr,-wc,'.k')
                        title('Landmarks con norma igual a uno')
                        hold on
                        
                        %Se crea el vector complejo w
                        w = complex(wr,wc);
                        
                        %Se crea y guarda la matriz S
                        if primero == 1
                            S = w*w';
                            primero = 0;
                        else
                            S = S + w*w';
                        end
                    end
                end
            end
        end
    end
    
end

%% Se obtienen los valores y vectores propios de S para hallar muGorro
[V,D] = eig(S);
V;
D;

muGorro = V(:,67);

wr = real(muGorro);
wc = imag(muGorro);

figure(4)
scatter(wc,wr,'xr')
title('mu^{gorro}')
hold on

%% Se crea la figura asociada a muGorro pero unida automáticamente
figure(6)
plot(wc,wr)
title('mu^{gorro} - Cara asociada Unida Automáticamente')
hold on

%% Se crea la figura asociada a muGorro pero unida manualmente
figure(6)
plot(wc(1),wr(1),'xr')
title('mu^{gorro} - Cara Asociada Unida Manualmente')
hold on
aux=[];
aux2=[];
for i = 2:9
    aux(i-1) = wc(i);
    aux2(i-1) = wr(i);
end
aux(9) = wc(2);
aux2(9) = wr(2);

plot(aux,aux2,'r')
plot(aux,aux2,'xr')
hold on

plot(wc(10),wr(10),'xr')
hold on
aux=[];
aux2=[];
for i = 11:18
    aux(i-10) = wc(i);
    aux2(i-10) = wr(i);
end
aux(9) = wc(11);
aux2(9) = wr(11);

plot(aux,aux2,'r')
plot(aux,aux2,'xr')
hold on


aux=[];
aux2=[];
for i = 19:26
    aux(i-18) = wc(i);
    aux2(i-18) = wr(i);
end
aux(9) = wc(19);
aux2(9) = wr(19);

plot(aux,aux2,'r')
plot(aux,aux2,'xr')
hold on


aux=[];
aux2=[];
for i = 27:34
    aux(i-26) = wc(i);
    aux2(i-26) = wr(i);
end
aux(9) = wc(27);
aux2(9) = wr(27);

plot(aux,aux2,'r')
plot(aux,aux2,'xr')
hold on

aux=[];
aux2=[];

aux(1) = wc(35);
aux2(1) = wr(35);

aux(2) = wc(36);
aux2(2) = wr(36);

aux(3) = wc(37);
aux2(3) = wr(37);

aux(4) = wc(38);
aux2(4) = wr(38);

aux(5) = wc(35);
aux2(5) = wr(35);

for i = 39:49
    aux(i-33) = wc(i);
    aux2(i-33) = wr(i);
end
aux(17) = wc(35);
aux2(17) = wr(35);

plot(aux,aux2,'r')
plot(aux,aux2,'xr')
hold on


aux=[];
aux2=[];
for i = 50:57
    aux(i-49) = wc(i);
    aux2(i-49) = wr(i);
end
aux(9) = wc(50);
aux2(9) = wr(50);

plot(aux,aux2,'r')
plot(aux,aux2,'xr')
hold on


aux=[];
aux2=[];
for i = 58:63
    aux(i-57) = wc(i);
    aux2(i-57) = wr(i);
end
aux(7) = wc(58);
aux2(7) = wr(58);

plot(aux,aux2,'r')
plot(aux,aux2,'xr')
hold on

aux=[];
aux2=[];
for i = 64:67
    aux(i-63) = wc(i);
    aux2(i-63) = wr(i);
end
aux(5) = wc(64);
aux2(5) = wr(64);

plot(aux,aux2,'r')
plot(aux,aux2,'xr')
title('mu^{gorro} - Cara Asociada Unida Manualmente')
hold on

%% Dado que ya se tiene muGorro, se vuelvel a leer todos los landmarks y se les realiza el ajuste Procrustes
w1 = zeros(67,1);
for i = 4:22 %Recorre los landmarks
    for j = 1:6 %Recorre cada uno de los archivos de los landmarks
        if i == 4
            letra1 = 'o';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
            
        elseif i == 5
            letra1 = 'o';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
                letra4 = 'b';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 6
            letra1 = 'm';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
                letra4 = 'b';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 7
            letra1 = 'm';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
            
        elseif i == 8
            letra1 = 'y';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 10
            letra1 = 'y';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 11
            letra1 = 'm';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 12
            letra1 = 'o';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 13
            letra1 = 'y';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 14
            letra1 = 'm';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 15
            letra1 = 'o';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 16
            letra1 = 'y';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 18
            letra1 = 'o';
            letra2 = 'm';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 19
            letra1 = 'm';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'd';
            elseif j == 2
                letra3 = 'f';
            elseif j == 3
                letra3 = 'h';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 20
            letra1 = 'y';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'd';
            elseif j == 2
                letra3 = 'f';
                letra4 = 'b';
            elseif j == 3
                letra3 = 'h';
            elseif j == 4
                letra3 = 'n';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 21
            letra1 = 'o';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        elseif i == 22
            letra1 = 'y';
            letra2 = 'f';
            letra4 = 'a';
            if j == 1
                letra3 = 'a';
            elseif j == 2
                letra3 = 'd';
            elseif j == 3
                letra3 = 'f';
                letra4 = 'b';
            elseif j == 4
                letra3 = 'h';
            elseif j == 5
                letra3 = 'n';
            elseif j == 6
                letra3 = 's';
            end
        end
        
        
        if i ~= 9 && i ~= 17
            if i~=19 || (i == 19 && j <= 3)
                if i~=20 || (i == 20 && j <= 4)
                    if i~=22 || (i == 22 && j <= 5)
                        if i < 10
                            texto = ['landmarks/00' int2str(i) '_' letra1 '_' letra2 '_' letra3 '_' letra4 '.mat'];

                        else
                            texto = ['landmarks/0' int2str(i) '_' letra1 '_' letra2 '_' letra3 '_' letra4 '.mat'];

                        end
                        
                        load(texto)
                        
                        
                        wr = faceCoordinatesUnwarped(:,1);
                        wc = faceCoordinatesUnwarped(:,2);
                        
                        %Se quita la media de cada forma
                        wr = wr-sum(wr)/length(wr);
                        wc = wc-sum(wc)/length(wc);
                        
                        %Se asigna una norma de 1 a cada forma
                        wr = wr/norm(wr);
                        wc = wc/norm(wc);
                        
                        %Se crea el vector complejo w1
                        w1 = complex(wr,wc);
                        
                        %Se proyecta la forma w1 a la media de procrustes
                        wp = w1*((w1'*muGorro)/(w1'*w1));
                        
                        %Se separa el vector complejo wp en dos vectores
                        wr = real(wp);
                        wc = imag(wp);
                            
                        %Gráficos
                        figure(5)
                        scatter(wc,wr,'.k')
                        title('Landmarks proyectados a la media de procrustes')
                        hold on
                        
                        figure(6)
                        scatter(wc,wr,'.k')
                        title('Landmarks proyectados a la media de procrustes con mu^{gorro}')
                        hold on
                        
                    end
                end
            end
        end
    end
    
end