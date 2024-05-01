%% a)

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

%% b)

% NOTA PARA LA VIDA:
% Hacer vector', no solo transpone sino que también conjuga (!!!!)

% Número de landmarks
load('C:\Users\jpnar\OneDrive - Universidad de Los Andes\8vo Semestre\Señales 2\Tareas\Tarea 6\archivosSoporteTarea6\punto2\landmarks\004_o_m_a_a.mat')

k = 67;
S = zeros(k, k); 

[numcoords, coords] = size(faceCoordinatesUnwarped);
primero = 1;

for i=4:22 % Recorre los archivos de landmarks por número.
    for j=1:6 % Recorre los archivos de landmarks de cada número (hay 6 archivos por número (en la mayoría de los casos)).
        
        if i == 4
           letra1 = 'o'; 
           letra2 = 'm';  
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 5 
           letra1 = 'o';
           letra2 = 'f';
           letra4= 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
               letra4= 'b';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
        
        elseif i == 6
           letra1 = 'm';
           letra2 = 'f';
           letra4= 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
               letra4 = 'b';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
            
        elseif i == 7
           letra1 = 'm';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
            
        elseif i == 8 
           letra1 = 'y';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
            
        elseif i == 10    
           letra1 = 'y';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 11    
           letra1 = 'm';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 12    
           letra1 = 'o';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 13    
           letra1 = 'y';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 14
           letra1 = 'm';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 15
           letra1 = 'o';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 16    
           letra1 = 'y';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
        elseif i == 18    
           letra1 = 'o';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
        elseif i == 19  
           letra1 = 'm';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'd';
           elseif j==2
               letra3 = 'f';
           elseif j==3
               letra3 = 'h';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
        elseif i == 20
           letra1 = 'y';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'd';
           elseif j==2
               letra3 = 'f';
               letra4 = 'b';
           elseif j==3
               letra3 = 'h';
           elseif j==4
               letra3 = 'n';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 21            
           letra1 = 'o';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 22
           letra1 = 'y';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
               letra4 = 'b';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
        end
        
        % Hay que tener en cuenta que no todos están agrupados en grupos de
        % a 6. El 22 es un grupo de 5, el 20 es de 4, el 19 es de 3.
        % También hay que tener en cuenta que no hay grupos con número 9 ni
        % con número 17.
        
        if i ~= 9 && i ~= 17
            if i~=19 || (i == 19 && j <= 3) % Se pone lo de ~= para que igual avance cuando no esté en la fila 19.
               if i~=20 || (i == 20 && j <= 4)
                  if i~=22 || (i == 22 && j <= 5) 
                      
                      % Se define el nombre del archivo que se pretende
                      % cargar.
                      if i < 10
                          texto = ['landmarks/00' int2str(i) '_' letra1 '_' letra2 '_' letra3 '_' letra4 '.mat'];
                      else
                          texto = ['landmarks/0' int2str(i) '_' letra1 '_' letra2 '_' letra3 '_' letra4 '.mat'];
                      end
                      
                      load(texto)
                      
                      % Se grafican todos los landmarks sobre la misma
                      % figura (hay que poner las coordenadas y negativas
                      % para que la cara salga derecha.
                      figure(1)
                      scatter(faceCoordinatesUnwarped(:,1),-faceCoordinatesUnwarped(:,2),'.k')
                      title('Todos los landmarks')
                      xlabel('x')
                      ylabel('y')
                      hold on
                      
                      % Se guardan los datos de cada forma en dos
                      % vectores
                      wr = faceCoordinatesUnwarped(:,1);
                      wi = faceCoordinatesUnwarped(:,2);
                      
                      % Removemos la media de cada forma y graficamos
                      wr = wr-sum(wr)/length(wr);
                      wi = wi-sum(wi)/length(wi);
                      
                      figure(2)
                      scatter(wr,-wi,'.k')
                      title('Todos los landmarks con media removida')
                      hold on
                      
                      % Normalizamos los landmarks de cada forma (cara)
                      wr = wr/norm(wr);
                      wi = wi/norm(wi);
                      
                      % Aquí está como la forma total que se genera a
                      % partir de todas las anteriores.
                      figure(3)
                      scatter(wr,-wi,'.k')
                      title('Todos los landmarks normalizados')
                      hold on
                      
                      % Se crea el vector complejo w de la forma
                      % normalizada (que es la que vamos a tratar de
                      % alinear con la media de Procrustes).
                      w = complex(wr,wi);
                        
                      % Se crea y guarda la matriz S
                      if primero == 1
                          S = w*w';
                          primero = 0;
                      else
                          S = S + w*w'; % Se aplica la fórmula para encontrar la matriz S.
                      end
                  end
               end
            end
        end
        
    end
end

%% c) Ajuste de Procrustes

[V, D] = eig(S);

maximos = max(D);
indice = 0;

