clear all, close all, clc
%% a) 

% Construir la malla de calibración física.

%% b)

% Se declaran los puntos 3D de la malla de calibración
P = [0 0 0 1;
     4 4 0 1; 
     1 5 0 1; 
     0 7 0 1; 
     6 3 0 1; 
     7 6 0 1; 
     5 7 0 1; 
     0 2 2 1; 
     0 6 3 1; 
     0 5 6 1; 
     0 2 6 1; 
     0 7 7 1; 
     7 0 7 1; 
     3 0 6 1; 
     5 0 4 1; 
     6 0 2 1;
     8 8 0 1];

% Se declaran las coordenadas de los píxeles correspondientes a cada punto
% 3D.
p = [643 528 1; 
     673 613 1; 
     826 593 1; 
     961 610 1; 
     535 624 1;
     648 716 1;
     808 697 1;
     727 447 1;
     928 424 1;
     892 241 1;
     746 239 1;
     1018 173 1;
     355 120 1;
     552 222 1;
     459 331 1;
     408 452 1;
     741 817 1];
 
% Inicialización de variables
[cantPuntos, cols] = size(P);
W = ones(2*cantPuntos, 12);
[filasW, colsW] = size(W);

% Se construye la matriz W de acuerdo a la forma estudiada en la teoría.
for i=1:filasW
    
    % Para filas impares
    if mod(i,2) ~= 0
        W(i,5:8) = zeros(1,4);
        % La cantidad de filas de W es diferente a la cantidad de filas de
        % P. La ventaja es que en cada 2 filas de W se usa el mismo valor
        % de P.
        if i > cantPuntos
            W(i,1:4) = P((i+1)/2,:);   
            W(i+1,5:8) = P((i+1)/2,:);
            W(i,9:12) =  -p((i+1)/2,1)*P((i+1)/2,:);
            W(i+1,9:12) = -p((i+1)/2,2)*P((i+1)/2,:);
        else
            W(i,1:4) = P(i,:);
            W(i+1,5:8) = P(i,:);
            W(i,9:12) = -p(i,1)*P(i,:);
            W(i+1,9:12) = -p(i,2)*P(i,:);
        end
    % Para filas pares
    else
        W(i,1:4) = zeros(1,4);
    end
    
end

% Se obtienen los valores y vectores propios de W^TW para resolver el
% problema de optimización, es decir, encontrar la matriz M que que mapea
% los puntos P  a los puntos p. 
[vectores, valores] = eig(transpose(W)*W);

% Variable para saber el índice del mínimo valor propio de W^TW
indice = 0;

% Vector con todos los valores propios de W^TW
vps = diag(valores);

% Se determina el índice del valor propio mínimo.
for i=1:length(diag(valores))
   if vps(i) == min(diag(valores))
       indice = i;
   end
end

% Se usa el índice encontrado previamente para hallar su correspondiente
% vector propio, que corresponde a la solución del problema de
% optimización.
m = vectores(:,indice);

% Esta es la matriz de calibración.
M = [transpose(m(1:4));
     transpose(m(5:8));
     transpose(m(9:12));];
 
m1 = M(1,:);
m2 = M(2,:);
m3 = M(3,:);

%% c)

% Un contador
c = 1;

% El valor 217 se obtuvo primero haciendo el recorrido de abajo y mirando
% cuántos puntos cumplían con la condición de estar en alguno de los planos
% de la malla de calibración. 
indicesi = zeros(217,1);
indicesj = zeros(217,1);
indicesk = zeros(217,1);

% Se grafican solo los puntos de la malla de calibración que están en
% alguno de los planos. Se guardan estos puntos para poder usarlos luego al
% momento de hacer la proyección.
for i=0:8
    for j=0:8
        for k=0:8 
            hold on
            if i==0 || j==0 || k ==0
                scatter3(i,j,k,'x','b');
                indicesi(c) = i;
                indicesj(c) = j;
                indicesk(c) = k;
                c = c + 1;
            end
        end
    end
end

grid on
xlabel('x')
ylabel('y')
zlabel('z')

% Se construye la malla virtual concatenando los vectores encontrados
% previamente con un vector columna de unos.
mallaVirtual = [indicesi indicesj indicesk ones(length(indicesi),1)];


%% d)

% Se declaran los puntos proyectados.
proy = zeros(length(mallaVirtual),3);

