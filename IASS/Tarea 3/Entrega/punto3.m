%% Punto 3
[x,tiempo,fs]=cargarAudio('codificado.wav');
[frec,Xmag]=espectro(x,fs);

figure(1)
plot(tiempo,x)
title('Señal Codificada - Tiempo')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')

figure(2)
plot(frec,Xmag)
title('Señal Codificada - Espectro de Frecuencia')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')

%% Mensaje 1 (Frecuencias menores a 10kHz)
[x,tiempo,fs]=cargarAudio('codificado.wav');
[frec,Xmag]=espectro(x,fs);


% FILTRO PASABAJAS
fc1 = 10000; %frecuencia de corte

Oc1 = fc1 / (fs/2) * pi; %Omega_c
N = 300; %Orden del filtro
cont = 0; %Contador que se encarga de asignar el índice de bk1

%En este for se obtienen los valores para los b_k de un filtro pasabajas
for k = 0 : N
    if k == N/2
        cont = cont + 1;
        bk1(cont) = Oc1/pi;
    else
        cont = cont + 1;
        aux = k - N/2;
        bk1(cont) = sin(Oc1*aux) / (pi*aux);
        
    end
end

%Se aplica la ecuación de diferencias con una ventana móvil k:N
for n = 1: length(x)
        y(n) = 0;
        for k = 1:N+1
            if n-k > 0
                y(n) = y(n) + bk1(k)*x(n-k);
            else
                y(n) = y(n) + 0;
            end
        end
end


figure(1)
[frec,Xmag]=espectro(y,fs);
plot(tiempo,y)
title('Señal con Filtro Pasabajas - Tiempo')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')

figure(2)
plot(frec,Xmag)
title('Señal con Filtro Pasabajas - Espectro de Frecuencia')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')


% MULTIPLICACIÓN POR COSENO
g = y.*cos(5000*2*pi*tiempo); %Se multiplica por el coseno con el fin de demodular la señal
[frec1,Xmag1]=espectro(g,fs);
figure(3)
plot(tiempo,g)
title('Señal(5kHz) por Coseno(5kHz t) - tiempo')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')

figure(4)
plot(frec1,Xmag1)
title('Señal(5kHz) por Coseno(5kHz t) - Espectro de Frecuencia')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')


% FILTRO PASABAJAS
fc1 = 5000; %Frecuencia de Corte
Oc1 = fc1 / (fs/2) * pi; %Omega_c
N = 300; %Orden del filtro
cont = 0; %Contador que se encarga de asignar el índice de bk1

%En este for se obtienen los valores para los b_k de un filtro pasabajas
for k = 0 : N
    if k == N/2
        cont = cont + 1;
        bk1(cont) = Oc1/pi;
    else
        cont = cont + 1;
        aux = k - N/2;
        bk1(cont) = sin(Oc1*aux) / (pi*aux);
        
    end
end

%Se aplica la ecuación de diferencias con una ventana móvil k:N
for n = 1: length(x)
        ys(n) = 0;
        for k = 1:N+1
            if n-k > 0
                ys(n) = ys(n) + bk1(k)*g(n-k);
            else
                ys(n) = ys(n) + 0;
            end
            
        end
end



figure(5)
[frecS,XmagS]=espectro(ys,fs);
plot(tiempo,ys)
title('Señal(5kHz) por Coseno y con Filtro Pasabajas - Tiempo')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')


figure(6)
plot(frecS,XmagS)
title('Señal(5kHz) por Coseno y con Filtro Pasabajas - Espectro de Frecuencia')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')

soundsc(ys,fs)

%% Mensaje 2 (Frecuencias mayores a 10kHz)
[x,tiempo,fs]=cargarAudio('codificado.wav');
[frec,Xmag]=espectro(x,fs);


% FILTRO PASA ALTAS
fc1 = 10000; %Frecuencia de corte
fcpi = fs/2; %Frecuencia de corte máximo

Oc1 = fc1 / (fs/2) * pi; %Omega_c
Ocpi = fcpi / (fs/2) * pi; %Omega_pi
N = 300; %Orden del filtro
cont = 0; %Contador que se encarga de asignar el índice de bk1 y bkpi

%En este for se obtienen los valores para los b_k de un filtro pasa altas
for k = 0 : N
    if k == N/2
        cont = cont + 1;
        bk1(cont) = Oc1/pi;
        bkpi(cont) = Ocpi/pi;
    else
        cont = cont + 1;
        aux = k - N/2;
        bk1(cont) = sin(Oc1*aux) / (pi*aux);
        bkpi(cont) = sin(Ocpi*aux) / (pi*aux);
    end
    
    bk(cont) = bkpi(cont) - bk1(cont);
end

%Se aplica la ecuación de diferencias con una ventana móvil k:N
for n = 1: length(x)
        y(n) = 0;
        for k = 1:N+1
            if n-k > 0
                y(n) = y(n) + bk(k)*x(n-k);
            else
                y(n) = y(n) + 0;
            end
        end
end


figure(1)
[frec,Xmag]=espectro(y,fs);
plot(tiempo,y)
title('Señal con Filtro Pasa Altas - Tiempo')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')

figure(2)
plot(frec,Xmag)
title('Señal con Filtro Pasa Altas - Espectro de Frecuencia')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')



% MULTIPLICACIÓN POR COSENO
g = y.*cos(15000*2*pi*tiempo); %Se multiplica por el coseno con el fin de demodular la señal
[frec1,Xmag1]=espectro(g,fs);
figure(3)
plot(tiempo,g)
title('Señal(15kHz) por Coseno(15kHz t) - tiempo')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')

figure(4)
plot(frec1,Xmag1)
title('Señal(15kHz) por Coseno(15kHz t) - Espectro de Frecuencia')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')


% FILTRO PASABAJAS
fc1 = 5000; %Frecuencia de corte
Oc1 = fc1 / (fs/2) * pi; %Omega_c
N = 300; %Orden del filtro
cont = 0; %Contador que se encarga de asignar el índice de bk1

%En este for se obtienen los valores para los b_k de un filtro pasabajas
for k = 0 : N
    if k == N/2
        cont = cont + 1;
        bk1(cont) = Oc1/pi;
    else
        cont = cont + 1;
        aux = k - N/2;
        bk1(cont) = sin(Oc1*aux) / (pi*aux);
        
    end
end

%Se aplica la ecuación de diferencias con una ventana móvil k:N
for n = 1: length(x)
        ys(n) = 0;
        for k = 1:N+1
            if n-k > 0
                ys(n) = ys(n) + bk1(k)*g(n-k);
            else
                ys(n) = ys(n) + 0;
            end
            
        end
end



figure(5)
[frecS,XmagS]=espectro(ys,fs);
plot(tiempo,ys)
title('Señal(15kHz) por Coseno y con Filtro Pasabajas - Tiempo')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')


figure(6)
plot(frecS,XmagS)
title('Señal(15kHz) por Coseno y con Filtro Pasabajas - Espectro de Frecuencia')
xlabel('Frecuencia en Hertz')
ylabel('amplitud')

soundsc(ys,fs)