for i=1:length(maximos)
    if abs(maximos(i)) == abs(max(maximos))
        indice = i;
    end
end

% Media de Procrustes
mediaProc = V(:,indice);
coordsX = real(mediaProc);
coordsY = imag(mediaProc);

hold on
scatter(coordsY, -coordsX, 'xr')
title('Media de Procrustes')
xlabel('x')
ylabel('y')
hold on

% Se grafica la forma (cara) asociada a la media de Procrustes
figure(4)
plot(coordsY, -coordsX)
title('Cara asociada a la media de Procrustes')
hold on

%% 
% Ya que ya tenemos la media de Procrustes, vamos a realizarle el ajuste de
% Procrustes a todas las formas (conjuntos de landmarks) que teníamos al
% principio.

for i=4:22 % Recorre los archivos de landmarks por número.
    for j=1:6 % Recorre los archivos de landmarks de cada número (hay 6 archivos por número (en la mayoría de los casos)).
        
        if i == 4
           letra1 = 'o'; 
           letra2 = 'm';  
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 5 
           letra1 = 'o';
           letra2 = 'f';
           letra4= 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
               letra4= 'b';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
        
        elseif i == 6
           letra1 = 'm';
           letra2 = 'f';
           letra4= 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
               letra4 = 'b';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
            
        elseif i == 7
           letra1 = 'm';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
            
        elseif i == 8 
           letra1 = 'y';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
            
        elseif i == 10    
           letra1 = 'y';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 11    
           letra1 = 'm';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 12    
           letra1 = 'o';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 13    
           letra1 = 'y';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 14
           letra1 = 'm';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 15
           letra1 = 'o';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 16    
           letra1 = 'y';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
        elseif i == 18    
           letra1 = 'o';
           letra2 = 'm';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
        elseif i == 19  
           letra1 = 'm';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'd';
           elseif j==2
               letra3 = 'f';
           elseif j==3
               letra3 = 'h';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
        elseif i == 20
           letra1 = 'y';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'd';
           elseif j==2
               letra3 = 'f';
               letra4 = 'b';
           elseif j==3
               letra3 = 'h';
           elseif j==4
               letra3 = 'n';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 21            
           letra1 = 'o';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
           
        elseif i == 22
           letra1 = 'y';
           letra2 = 'f';
           letra4 = 'a';
           
           if j==1
               letra3 = 'a';
           elseif j==2
               letra3 = 'd';
           elseif j==3
               letra3 = 'f';
               letra4 = 'b';
           elseif j==4
               letra3 = 'h';
           elseif j==5
               letra3 = 'n';
           elseif j==6
               letra3 = 's';
           end
        end
        
        % Hay que tener en cuenta que no todos están agrupados en grupos de
        % a 6. El 22 es un grupo de 5, el 20 es de 4, el 19 es de 3.
        % También hay que tener en cuenta que no hay grupos con número 9 ni
        % con número 17.
        
        if i ~= 9 && i ~= 17
            if i~=19 || (i == 19 && j <= 3) % Se pone lo de ~= para que igual avance cuando no esté en la fila 19.
               if i~=20 || (i == 20 && j <= 4)
                  if i~=22 || (i == 22 && j <= 5) 
                      
                      % Se define el nombre del archivo que se pretende
                      % cargar.
                      if i < 10
                          texto = ['landmarks/00' int2str(i) '_' letra1 '_' letra2 '_' letra3 '_' letra4 '.mat'];
                      else
                          texto = ['landmarks/0' int2str(i) '_' letra1 '_' letra2 '_' letra3 '_' letra4 '.mat'];
                      end
                      
                      load(texto)
                      
                      
                      % Se guardan los datos de cada forma en dos
                      % vectores
                      wr = faceCoordinatesUnwarped(:,1);
                      wi = faceCoordinatesUnwarped(:,2);
                      
                      % Removemos la media de cada forma
                      wr = wr-sum(wr)/length(wr);
                      wi = wi-sum(wi)/length(wi);
                      
                      % Normalizamos los landmarks de cada forma (cara)
                      wr = wr/norm(wr);
                      wi = wi/norm(wi);
                      
                      % Se crea el vector complejo w de la forma
                      % normalizada (que es la que vamos a tratar de
                      % alinear con la media de Procrustes).
                      w1 = complex(wr,wi);
                      
                      % Proyectamos la forma w1 a la media de Procrustes
                      wp = w1*((w1'*mediaProc)/(w1'*w1)); 
                      
                      % Separamos parte real e imaginaria.
                      wpr = real(wp);
                      wpi = imag(wp);
                      
                      % Gráfica
                      figure(5)
                      scatter(wpi, -wpr,  '.k')
%                       scatter(wpr, wpi, '.k')
                      title('Landmarks proyectados a la media de Procrustes')
                      hold on
                      scatter(coordsY, -coordsX, 'xr')
                  end
               end
            end
        end
        
    end
end


