function []=trayectoria_individual()
% Esta funcion calcula la trayectoria de un agente
% que esquiva un obstaculo y que quiere ir a un punto
% objetivo

close all;


% ode45(odefun, tspan, y0)   
% where tspan = [t0 tf], integrates the system of differential equations 
% y? = f(t,y) from t0 to tf with initial conditions y0. Each row in the solution
% array y corresponds to a value returned in column vector t.

[t,y] = ode45(@vectorField, [0,10], [0,0]');
% vectorField es la funcion que calcula -gradiente(f), donde
% f es la funcion que se quiere minimizar



%% Graficar  trayectoria y contorno de superficie
figure, hold on
x=linspace(-1,10);
[X1,X2]=meshgrid(x,x);
F=objectiveFunction(X1,X2);
contour(X1,X2,F,50)
plot(y(:,1),y(:,2))
plot(y(1,1),y(1,2),'x','LineWidth',2)
plot(y(end,1),y(end,2),'o','LineWidth',2)
hold off,


%----------------------------------------------
function [xdot]=vectorField(t,x)
% Contiene la función g(x), donde xdot=g(x)

a=1;
xb=[5,5]'; % Este es el punto objetivo de la trayectoria

% Estos son los parametros del objeto a esquivar
b=50;
s=1;
q=[1,2]';

% La expresion (x-xb) es la que hace que x se vaya hacia xb
% La expresion con la exp es la que pone el obstaculo a evitar 
xdot=-a*(x-xb)+(b/s^2)*(x-q)*exp(-(0.5/s^2)*norm(x-q)^2);


%----------------------------------------------
function [f]=objectiveFunction(x1,x2)
% Esta sirve para graficar los contornos de la superficie

a=1;
xb=[5,5]';

b=50;
s=1;
q=[1,2]';

f=a*((x1-xb(1)).^2+(x2-xb(2)).^2)+...
    b*exp(-(0.5/s^2)*((x1-q(1)).^2+(x2-q(2)).^2));
