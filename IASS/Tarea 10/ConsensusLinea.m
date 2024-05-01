% Esta funcion es la de consensus en linea ya listica
% Ya con este codigo, esta es la tarea mas facil de todas
% Att: Luis Felipe

function []=ConsensusLinea()
clc, clear all, close all;

%% --------- Establecer parametros
disp('Establecer parametros ...')
N = 5;       % Numero de agentes
dim = 2;     % Dimension del espacio donde estan los agentes
x0=randn(N*dim,1); % Condiciones iniciales
tspan = [0,36.5]; % Tiempo de las trayectorias


%% --------- Calcular trayectorias
disp('Calcular dinamicas de sistema multiagente ...')

% X: Trayectoria de los agentes
% T: tiempos por cada punto de trayectoria
[T,X]=ode45(@funcionConsensus, tspan, x0);
% Las primeras dos posiciones de X son las del primer agente, 
% las otras dos las del segundo, y asi...


%% --------- Plots
disp('Graficar trayectorias ...')
figure, 
subplot(1,2,1)
hold on
c='rgbky'; % Colores para pintar trayectorias
for i=1:N % Trayectoria por cada agente
    z = X(:,dim*(i-1)+1 : dim*i); % Posicion de agente i
    plot(z(:,1),z(:,2),[c(i) '--'])
    plot(z([1 end],1),z([1 end],2),[c(i) 'x'],'linewidth',3)
end
hold off;
xlabel('Dimension 1'), ylabel('Dimension 2')

subplot(1,2,2), hold on
for i=1:N % Trayectoria por cada agente
    z = X(:,dim*(i-1)+1 : dim*i); % Posicion de agente i
    plot(T,z(:,1),[c(i) '--']) % Graficar posicion x
    plot(T,z(:,2),[c(i) '--']) % Graficar posicion y
end
hold off;
xlabel('Tiempo'), ylabel('Posiciones x y')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [xdot] = funcionConsensus(t,x)
% Esta funcion calcula xdot = - gradiente(f), de tal manera
% que las trayectorias minimicen la funcion f


%% Obtener la posicion de cada agente
N = 5;       % Numero de agentes
dim = 2;     % Dimension del espacio donde estan los agentes

for i=1:N
    z(:,i)= x(dim*(i-1)+1 : dim*i); % Posicion de agente i
end

%% Calcular consensus por cada agent
% Topologia de comunicacion: linea

g(:,1)= -(z(:,1)-z(:,2)); % -grad(f) para agente 1
g(:,N)= -(z(:,N)-z(:,N-1)); % -grad(f) para agente N

for i=2:N-1
    % -grad(f) para agente i
    g(:,i)= -(z(:,i)-z(:,i-1))-(z(:,i)-z(:,i+1));
end

%% Devolver xdot
xdot = g(:);

