%% Caso de estudio 2 
% Gabriel Mejia
% Maria Fernanda Martinez
% Juan Pablo Naranjo

%% Optimizacion punto 2
clear;
clc;

%Funcion a minimizar
objective = @(x) sum(x.^2);

% Rangos especificos delos Pi's
lb = zeros(1,10);
ub = ones(1,10);

%Parametros necesarios para la funcion fmincon
A = [];
b = [];
% Introduccion de la restriccion E[X] = 5
Aeq = ones(1,10);
beq = 5;

% Iteracion inicial
x0 = 0.9*ones(1,10);

x_opt = fmincon(objective, x0, A, b, Aeq, beq, lb, ub);
disp(x_opt);

%% Punto 3.a 

% La definicion de todas las PMFs se encuentra al final del archivo

% Hacer set de interpretador en las graficas
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
set(0,'defaulttextInterpreter','latex');


% Figura de Bernoulli
x = 0:1;
p = [0.2, 0.4, 0.6, 0.8];
figure;
for i = 1:4
    subplot(2,2,i)
    stem(x,bernoulli_gab(x,p(i)))
    xlim([-1,2]);
    plotFormat('$x$', '$P_X(x)$',"$p="+num2str(p(i))+"$");
end

% Figura de Binomial
k = {1:10, 1:20, 1:40};
p = [0.2, 0.4, 0.6, 0.8];
n = [10, 20, 40];
figure;
for i = 1:3
    for j = 1:4
        subplot(3,4,(i-1)*4+j)
        stem(k{i},binomial_gab(k{i},n(i),p(j)))
        plotFormat('$x$', '$P_X(x)$',"$n ="+num2str(n(i))+",~p="+num2str(p(j))+"$");
    end
end

% Figura de geometrica
k = 0:20;
p = [0.2, 0.4, 0.6, 0.8];
figure;
for i = 1:4
    subplot(2,2,i)
    stem(k,geometric_gab(k,p(i)))
    plotFormat('$x$', '$P_X(x)$',"$p="+num2str(p(i))+"$");
end


% Figura de poisson
k = 0:20;
l = [1, 2, 4, 8];
figure;
for i = 1:4
    subplot(2,2,i)
    stem(k,poisson_gab(k,l(i)))
    plotFormat('$x$', '$P_X(x)$',"$l="+num2str(l(i))+"$");
end

%% Punto 3.b
% Lectura de los datos
fileID = fopen('dataCaso2.txt','r');
formatSpec = '%f';
dat = fscanf(fileID,formatSpec);
fclose(fileID);

% Encontrar los datos unicos en el archivo
vals = unique(dat);
% Declarar la matriz de frecuencias
frec = zeros(1,length(vals));

% Contar las frecuencias de cada aparicion
for i = 1:length(vals)
    frec(i) = sum(dat == vals(i));
end

% Normalizar frecuencias
frec = frec/length(dat);

% Hacer plot
stem(vals, frec)
hold on
stem(vals, poisson_gab(vals,15));
plotFormat('$x$', '$P_X(x)$',"Ajuste de datos manual");
legend("Datos", "Poisson, $\lambda=15$", 'fontsize', 12);

%% %%%% Funciones de probabilidad %%%%%%%%%

% pmf de bernoulli
function pmf = bernoulli_gab(x,p)
    for i = 1:length(x)
        if x(i) == 1
            pmf(i) = p;
        else
            if x(i) == 0
                pmf(i) = 1-p;
            else
                pmf(i) = -1;
            end
        end
    end
end

% pmf binomial
function pmf = binomial_gab(k, n, p)
    for i = 1:length(k)
        pmf(i) = nchoosek(n,k(i))*p.^(k(i)).*(1-p).^(n-k(i));
    end
end

%pmf geometrica
function pmf = geometric_gab(k,p)
    pmf = p*(1-p).^k;
end

%pmf piosson
function pmf = poisson_gab(k,l)
    for i = 1:length(k)
        pmf(i) = exp(-l)*l.^k(i)/factorial(k(i));
    end
end

% Funcion de formatos de grafica
function plotFormat(xlab, ylab, tit)
    xlabel(xlab, 'Fontsize', 19);
    ylabel(ylab, 'Fontsize', 19);
    title(tit, 'Fontsize', 21);
    grid on;
end