%% Punto 1

clc, clear all, close all;

%% Topolog�a Anillo

disp('Establecer parametros topolog�a anillo...')
N = 4;       % Numero de agentes
dim = 2;     % Dimensi�n del espacio donde estan los agentes
x0 = [0;0;2;1;1;1;3;0]; % Condiciones iniciales
tspan = [0,36.5]; % Tiempo [s] de las trayectorias

disp('Calcular dinamicas de sistema multiagente ...')

% X1: Trayectoria de los agentes
% T1: tiempos por cada punto de trayectoria
[T1, X1] = ode45(@funcionConsensusAnillo, tspan, x0);
% Las primeras dos posiciones de X1 son las del primer agente, 
% las otras dos las del segundo, y asi...

disp('Graficar trayectorias topolog�a anillo...')
figure, 
subplot(1,2,1)
hold on, grid on
c='rgbky'; % Colores para pintar trayectorias
for i=1:N % Trayectoria por cada agente
    z = X1(:,dim*(i-1)+1 : dim*i); % Posicion de agente i
    plot(z(:,1),z(:,2),[c(i) '--'])
    plot(z([1 end],1),z([1 end],2),[c(i) 'x'],'linewidth',3)
end
hold off;
xlabel('x'), ylabel('y'), title('Topolog�a Anillo')
legend({'Agente 1', '', 'Agente 2', '', 'Agente 3', '', 'Agente 4', ''})


subplot(1,2,2), hold on, grid on
for i=1:N % Trayectoria por cada agente
    z = X1(:,dim*(i-1)+1 : dim*i); % Posicion de agente i
    plot(T1,z(:,1),[c(i) '--']) % Graficar posicion x
    plot(T1,z(:,2),c(i)) % Graficar posicion y
end
hold off;
xlabel('Tiempo [s]'), ylabel('Posiciones x y'), title('Topolog�a Anillo')
legend({'x-Agente 1', 'y-Agente 1', 'x-Agente 2', 'y-Agente 2', 'x-Agente 3', 'y-Agente 3', 'x-Agente 4', 'y-Agente 4'})


%% Topolog�a L�nea

disp('Establecer parametros topolog�a l�nea...')
N = 4;       % Numero de agentes
dim = 2;     % Dimensi�n del espacio donde estan los agentes
x0 = [0;0;2;1;1;1;3;0]; % Condiciones iniciales
tspan = [0,36.5]; % Tiempo [s] de las trayectorias

disp('Calcular dinamicas de sistema multiagente ...')

% X: Trayectoria de los agentes
% T: tiempos por cada punto de trayectoria
[T2, X2] = ode45(@funcionConsensusLinea, tspan, x0);
% Las primeras dos posiciones de X son las del primer agente, 
% las otras dos las del segundo, y asi...

disp('Graficar trayectorias topolog�a l�nea...')
figure, 
title('Topolog�a L�nea')
subplot(1,2,1)
hold on, grid on
c='rgbky'; % Colores para pintar trayectorias
for i=1:N % Trayectoria por cada agente
    z = X2(:,dim*(i-1)+1 : dim*i); % Posicion de agente i
    plot(z(:,1),z(:,2),[c(i) '--'])
    plot(z([1 end],1),z([1 end],2),[c(i) 'x'],'linewidth',3)
end
hold off;
xlabel('x'), ylabel('y'), title('Topolog�a L�nea')
legend({'Agente 1', '', 'Agente 2', '', 'Agente 3', '', 'Agente 4', ''})

subplot(1,2,2), hold on, grid on
for i=1:N % Trayectoria por cada agente
    z = X2(:,dim*(i-1)+1 : dim*i); % Posicion de agente i
    plot(T2,z(:,1),[c(i) '--']) % Graficar posicion x
    plot(T2,z(:,2),c(i)) % Graficar posicion y
end
hold off;
xlabel('Tiempo [s]'), ylabel('Posiciones x y'), title('Topolog�a L�nea')
legend({'x-Agente 1', 'y-Agente 1', 'x-Agente 2', 'y-Agente 2', 'x-Agente 3', 'y-Agente 3', 'x-Agente 4', 'y-Agente 4'})

%% Topolog�a Estrella

disp('Establecer parametros topolog�a estrella...')
N = 4;       % Numero de agentes
dim = 2;     % Dimensi�n del espacio donde estan los agentes
x0 = [0;0;2;1;1;1;3;0]; % Condiciones iniciales
tspan = [0,36.5]; % Tiempo [s] de las trayectorias

disp('Calcular dinamicas de sistema multiagente ...')

