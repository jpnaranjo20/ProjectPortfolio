function [ak]=a(k)
    % Esta función retorna el k-ésimo coeficiente de la serie de Fourier
    % de una señal x.
    
    % Se declara el periodo y frecuncia de la señal, así como la señal
    % misma.
    T=2;
    f=1/T;
    % duty = 50;
    x = @(t) 0.5*(square(2*pi*f*(t+0.5)) + 1);  
    T1=-0.5;
    T2=0.5;
    w0=2*pi/T;
    y = @(t) x(t).*exp(-1i*w0*k*t);
    
    %Se aplica la fórmula
    ak=(1/T)*integral(y,T1,T2);
end