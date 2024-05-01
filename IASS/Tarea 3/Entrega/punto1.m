%% Punto 1
%Se carga el audio
[x1, t1, fs1] = cargarAudio('borgesRuido.wav');
%Se calcula su espectro en frecuencia
[frec1, Xmag1] = espectro(x1, fs1);
%Se grafica la señal en tiempo y en frecuencia
figure(1)
subplot(2,1,1)
plot(t1, x1)
xlabel('Tiempo [s]')
ylabel('Señal')
subplot(2,1,2)
plot(frec1, Xmag1)
xlabel('Frecuencia [Hz]')
ylabel('Señal')
%%
%Se escucha la señal
soundsc(x1, fs1)
%%
%Se definen los parámetros para el filtro rechazabanda
N = 300; %Orden del filtro
wc1 = 2.8e3; %Corte de frecuencia inferior
wc2 = 3.2e3; %Corte de frecuencia superior

omega1 = (wc1/(fs1/2))*pi; %Definición omega para filtro 1 pasabajas
omega2 = (wc2/(fs1/2))*pi; %Definición omega para filtro 2 pasabajas
omega3 = pi; %Definición omega para filtro 3 pasabajas
bk1 = []; %Lista donde se guardan los bk del filtro 1
bk2 = []; %Lista donde se guardan los bk del filtro 2
bk3 = []; %Lista donde se guardan los bk del filtro 3

%Se calculan los bk para cada filtro
for i=0:N
    if i==(N/2)
        bk1(i+1) = omega1/pi;
        bk2(i+1) = omega2/pi;
        bk3(i+1) = omega3/pi;
    else
        bk1(i+1) = (sin(omega1*(i-(N/2)))/(pi*(i-(N/2))));
        bk2(i+1) = (sin(omega2*(i-(N/2)))/(pi*(i-(N/2))));
        bk3(i+1) = (sin(omega3*(i-(N/2)))/(pi*(i-(N/2))));
    end
end
%Se definen los bk para el filtro final (suma de filtro 1 y 3, resta
%filtro 2)
bk = bk1+bk3-bk2;
%Se definen los k en el rango seleccionado
k = 0:N;
%Grafica de los coeficientes bk en tiempo y frecuencia
figure(2)
stem(k, bk)
xlabel('n')
ylabel('Coeficiente')
title('Coeficientes del filtro')
figure(3)
[frecsF, XmagF] = espectro(bk, fs1);
plot(frecsF, XmagF)
xlabel('Frecuencia [Hz]')
ylabel('Magnitud')
title('Respuesta en frecuencia del filtro')
%%
%Rutina para ecuación de diferencias (señal filtrada)
y = []; %Variable para guardar resultado de la ecuación
for n=1:length(x1)
    suma = 0;
    for k=1:N+1
        if n-k>0
            suma = suma + bk(k)*x1(n-k);
        end
    end
    y(n) = suma;
end
%Cálculo espectro de frecuencia señal filtrada
[frecsY, Ymag] = espectro(y, fs1);
%Gráfica de señal filtrada en tiempo y en frecuencia
figure(4)
subplot(2,1,1)
plot(t1, y)
xlabel('Tiempo [s]')
ylabel('Señal de audio filtrada')
subplot(2,1,2)
plot(frecsY, Ymag)
xlabel('Frecuencia [Hz]')
ylabel('Señal de audio filtrada')
%%
%Se escucha la señal filtrada
soundsc(y, fs1)

