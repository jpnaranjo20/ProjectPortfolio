function [frec, Xmag]=espectro(x,fs)

% Tamaño del vector x
N = length(x);

% Transformada de Fourier Discreta (calculada mediante FFT)
X = fft(x);

% Adecuación del espectro generado (corrimiento e inversión)
X = fftshift(X);

% Magnitud de la transformada
Xmag = abs(X);

% Generar vector de frecuencia en hertz ( intervalo [-fs/2,fs/2) )
frec = (-0.5:1/N:0.5-(1/N))*fs;

%Para verificar funcionamiento digite en el command window:
% >> fs=100;
% >> t=0:1/fs:1-(1/fs);
% >> x=sin(4*2*pi*t); %Senoidal de 4Hz muestreada a 100Hz
% >> [frec,Xmag]=espectro(x,fs);
% >> plot(frec,Xmag), xlabel('Frecuencia en Hertz')