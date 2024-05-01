%% Punto 1
%Carga la señal de audio
[x1, t1, fs1] = cargarAudio('borges.wav');
%Calcula espectro en frecuencia de la señal de audio
[frec1, Xmag1] = espectro(x1, fs1);
%Graficar espectro en frecuencia
figure(1)
plot(frec1, Xmag1)
title('Espectro de frecuencia de la señal de audio')
ylabel('Magnitud en frecuencia')
xlabel('Frecuencia (Hz)')

%Calcula espectro en frecuencia de la señal con frecuencia de muestreo 10kHz
[frec11, Xmag11] = espectro(x1, 10e3);
%Calcula espectro en frecuencia de la señal con frecuencia de muestreo 20kHz
[frec12, Xmag12] = espectro(x1, 20e3);
%Calcula espectro en frecuencia de la señal con frecuencia de muestreo 6kHz
[frec13, Xmag13] = espectro(x1, 6e3);

%%Graficar espectro en frecuencia con diferentes frecuencias de muestreo
figure(2)
subplot(1,3,1)
plot(frec11, Xmag11)
xlim([-10e3 10e3])
title('Espectro de frecuencia con fs=10KHz')
ylabel('Magnitud en frecuencia')
xlabel('Frecuencia (Hz)')
subplot(1,3,2)
plot(frec12, Xmag12)
xlim([-10e3 10e3])
title('Espectro de frecuencia con fs=20KHz')
ylabel('Magnitud en frecuencia')
xlabel('Frecuencia (Hz)')
subplot(1,3,3)
plot(frec13, Xmag13)
xlim([-10e3 10e3])
title('Espectro de frecuencia con fs=6KHz')
ylabel('Magnitud en frecuencia')
xlabel('Frecuencia (Hz)')
%%
%Función para escuchar audios con diferentes frecuencias de muestreo
% soundsc(x1,fs1)
soundsc(x1,6e3)
% soundsc(x1,10e3)
%soundsc(x1,20e3)