function [x,tiempo,fs] = cargarAudio(filename)
% cargarAudio.m hace la lectura del archivo de audio FILENAME, y devuelve la
% señal de entrada, tiempo y frecuencia de muestreo.
% Ejemplo: 
% >> [x,tiempo,fs]=cargarAudio('borges.wav');
% >> plot(tiempo,x), xlabel('Tiempo')

[x,fs]=audioread(filename);
x = sum(x, 2) / size(x, 2);
x=x';
tiempo = 0: 1/fs : (length(x)/fs) - (1/fs);