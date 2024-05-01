function [frec, Xmag]=espectro(x)

% Tama�o del vector x
N = length(x);

% Transformada de Fourier Discreta (calculada mediante FFT)
X = fft(x);

% Adecuaci�n del espectro generado (corrimiento e inversi�n)
X = fftshift(X);

% Magnitud de la transformada
Xmag = abs(X);

% Generar vector de frecuencia en hertz ( intervalo [-pi,pi] )
frec = linspace(-pi,pi,N);