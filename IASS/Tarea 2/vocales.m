function [letra] = vocales(audio)
    %vocales recibe por parámetro el nombre de un audio que contiene una de 
    %las vocales (a, i, u) y retorna un caracter con la letra ingresda.

    %Carga el audio de la vocal
    [x,tiempo,fs]=cargarAudio(audio);
    
    %Se obtiene el especto de frecuencia del audio
    [frec,Xmag]=espectro(x,fs);

    %INICIALIZACIÓN DE LAS VARIABLES
    promedio1 = 0; %Se encarga de contener los valores desde la frecuencia
                   %1200[Hz] hasta la frecuencia 2000[Hz]
    
    promedio2 = 0; %Se encarga de contener los valores desde la frecuencia
                   %2200[Hz] hasta la frecuencia 4000[Hz]
    
    contador1 = 0; %Indica la posición en la que se guardan los valores
                   %dentro del vector promedio1

    contador2 = 0; %Indica la posición en la que se guardan los valores
                   %dentro del vector promedio2
                   
    %En este For se recorren todas las frecuencias
    for i = 1 : length(frec)
        
        %Se guardan las frecuencias que están entre 1200Hz y 2000Hz
        if frec(i) > 1200 && frec(i) < 2000
            contador1 = contador1 + 1;
            promedio1(contador1) = Xmag(i);
        end

        %Se guardan las frecuencias que están entre 2200Hz y 4000Hz
        if frec(i) > 2200 && frec(i) < 4000
            contador2 = contador2 + 1;
            promedio2(contador2) = Xmag(i);
        end
    end
    
    prom1 = mean(promedio1); %Se promedian los valores de las frecuencias 
                             %entre 1200Hz y 2000Hz
                             
    prom2 = mean(promedio2); %Se promedian los valores de las frecuencias 
                             %entre 2200Hz y 4000Hz

    %Teniendo en cuenta los valores de los promedios obtenidos
    %anteriormente se define si el audio contenía una letra a, i, u.
    if prom1 < 0.5
        if abs(prom2 - prom1) > 0.25
            letra = 'i';
        else
            letra = 'u';
        end
    else
        letra = 'a';
    end
end