% Se aplica la fórmula de proyección para cada punto, usando la matriz M
% encontrada previamente.
for i=1:length(mallaVirtual)
   zpr = dot(m3, mallaVirtual(i,:));
   proy(i,:) = (1/zpr)*M*transpose(mallaVirtual(i,:));
end

% Se muestra el resultado de la calibración.
figure
imshow('malla.jpeg')
hold on
scatter3(proy(:,1), proy(:,2), proy(:,3), 'filled')


%% e)

% Solo es tomarse la foto 

%% f)

% Generar esfera
[X,Y,Z] = sphere(16);
x = [5*X(:); 5*X(:)];
y = [5*Y(:); 5*Y(:)];
z = [5*Z(:); 5*Z(:)];
esfera = [x y z ones(length(x),1)];

%% g)

% Se va a agregar un offset a la esfera para compensar por la posición de
% la mano en la foto.
esferaTrasladada = esfera;

% Se agrega dicho offset a las coordenadas x, y de los puntos de la esfera.
for i=1:length(x)
    for j=1:length(x)
        if j==1
            esferaTrasladada(i,j) = esferaTrasladada(i,j) - 30;
        elseif j==2
            esferaTrasladada(i,j) = esferaTrasladada(i,j) - 30;
        end
    end
end

% Se declaran los puntos proyectados.
proy2 = zeros(length(esferaTrasladada),3);

% Se aplica la fórmula de proyección para cada punto, usando la matriz M
% encontrada previamente.
for i=1:length(x)
   zpr = dot(m3, esferaTrasladada(i,:));
   proy2(i,:) = (1/zpr)*M*transpose(esferaTrasladada(i,:));
end

% Se muestra el resultado.
figure
imshow('mano.jpeg')
hold on
scatter3(proy2(:,1), proy2(:,2), proy2(:,3), '^')


%% h)

% Se repite todo el proceso anterior pero ahora solo tomando los valores
% del plano xz.

P2 = [0 0 0 1;
     0 2 2 1; 
     0 6 3 1; 
     0 5 6 1; 
     0 2 6 1; 
     0 7 7 1;
     0 7 0 1;];
 
p2 = [643 528 1;
     727 447 1;
     928 424 1;
     892 241 1;
     746 239 1;
     1018 173 1;
     961 610 1;];
 
[cantPuntos2, cols2] = size(P2);
W2 = ones(2*cantPuntos2, 12);
[filasW2, colsW2] = size(W2);

for i=1:filasW2
    
    if mod(i,2) ~= 0
        W2(i,5:8) = zeros(1,4);
        if i > cantPuntos2
            W2(i,1:4) = P2((i+1)/2,:);   
            W2(i+1,5:8) = P2((i+1)/2,:);
            W2(i,9:12) =  -p2((i+1)/2,1)*P2((i+1)/2,:);
            W2(i+1,9:12) = -p2((i+1)/2,2)*P2((i+1)/2,:);
        else
            W2(i,1:4) = P2(i,:);
            W2(i+1,5:8) = P2(i,:);
            W2(i,9:12) = -p2(i,1)*P2(i,:);
            W2(i+1,9:12) = -p2(i,2)*P2(i,:);
        end
    else
        W2(i,1:4) = zeros(1,4);
    end
    
end

[vectores2, valores2] = eig(transpose(W2)*W2);

indice2 = 0;
vps2 = diag(valores2);

for i=1:length(diag(valores2))
   if vps2(i) == min(diag(valores2))
       indice2 = i;
   end
end

mm2 = vectores2(:,indice2);

M2 = [transpose(mm2(1:4));
     transpose(mm2(5:8));
     transpose(mm2(9:12));];
 
m12 = M2(1,:);
m22 = M2(2,:);
m32 = M2(3,:);

proy3 = zeros(length(mallaVirtual),3);

for i=1:length(mallaVirtual)
   zpr2 = dot(m32, mallaVirtual(i,:));
   proy3(i,:) = (1/zpr2)*M2*transpose(mallaVirtual(i,:));
end

% Se muestra el resultado de la calibración solo usando puntos del plano
% xz. Solo se deben ver los puntos de dicho plano y el resto se ven en la
% esquina superior izquierda (tal vez toque hacerle un poco de zoom out a
% la foto generada).
figure
imshow('malla.jpeg')
hold on
scatter3(proy3(:,1), proy3(:,2), proy3(:,3), 'filled')