% X: Trayectoria de los agentes
% T: tiempos por cada punto de trayectoria
[T3, X3] = ode45(@funcionConsensusEstrella, tspan, x0);
% Las primeras dos posiciones de X son las del primer agente, 
% las otras dos las del segundo, y asi...

disp('Graficar trayectorias topolog�a estrella...')
figure, 
title('Topolog�a Estrella')
subplot(1,2,1)
hold on
grid on
c='rgbky'; % Colores para pintar trayectorias
for i=1:N % Trayectoria por cada agente
    z = X3(:,dim*(i-1)+1 : dim*i); % Posicion de agente i
    plot(z(:,1),z(:,2),[c(i) '--'])
    plot(z([1 end],1),z([1 end],2),[c(i) 'x'],'linewidth',3)
end
hold off;
xlabel('x'), ylabel('y'), title('Topolog�a Estrella')
legend({'Agente 1', '', 'Agente 2', '', 'Agente 3', '', 'Agente 4', ''})

subplot(1,2,2), hold on, grid on
for i=1:N % Trayectoria por cada agente
    z = X3(:,dim*(i-1)+1 : dim*i); % Posicion de agente i
    plot(T3,z(:,1),[c(i) '--']) % Graficar posicion x
    plot(T3,z(:,2),c(i)) % Graficar posicion y
end
hold off;
xlabel('Tiempo [s]'), ylabel('Posiciones x y'), title('Topolog�a Estrella')
legend({'x-Agente 1', 'y-Agente 1', 'x-Agente 2', 'y-Agente 2', 'x-Agente 3', 'y-Agente 3', 'x-Agente 4', 'y-Agente 4'})

%% FUNCIONES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [xdot] = funcionConsensusAnillo(t,x)
% Esta funcion calcula xdot = - gradiente(f), de tal manera
% que las trayectorias minimicen la funcion f


% Obtener la posicion de cada agente
N = 4;       % Numero de agentes
dim = 2;     % Dimensi�n del espacio donde estan los agentes

for i=1:N
    z(:,i)= x(dim*(i-1)+1 : dim*i); % Posicion de agente i
end

% Calcular consensus por cada agente
% Topologia de comunicacion: anillo

for i=1:N
    if i == 1
        g(:,i) = (z(:,i+1) - z(:,i)) + (z(:,i+2) - z(:,i));
    elseif i == 2
        g(:,i) = (z(:,i-1) - z(:,i)) + (z(:,i+2) - z(:,i)); 
    elseif i == 3
        g(:,i) = (z(:,i-2) - z(:,i)) + (z(:,i+1) - z(:,i));
    elseif i == N
        g(:,i) = (z(:,i-2) - z(:,i)) + (z(:,i-1) - z(:,i));
    end
end

% Devolver xdot
xdot = g(:);
end

function [xdot] = funcionConsensusLinea(t,x)
% Esta funcion calcula xdot = - gradiente(f), de tal manera
% que las trayectorias minimicen la funcion f


% Obtener la posicion de cada agente
N = 4;       % Numero de agentes
dim = 2;     % Dimensi�n del espacio donde estan los agentes

for i=1:N
    z(:,i)= x(dim*(i-1)+1 : dim*i); % Posicion de agente i
end

% Calcular consensus por cada agent
% Topologia de comunicacion: linea

g(:,1)= -(z(:,1)-z(:,2)); % -grad(f) para agente 1
g(:,N)= -(z(:,N)-z(:,N-1)); % -grad(f) para agente N

for i=2:N-1
    % -grad(f) para agente i
    g(:,i)= -(z(:,i)-z(:,i-1))-(z(:,i)-z(:,i+1));
end

% Devolver xdot
xdot = g(:);
end

function [xdot] = funcionConsensusEstrella(t,x)
% Esta funcion calcula xdot = - gradiente(f), de tal manera
% que las trayectorias minimicen la funcion f


% Obtener la posicion de cada agente
N = 4;       % Numero de agentes
dim = 2;     % Dimensi�n del espacio donde estan los agentes

for i=1:N
    z(:,i)= x(dim*(i-1)+1 : dim*i); % Posicion de agente i
end

% Calcular consensus por cada agent
% Topologia de comunicacion: linea

g(:,1)= (z(:,2) - z(:,1)) + (z(:,3) - z(:,1)) + (z(:,4) - z(:,1)); % -grad(f) para agente 1

for i=2:N
    % -grad(f) para agente i
    g(:,i)= (z(:,1)-z(:,i));
end

% Devolver xdot
xdot = g(:);
end