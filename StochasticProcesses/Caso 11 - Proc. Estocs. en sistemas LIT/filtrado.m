clc, clear all, close all;

t = linspace(-5,10,1000);
x = 0.25*randn(size(t)); % Señal de entrada

M = 10; % Cantidad de coeficientes del filtro
h = (1/M)*ones(1,M); % Respuesta al impulso del filtro
y = filter(h,1,x);  % Señal filtrada


% Graficar señales
figure, hold on, grid on
plot(t,x)
plot(t,y,'linewidth',2)
legend('Señal de entrada','Señal filtrada')
xlabel('Tiempo discreto')

%%
clc, clear all, close all;

t = linspace(-5,10,1000);
x = 0.25*randn(size(t)); % Señal de entrada

emes = [1, 5, 10, 100];

for i=1:length(emes)
    M = emes(i);
    
    h = (1/M)*ones(1,M); % Respuesta al impulso del filtro
    y = filter(h,1,x);  % Señal filtrada

    % Graficar señales
    subplot(2,2,i)
    plot(t,x)
    hold on
    plot(t,y,'linewidth',2)
    grid on
    legend('Señal de entrada','Señal filtrada')
    xlabel('Tiempo discreto')
    title(['Filtro FIR con M=', num2str(M)])
   
end

