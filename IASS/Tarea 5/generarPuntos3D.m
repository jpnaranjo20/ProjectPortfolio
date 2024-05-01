clear all, close all, clc
% Generar esfera
[X,Y,Z] = sphere(16);
x = [0.5*X(:); 0.5*X(:)];
y = [0.5*Y(:); 0.5*Y(:)];
z = [0.5*Z(:); 0.5*Z(:)];
figure, scatter3(x,y,z,'filled'), grid on

% Generar helicoide
z = linspace(0,4*pi,250);
x = 2*cos(z) + rand(1,250);
y = 2*sin(z) + rand(1,250);
figure, scatter3(x,y,z,'filled'), grid on
view(-30,10)

