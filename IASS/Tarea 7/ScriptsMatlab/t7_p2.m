%% Punto 2a.
clear all
clc
close all
myFolder = 'C:\Users\jpnar\OneDrive - Universidad de Los Andes\8vo Semestre\Se�ales 2\Tareas\Tarea 7\Faces\markings';
filePattern = fullfile(myFolder, '*.mat'); % Change to whatever pattern you need.
landmarks = dir(filePattern);

c_neutral = 1;
c_feliz = 1;
c_triste = 1;
c_furioso = 1;
c_disgusto = 1;
c_miedo = 1;

% For para guardar todas las expresiones en sus respectivos vectores
for k = 1 : length(landmarks)
    nombre = landmarks(k).name;
    ruta = fullfile(landmarks(k).folder, nombre);
    
    load(ruta)
    
    letra = nombre(9);
    
    
    if letra == 'n'
        neutral(:,:,c_neutral) = [faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2)];
        c_neutral = c_neutral + 1;
    elseif letra == 'h'
        feliz(:,:,c_feliz) = [faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2)];
        c_feliz = c_feliz + 1;
    elseif letra == 's'
        triste(:,:,c_triste) = [faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2)];
        c_triste = c_triste + 1;
    elseif letra == 'a'
        furioso(:,:,c_furioso) = [faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2)];
        c_furioso = c_furioso + 1;
    elseif letra == 'd'
        disgusto(:,:,c_disgusto) = [faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2)];
        c_disgusto = c_disgusto + 1;
    elseif letra == 'f'
        miedo(:,:,c_miedo) = [faceCoordinatesUnwarped(:,1),faceCoordinatesUnwarped(:,2)];
        c_miedo = c_miedo + 1;
    end
end


% Recorrido para dividir los datos de Neutral en las 3 categorias
contEnt = 0;
contVal = 0;
contPru = 0;

aux1 = 0;
aux2 = 0;
aux3 = 0;

for k = 1 : length(neutral)
    
    control = 1;
    while control == 1
        aleatorio = randi([1,length(neutral)]);
        if neutral(1,1,aleatorio) ~= -1
            control  = 0;
        end
    end
    
    if k < length(neutral)*0.7
        contEnt = contEnt + 1;
        entrenamiento(:,:,contEnt) = neutral(:,:,aleatorio);
        
        aux1 = aux1 + 1;
        entr_neut(:,:,aux1) = neutral(:,:,aleatorio);
        
        neutral(1,1,aleatorio) = -1;
        ultimo_neut_entr = contEnt;
    elseif k < length(neutral) * 0.85
        contVal = contVal + 1;
        validacion(:,:,contVal) = neutral(:,:,aleatorio);
        
        aux2 = aux2 + 1;
        vali_neut(:,:,aux2) = neutral(:,:,aleatorio);
        
        neutral(1,1,aleatorio) = -1;
        ultimo_neut_vali = contVal;
    else
        contPru = contPru + 1;
        prueba(:,:,contPru) = neutral(:,:,aleatorio);
        
        aux3 = aux3 + 1;
        prue_neut(:,:,aux3) = neutral(:,:,aleatorio);
        
        neutral(1,1,aleatorio) = -1;
        ultimo_neut_prue = contPru;
    end
    
    
end

aux1 = 0;
aux2 = 0;
aux3 = 0;

% Recorrido para dividir los datos de Feliz en las 3 categorias
for k = 1 : length(feliz)
    
    control = 1;
    while control == 1
        aleatorio = randi([1,length(feliz)]);
        if feliz(1,1,aleatorio) ~= -1
            control  = 0;
        end
    end
    
    if k < length(feliz)*0.7
        contEnt = contEnt + 1;
        entrenamiento(:,:,contEnt) = feliz(:,:,aleatorio);
        
        aux1 = aux1 + 1;
        entr_feli(:,:,aux1) = feliz(:,:,aleatorio);
        
        feliz(1,1,aleatorio) = -1;
        ultimo_feli_entr = contEnt;
    elseif k < length(feliz) * 0.85
        contVal = contVal + 1;
        validacion(:,:,contVal) = feliz(:,:,aleatorio);
        
        aux2 = aux2 + 1;
        vali_feli(:,:,aux2) = feliz(:,:,aleatorio);
        
        feliz(1,1,aleatorio) = -1;
        ultimo_feli_vali = contVal;
    else
        contPru = contPru + 1;
        prueba(:,:,contPru) = feliz(:,:,aleatorio);
        
        aux3 = aux3 + 1;
        prue_feli(:,:,aux3) = feliz(:,:,aleatorio);
        
        feliz(1,1,aleatorio) = -1;
        ultimo_feli_prue = contPru;
    end
    
    
end


aux1 = 0;
aux2 = 0;
aux3 = 0;

% Recorrido para dividir los datos de triste en las 3 categorias
for k = 1 : length(triste)
    
    control = 1;
    while control == 1
        aleatorio = randi([1,length(triste)]);
        if triste(1,1,aleatorio) ~= -1
            control  = 0;
        end
    end
    
    if k < length(triste)*0.7
        contEnt = contEnt + 1;
        entrenamiento(:,:,contEnt) = triste(:,:,aleatorio);
        
        aux1 = aux1 + 1;
        entr_tris(:,:,aux1) = triste(:,:,aleatorio);
        
        triste(1,1,aleatorio) = -1;
        ultimo_tris_entr = contEnt;
    elseif k < length(triste) * 0.85
        contVal = contVal + 1;
        validacion(:,:,contVal) = triste(:,:,aleatorio);
        
        aux2 = aux2 + 1;
        vali_tris(:,:,aux2) = triste(:,:,aleatorio);
        
        triste(1,1,aleatorio) = -1;
        ultimo_tris_vali = contVal;
    else
        contPru = contPru + 1;
        prueba(:,:,contPru) = triste(:,:,aleatorio);
        
        aux3 = aux3 + 1;
        prue_tris(:,:,aux3) = triste(:,:,aleatorio);
        
        triste(1,1,aleatorio) = -1;
        ultimo_tris_prue = contPru;
    end
    
    
end


aux1 = 0;
aux2 = 0;
aux3 = 0;

% Recorrido para dividir los datos de furioso en las 3 categorias
for k = 1 : length(furioso)
    
    control = 1;
    while control == 1
        aleatorio = randi([1,length(furioso)]);
        if furioso(1,1,aleatorio) ~= -1
            control  = 0;
        end
    end
    
    if k < length(furioso)*0.7
        contEnt = contEnt + 1;
        entrenamiento(:,:,contEnt) = furioso(:,:,aleatorio);
        
        aux1 = aux1 + 1;
        entr_furi(:,:,aux1) = furioso(:,:,aleatorio);
        
        furioso(1,1,aleatorio) = -1;
        ultimo_furi_entr = contEnt;
    elseif k < length(furioso) * 0.85
        contVal = contVal + 1;
        validacion(:,:,contVal) = furioso(:,:,aleatorio);
        
        aux2 = aux2 + 1;
        vali_furi(:,:,aux2) = furioso(:,:,aleatorio);
        
        furioso(1,1,aleatorio) = -1;
        ultimo_furi_vali = contVal;
    else
        contPru = contPru + 1;
        prueba(:,:,contPru) = furioso(:,:,aleatorio);
        
        aux3 = aux3 + 1;
        prue_furi(:,:,aux3) = furioso(:,:,aleatorio);
        
        furioso(1,1,aleatorio) = -1;
        ultimo_furi_prue = contPru;
    end
    
    
end


aux1 = 0;
aux2 = 0;
aux3 = 0;

% Recorrido para dividir los datos de disgusto en las 3 categorias
for k = 1 : length(disgusto)
    
    control = 1;
    while control == 1
        aleatorio = randi([1,length(disgusto)]);
        if disgusto(1,1,aleatorio) ~= -1
            control  = 0;
        end
    end
    
    if k < length(disgusto)*0.7
        contEnt = contEnt + 1;
        entrenamiento(:,:,contEnt) = disgusto(:,:,aleatorio);
        
        aux1 = aux1 + 1;
        entr_disg(:,:,aux1) = disgusto(:,:,aleatorio);
        
        disgusto(1,1,aleatorio) = -1;
        ultimo_disg_entr = contEnt;
    elseif k < length(disgusto) * 0.85
        contVal = contVal + 1;
        validacion(:,:,contVal) = disgusto(:,:,aleatorio);
        
        aux2 = aux2 + 1;
        vali_disg(:,:,aux2) = disgusto(:,:,aleatorio);
        
        disgusto(1,1,aleatorio) = -1;
        ultimo_disg_vali = contVal;
    else
        contPru = contPru + 1;
        prueba(:,:,contPru) = disgusto(:,:,aleatorio);
        
        aux3 = aux3 + 1;
        prue_disg(:,:,aux3) = disgusto(:,:,aleatorio);
        
        disgusto(1,1,aleatorio) = -1;
        ultimo_disg_prue = contPru;
    end
    
    
end


aux1 = 0;
aux2 = 0;
aux3 = 0;

% Recorrido para dividir los datos de miedo en las 3 categorias
for k = 1 : length(miedo)
    
    control = 1;
    while control == 1
        aleatorio = randi([1,length(miedo)]);
        if miedo(1,1,aleatorio) ~= -1
            control  = 0;
        end
    end
    
    if k < length(miedo)*0.7
        contEnt = contEnt + 1;
        entrenamiento(:,:,contEnt) = miedo(:,:,aleatorio);
        
        aux1 = aux1 + 1;
        entr_mied(:,:,aux1) = miedo(:,:,aleatorio);
        
        miedo(1,1,aleatorio) = -1;
        ultimo_mied_entr = contEnt;
    elseif k < length(miedo) * 0.85
        contVal = contVal + 1;
        validacion(:,:,contVal) = miedo(:,:,aleatorio);
        
        aux2 = aux2 + 1;
        vali_mied(:,:,aux2) = miedo(:,:,aleatorio);
        
        miedo(1,1,aleatorio) = -1;
        ultimo_mied_vali = contVal;
    else
        contPru = contPru + 1;
        prueba(:,:,contPru) = miedo(:,:,aleatorio);
        
        aux3 = aux3 + 1;
        prue_mied(:,:,aux3) = miedo(:,:,aleatorio);
        
        miedo(1,1,aleatorio) = -1;
        ultimo_mied_prue = contPru;
    end
    
    
end


%% Punto 2b.
primero = 1;
for i = length(entrenamiento)

    %Se crea el vector complejo w
    w = complex(entrenamiento(:,1,i),entrenamiento(:,2,i));

    %Se crea y guarda la matriz S
    if primero == 1
        S = w*w';
        primero = 0;
    else
        S = S + w*w';
    end

end

% Se obtienen los valores y vectores propios de S para hallar muGorro
[V,D] = eig(S);

mayor = 0;
for i = 1:length(D)
    if mayor < D(i,i)
        mayor = D(i,i);
        pos_mayor = i;
    end
end

muGorro = V(:,pos_mayor);
wr = real(muGorro);
wc = imag(muGorro);
figure(1)
scatter(wr,-wc,'xr')
title('mu^{gorro}')
hold all

%Alinear datos de entrenamiento (completo) a la media procrustes
for i = 1 : length(entrenamiento)

    %Se crea el vector complejo w1
    w1 = complex(entrenamiento(:,1,i),entrenamiento(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);

    %Gráficos
    figure(2)
    scatter(wr,-wc,'.k')
    title('Landmarks proyectados a la media de procrustes - Grupo de Entrenamiento')
    hold on
    
    figure(6)
    scatter(wr,-wc,'.k')
    title('Landmarks proyectados a la media de procrustes - Todos los grupos')
    hold on
    
    %variables auxiliares usadas para el punto 2.c
    aux_entren(:,1,i) = wr;
    aux_entren(:,2,i) = wc;
    
    
end

%Alinear datos de entrenamiento (vectores separados) a la media procrustes
for i = 1 : length(entr_neut(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(entr_neut(:,1,i),entr_neut(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    entr_alin_neut(:,1,i) = wr;
    entr_alin_neut(:,2,i) = wc;
    
    
end

for i = 1 : length(entr_feli(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(entr_feli(:,1,i),entr_feli(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    entr_alin_feli(:,1,i) = wr;
    entr_alin_feli(:,2,i) = wc;
    
    
end


for i = 1 : length(entr_tris(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(entr_tris(:,1,i),entr_tris(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    entr_alin_tris(:,1,i) = wr;
    entr_alin_tris(:,2,i) = wc;
    
end


for i = 1 : length(entr_furi(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(entr_furi(:,1,i),entr_furi(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    entr_alin_furi(:,1,i) = wr;
    entr_alin_furi(:,2,i) = wc;
    
end


for i = 1 : length(entr_disg(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(entr_disg(:,1,i),entr_disg(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    entr_alin_disg(:,1,i) = wr;
    entr_alin_disg(:,2,i) = wc;
    
end


for i = 1 : length(entr_mied(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(entr_mied(:,1,i),entr_mied(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    entr_alin_mied(:,1,i) = wr;
    entr_alin_mied(:,2,i) = wc;
    
end



%Alinear datos de validación (vector completo) a la media procrustes
for i = 1 : length(validacion)

    %Se crea el vector complejo w1
    w1 = complex(validacion(:,1,i),validacion(:,2,i));


    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);

    %Gráficos
    figure(3)
    scatter(wr,-wc,'.k')
    title('Landmarks proyectados a la media de procrustes - Grupo de Validacion')
    hold all
    
    figure(6)
    scatter(wr,-wc,'.c')
    title('Landmarks proyectados a la media de procrustes - Todos los grupos')
    hold on

    %variables auxiliares usadas para el punto 2.c
    aux_valida(:,1,i) = wr;
    aux_valida(:,2,i) = wc;

end

%Alinear datos de validación (vectores separados) a la media procrustes
for i = 1 : length(vali_neut(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(vali_neut(:,1,i),vali_neut(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    vali_alin_neut(:,1,i) = wr;
    vali_alin_neut(:,2,i) = wc;
    
    
end

for i = 1 : length(vali_feli(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(vali_feli(:,1,i),vali_feli(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    vali_alin_feli(:,1,i) = wr;
    vali_alin_feli(:,2,i) = wc;
    
    
end


for i = 1 : length(vali_tris(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(vali_tris(:,1,i),vali_tris(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    vali_alin_tris(:,1,i) = wr;
    vali_alin_tris(:,2,i) = wc;
    
end


for i = 1 : length(vali_furi(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(vali_furi(:,1,i),vali_furi(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    vali_alin_furi(:,1,i) = wr;
    vali_alin_furi(:,2,i) = wc;
    
end


for i = 1 : length(vali_disg(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(vali_disg(:,1,i),vali_disg(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    vali_alin_disg(:,1,i) = wr;
    vali_alin_disg(:,2,i) = wc;
    
end


for i = 1 : length(vali_mied(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(vali_mied(:,1,i),vali_mied(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    vali_alin_mied(:,1,i) = wr;
    vali_alin_mied(:,2,i) = wc;
    
end




%Alinear datos de prueba (vector completo) a la media procrustes
for i = 1 : length(prueba)

    %Se crea el vector complejo w1
    w1 = complex(prueba(:,1,i),prueba(:,2,i));


    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);

    %Gráficos
    figure(4)
    scatter(wr,-wc,'.k')
    title('Landmarks proyectados a la media de procrustes - Grupo de Prueba')
    hold all

    figure(6)
    scatter(wr,-wc,'.b')
    title('Landmarks proyectados a la media de procrustes - Todos los grupos')
    hold on
    
    %variables auxiliares usadas para el punto 2.c
    aux_prueba(:,1,i) = wr;
    aux_prueba(:,2,i) = wc;

end

%Alinear datos de prueba (vectores separados) a la media procrustes
for i = 1 : length(prue_neut(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(prue_neut(:,1,i),prue_neut(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    prue_alin_neut(:,1,i) = wr;
    prue_alin_neut(:,2,i) = wc;
    
    
end

for i = 1 : length(prue_feli(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(prue_feli(:,1,i),prue_feli(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    prue_alin_feli(:,1,i) = wr;
    prue_alin_feli(:,2,i) = wc;
    
    
end


for i = 1 : length(prue_tris(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(prue_tris(:,1,i),prue_tris(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    prue_alin_tris(:,1,i) = wr;
    prue_alin_tris(:,2,i) = wc;
    
end


for i = 1 : length(prue_furi(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(prue_furi(:,1,i),prue_furi(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    prue_alin_furi(:,1,i) = wr;
    prue_alin_furi(:,2,i) = wc;
    
end


for i = 1 : length(prue_disg(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(prue_disg(:,1,i),prue_disg(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    prue_alin_disg(:,1,i) = wr;
    prue_alin_disg(:,2,i) = wc;
    
end


for i = 1 : length(prue_mied(1,1,:))

    %Se crea el vector complejo w1
    w1 = complex(prue_mied(:,1,i),prue_mied(:,2,i));

    %Se proyecta la forma w1 a la media de procrustes
    wp = w1*((w1'*muGorro)/(w1'*w1));
    
    %Se separa el vector complejo wp en dos vectores
    wr = real(wp);
    wc = imag(wp);
    
    %variables auxiliares usadas para el punto 2.c
    prue_alin_mied(:,1,i) = wr;
    prue_alin_mied(:,2,i) = wc;
    
end


%% Punto 2.c
%%%%%%%%%%%%%%%ENTRENAMIENTO%%%%%%%%%%%%%%%%%
caract_entren = [];
for i = 1 : length(aux_entren)
    largo = length(aux_entren(:,1,i));
    caract_entren(1:largo,i) = aux_entren(:,1,i);   
    caract_entren(largo + 1:2*largo,i) = aux_entren(:,2,i);
end


caract_entren_neut = [];
for i = 1 : length(entr_alin_neut(1,1,:))
    largo = length(entr_alin_neut(:,1,i));
    caract_entren_neut(1:largo,i) = entr_alin_neut(:,1,i);   
    caract_entren_neut(largo + 1:2*largo,i) = entr_alin_neut(:,2,i);
end

caract_entren_feli = [];
for i = 1 : length(entr_alin_feli(1,1,:))
    largo = length(entr_alin_feli(:,1,i));
    caract_entren_feli(1:largo,i) = entr_alin_feli(:,1,i);   
    caract_entren_feli(largo + 1:2*largo,i) = entr_alin_feli(:,2,i);
end

caract_entren_tris = [];
for i = 1 : length(entr_alin_tris(1,1,:))
    largo = length(entr_alin_tris(:,1,i));
    caract_entren_tris(1:largo,i) = entr_alin_tris(:,1,i);   
    caract_entren_tris(largo + 1:2*largo,i) = entr_alin_tris(:,2,i);
end


caract_entren_furi = [];
for i = 1 : length(entr_alin_furi(1,1,:))
    largo = length(entr_alin_furi(:,1,i));
    caract_entren_furi(1:largo,i) = entr_alin_furi(:,1,i);   
    caract_entren_furi(largo + 1:2*largo,i) = entr_alin_furi(:,2,i);
end


caract_entren_disg = [];
for i = 1 : length(entr_alin_disg(1,1,:))
    largo = length(entr_alin_disg(:,1,i));
    caract_entren_disg(1:largo,i) = entr_alin_disg(:,1,i);   
    caract_entren_disg(largo + 1:2*largo,i) = entr_alin_disg(:,2,i);
end


caract_entren_mied = [];
for i = 1 : length(entr_alin_mied(1,1,:))
    largo = length(entr_alin_mied(:,1,i));
    caract_entren_mied(1:largo,i) = entr_alin_mied(:,1,i);   
    caract_entren_mied(largo + 1:2*largo,i) = entr_alin_mied(:,2,i);
end


%%%%%%%%%%%%%%%VALIDACION%%%%%%%%%%%%%%%%%
caract_valida = [];
for i = 1 : length(aux_valida)
    largo = length(aux_valida(:,1,i));
    caract_valida(1:largo,i) = aux_valida(:,1,i);    
    caract_valida(largo + 1:2*largo,i) = aux_valida(:,2,i);
end

caract_valida_neut = [];
for i = 1 : length(vali_alin_neut(1,1,:))
    largo = length(vali_alin_neut(:,1,i));
    caract_valida_neut(1:largo,i) = vali_alin_neut(:,1,i);   
    caract_valida_neut(largo + 1:2*largo,i) = vali_alin_neut(:,2,i);
end

caract_valida_feli = [];
for i = 1 : length(vali_alin_feli(1,1,:))
    largo = length(vali_alin_feli(:,1,i));
    caract_valida_feli(1:largo,i) = vali_alin_feli(:,1,i);   
    caract_valida_feli(largo + 1:2*largo,i) = vali_alin_feli(:,2,i);
end

caract_valida_tris = [];
for i = 1 : length(vali_alin_tris(1,1,:))
    largo = length(vali_alin_tris(:,1,i));
    caract_valida_tris(1:largo,i) = vali_alin_tris(:,1,i);   
    caract_valida_tris(largo + 1:2*largo,i) = vali_alin_tris(:,2,i);
end


caract_valida_furi = [];
for i = 1 : length(vali_alin_furi(1,1,:))
    largo = length(vali_alin_furi(:,1,i));
    caract_valida_furi(1:largo,i) = vali_alin_furi(:,1,i);   
    caract_valida_furi(largo + 1:2*largo,i) = vali_alin_furi(:,2,i);
end


caract_valida_disg = [];
for i = 1 : length(vali_alin_disg(1,1,:))
    largo = length(vali_alin_disg(:,1,i));
    caract_valida_disg(1:largo,i) = vali_alin_disg(:,1,i);   
    caract_valida_disg(largo + 1:2*largo,i) = vali_alin_disg(:,2,i);
end


caract_valida_mied = [];
for i = 1 : length(vali_alin_mied(1,1,:))
    largo = length(vali_alin_mied(:,1,i));
    caract_valida_mied(1:largo,i) = vali_alin_mied(:,1,i);   
    caract_valida_mied(largo + 1:2*largo,i) = vali_alin_mied(:,2,i);
end


%%%%%%%%%%%%%%%PRUEBA%%%%%%%%%%%%%%%%%

caract_prueba = [];
for i = 1 : length(aux_prueba)
    largo = length(aux_prueba(:,1,i));
    caract_prueba(1:largo,i) = aux_prueba(:,1,i); 
    caract_prueba(largo + 1:2*largo,i) = aux_prueba(:,2,i);
end


caract_prueba_neut = [];
for i = 1 : length(prue_alin_neut(1,1,:))
    largo = length(prue_alin_neut(:,1,i));
    caract_prueba_neut(1:largo,i) = prue_alin_neut(:,1,i);   
    caract_prueba_neut(largo + 1:2*largo,i) = prue_alin_neut(:,2,i);
end

caract_prueba_feli = [];
for i = 1 : length(prue_alin_feli(1,1,:))
    largo = length(prue_alin_feli(:,1,i));
    caract_prueba_feli(1:largo,i) = prue_alin_feli(:,1,i);   
    caract_prueba_feli(largo + 1:2*largo,i) = prue_alin_feli(:,2,i);
end

caract_prueba_tris = [];
for i = 1 : length(prue_alin_tris(1,1,:))
    largo = length(prue_alin_tris(:,1,i));
    caract_prueba_tris(1:largo,i) = prue_alin_tris(:,1,i);   
    caract_prueba_tris(largo + 1:2*largo,i) = prue_alin_tris(:,2,i);
end


caract_prueba_furi = [];
for i = 1 : length(prue_alin_furi(1,1,:))
    largo = length(prue_alin_furi(:,1,i));
    caract_prueba_furi(1:largo,i) = prue_alin_furi(:,1,i);   
    caract_prueba_furi(largo + 1:2*largo,i) = prue_alin_furi(:,2,i);
end


caract_prueba_disg = [];
for i = 1 : length(prue_alin_disg(1,1,:))
    largo = length(prue_alin_disg(:,1,i));
    caract_prueba_disg(1:largo,i) = prue_alin_disg(:,1,i);   
    caract_prueba_disg(largo + 1:2*largo,i) = prue_alin_disg(:,2,i);
end


caract_prueba_mied = [];
for i = 1 : length(prue_alin_mied(1,1,:))
    largo = length(prue_alin_mied(:,1,i));
    caract_prueba_mied(1:largo,i) = prue_alin_mied(:,1,i);   
    caract_prueba_mied(largo + 1:2*largo,i) = prue_alin_mied(:,2,i);
end
%% Punto 2.d
%%%%%%%%%%%%%%%%%%%%%VECTORES SEPARADOS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cálculo de media y matriz de covarianza - Neutral
media_neut2 = caract_entren_neut(:,1);
for i = 2 : length(caract_entren_neut(1,:))
    media_neut2 = media_neut2 + caract_entren_neut(:,i);
end
media_neut2 = media_neut2/length(caract_entren_neut(1,:));


Q_neut2 = (caract_entren_neut(:,1)-media_neut2)*(caract_entren_neut(:,1)-media_neut2)' ;
for i = 2 : length(caract_entren_neut(1,:))
    Q_neut2 = Q_neut2 + (caract_entren_neut(:,i)-media_neut2)*(caract_entren_neut(:,i)-media_neut2)';
end
Q_neut2 = Q_neut2/length(caract_entren_neut(1,:));



%Cálculo de media y matriz de covarianza - Feliz
media_feli2 = caract_entren_feli(:,1);
for i = 2 : length(caract_entren_feli(1,:))
    media_feli2 = media_feli2 + caract_entren_feli(:,i);
end
media_feli2 = media_feli2/length(caract_entren_feli(1,:));


Q_feli2 = (caract_entren_feli(:,1)-media_feli2)*(caract_entren_feli(:,1)-media_feli2)' ;
for i = 2 : length(caract_entren_feli(1,:))
    Q_feli2 = Q_feli2 + (caract_entren_feli(:,i)-media_feli2)*(caract_entren_feli(:,i)-media_feli2)';
end
Q_feli2 = Q_feli2/length(caract_entren_feli(1,:));



%Cálculo de media y matriz de covarianza - Triste
media_tris2 = caract_entren_tris(:,1);
for i = 2 : length(caract_entren_tris(1,:))
    media_tris2 = media_tris2 + caract_entren_tris(:,i);
end
media_tris2 = media_tris2/length(caract_entren_tris(1,:));


Q_tris2 = (caract_entren_tris(:,+1)-media_tris2)*(caract_entren_tris(:,1)-media_tris2)' ;
for i = 2 : length(caract_entren_tris(1,:))
    Q_tris2 = Q_tris2 + (caract_entren_tris(:,i)-media_tris2)*(caract_entren_tris(:,i)-media_tris2)';
end
Q_tris2 = Q_tris2/length(caract_entren_tris(1,:));


%Cálculo de media y matriz de covarianza - Furioso
media_furi2 = caract_entren_furi(:,1);
for i = 2 : length(caract_entren_furi(1,:))
    media_furi2 = media_furi2 + caract_entren_furi(:,i);
end
media_furi2 = media_furi2/length(caract_entren_furi(1,:));


Q_furi2 = (caract_entren_furi(:,1)-media_furi2)*(caract_entren_furi(:,1)-media_furi2)' ;
for i = 2 : length(caract_entren_furi(1,:))
    Q_furi2 = Q_furi2 + (caract_entren_furi(:,i)-media_furi2)*(caract_entren_furi(:,i)-media_furi2)';
end
Q_furi2 = Q_furi2/length(caract_entren_furi(1,:));


%Cálculo de media y matriz de covarianza - Disgusto
media_disg2 = caract_entren_disg(:,1);
for i = 2 : length(caract_entren_disg(1,:))
    media_disg2 = media_disg2 + caract_entren_disg(:,i);
end
media_disg2 = media_disg2/length(caract_entren_disg(1,:));


Q_disg2 = (caract_entren_disg(:,1)-media_disg2)*(caract_entren_disg(:,1)-media_disg2)' ;
for i = 2 : length(caract_entren_disg(1,:))
    Q_disg2 = Q_disg2 + (caract_entren_disg(:,i)-media_disg2)*(caract_entren_disg(:,i)-media_disg2)';
end
Q_disg2 = Q_disg2/length(caract_entren_disg(1,:));


%Cálculo de media y matriz de covarianza - Miedo
media_mied2 = caract_entren_mied(:,1);
for i = 2 : length(caract_entren_mied(1,:))
    media_mied2 = media_mied2 + caract_entren_mied(:,i);
end
media_mied2 = media_mied2/length(caract_entren_mied(1,:));


Q_mied2 = (caract_entren_mied(:,1)-media_mied2)*(caract_entren_mied(:,1)-media_mied2)' ;
for i = 2 : length(caract_entren_mied(1,:))
    Q_mied2 = Q_mied2 + (caract_entren_mied(:,i)-media_mied2)*(caract_entren_mied(:,i)-media_mied2)';
end
Q_mied2 = Q_mied2/length(caract_entren_mied(1,:));





%%%%%%%%%%%%%%%%%%%%%VECTORES COMPLETOS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cálculo de media y matriz de covarianza - Neutral
media_neut = caract_entren(:,1);
for i = 2 : ultimo_neut_entr
    media_neut = media_neut + caract_entren(:,i);
end
media_neut = media_neut/ultimo_neut_entr;


Q_neut = (caract_entren(:,1)-media_neut)*(caract_entren(:,1)-media_neut)' ;
for i = 2 : ultimo_neut_entr
    Q_neut = Q_neut + (caract_entren(:,i)-media_neut)*(caract_entren(:,i)-media_neut)';
end
Q_neut = Q_neut/ultimo_neut_entr;



%Cálculo de media y matriz de covarianza - Feliz
media_feli = caract_entren(:,ultimo_neut_entr+1);
for i = ultimo_neut_entr + 2 : ultimo_feli_entr
    media_feli = media_feli + caract_entren(:,i);
end
media_feli = media_feli/(ultimo_feli_entr-ultimo_neut_entr);


Q_feli = (caract_entren(:,ultimo_neut_entr+1)-media_feli)*(caract_entren(:,ultimo_neut_entr+1)-media_feli)' ;
for i = ultimo_neut_entr + 2 : ultimo_feli_entr
    Q_feli = Q_feli + (caract_entren(:,i)-media_feli)*(caract_entren(:,i)-media_feli)';
end
Q_feli = Q_feli/(ultimo_feli_entr-ultimo_neut_entr);



%Cálculo de media y matriz de covarianza - Triste
media_tris = caract_entren(:,ultimo_feli_entr+1);
for i = ultimo_feli_entr + 2 : ultimo_tris_entr
    media_tris = media_tris + caract_entren(:,i);
end
media_tris = media_tris/(ultimo_tris_entr-ultimo_feli_entr);


Q_tris = (caract_entren(:,ultimo_feli_entr+1)-media_tris)*(caract_entren(:,ultimo_feli_entr+1)-media_tris)' ;
for i = ultimo_feli_entr + 2 : ultimo_tris_entr
    Q_tris = Q_tris + (caract_entren(:,i)-media_tris)*(caract_entren(:,i)-media_tris)';
end
Q_tris = Q_tris/(ultimo_tris_entr-ultimo_feli_entr);


%Cálculo de media y matriz de covarianza - Furioso
media_furi = caract_entren(:,ultimo_tris_entr+1);
for i = ultimo_tris_entr + 2 : ultimo_furi_entr
    media_furi = media_furi + caract_entren(:,i);
end
media_furi = media_furi/(ultimo_furi_entr-ultimo_tris_entr);


Q_furi = (caract_entren(:,ultimo_tris_entr+1)-media_furi)*(caract_entren(:,ultimo_tris_entr+1)-media_furi)' ;
for i = ultimo_tris_entr + 2 : ultimo_furi_entr
    Q_furi = Q_furi + (caract_entren(:,i)-media_furi)*(caract_entren(:,i)-media_furi)';
end
Q_furi = Q_furi/(ultimo_furi_entr-ultimo_tris_entr);


%Cálculo de media y matriz de covarianza - Furioso
media_disg = caract_entren(:,ultimo_furi_entr+1);
for i = ultimo_furi_entr + 2 : ultimo_disg_entr
    media_disg = media_disg + caract_entren(:,i);
end
media_disg = media_disg/(ultimo_disg_entr-ultimo_furi_entr);


Q_disg = (caract_entren(:,ultimo_furi_entr+1)-media_disg)*(caract_entren(:,ultimo_furi_entr+1)-media_disg)' ;
for i = ultimo_furi_entr + 2 : ultimo_disg_entr
    Q_disg = Q_disg + (caract_entren(:,i)-media_disg)*(caract_entren(:,i)-media_disg)';
end
Q_disg = Q_disg/(ultimo_disg_entr-ultimo_furi_entr);


%Cálculo de media y matriz de covarianza - Miedo
media_mied = caract_entren(:,ultimo_disg_entr+1);
for i = ultimo_disg_entr + 2 : ultimo_mied_entr
    media_mied = media_mied + caract_entren(:,i);
end
media_mied = media_mied/(ultimo_mied_entr-ultimo_disg_entr);


Q_mied = (caract_entren(:,ultimo_disg_entr+1)-media_mied)*(caract_entren(:,ultimo_disg_entr+1)-media_mied)' ;
for i = ultimo_disg_entr + 2 : ultimo_mied_entr
    Q_mied = Q_mied + (caract_entren(:,i)-media_mied)*(caract_entren(:,i)-media_mied)';
end
Q_mied = Q_mied/(ultimo_mied_entr-ultimo_disg_entr);


%% Punto 2.e CON VECTORES SEPARADOS
menor_error = 1e10;
for j = 1:2:50

    alpha = 0.0001*j;
    %0.0039
    regu = alpha * eye(length(Q_neut));

    error_neutro = 0;
    correcto_neutro = 0;        
    error_feliz = 0;
    correcto_feliz = 0;
    error_triste  = 0;
    correcto_triste = 0;
    error_furioso = 0;
    correcto_furioso = 0;
    error_disgusto = 0;
    correcto_disgusto = 0;
    error_miedo = 0;
    correcto_miedo = 0;
    
    %Se evalua los vectores de características de validación - neutro
    for i = 1 : length(caract_valida_neut(1,:))
        valor_clase = log(pdf_c(caract_valida_neut(:,i),media_neut2, Q_neut2 + regu));
        clase = 'n';

        valor_clase2 = log(pdf_c(caract_valida_neut(:,i),media_feli2,Q_feli2 + regu));
        if valor_clase2 > valor_clase
            clase = 'h';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_neut(:,i),media_tris2,Q_tris2 + regu));
        if valor_clase2 > valor_clase
            clase = 's';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_neut(:,i),media_furi2,Q_furi2 + regu));
        if valor_clase2 > valor_clase
            clase = 'a';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_neut(:,i),media_disg2,Q_disg2 + regu));
        if valor_clase2 > valor_clase
            clase = 'd';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_neut(:,i),media_mied2,Q_mied2 + regu));
        if valor_clase2 > valor_clase
            clase = 'f';
            valor_clase = valor_clase2;
        end

        if clase == 'n'
            correcto_neutro = correcto_neutro + 1;
        else
            error_neutro = error_neutro + 1;
        end

    end
    
    %Se evalua los vectores de características de validación - Feliz
    for i = 1 : length(caract_valida_feli(1,:))
        valor_clase = log(pdf_c(caract_valida_feli(:,i),media_neut2,Q_neut2 + regu));
        clase = 'n';

        valor_clase2 = log(pdf_c(caract_valida_feli(:,i),media_feli2,Q_feli2 + regu));
        if valor_clase2 > valor_clase
            clase = 'h';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_feli(:,i),media_tris2,Q_tris2 + regu));
        if valor_clase2 > valor_clase
            clase = 's';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_feli(:,i),media_furi2,Q_furi2 + regu));
        if valor_clase2 > valor_clase
            clase = 'a';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_feli(:,i),media_disg2,Q_disg2 + regu));
        if valor_clase2 > valor_clase
            clase = 'd';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_feli(:,i),media_mied2,Q_mied2 + regu));
        if valor_clase2 > valor_clase
            clase = 'f';
            valor_clase = valor_clase2;
        end

        if clase == 'h'
            correcto_feliz = correcto_feliz + 1;
        else
            error_feliz = error_feliz + 1;
        end

    end

    %Se evalua los vectores de características de validación - triste
    for i = 1 : length(caract_valida_tris(1,:))
        valor_clase = log(pdf_c(caract_valida_tris(:,i),media_neut2,Q_neut2 + regu));
        clase = 'n';

        valor_clase2 = log(pdf_c(caract_valida_tris(:,i),media_feli2,Q_feli2 + regu));
        if valor_clase2 > valor_clase
            clase = 'h';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_tris(:,i),media_tris2,Q_tris2 + regu));
        if valor_clase2 > valor_clase
            clase = 's';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_tris(:,i),media_furi2,Q_furi2 + regu));
        if valor_clase2 > valor_clase
            clase = 'a';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_tris(:,i),media_disg2,Q_disg2 + regu));
        if valor_clase2 > valor_clase
            clase = 'd';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_tris(:,i),media_mied2,Q_mied2 + regu));
        if valor_clase2 > valor_clase
            clase = 'f';
            valor_clase = valor_clase2;
        end

        if clase == 's'
            correcto_triste = correcto_triste + 1;
        else
            error_triste = error_triste + 1;
        end

    end

    %Se evalua los vectores de características de validación - furioso
    for i = 1 : length(caract_valida_furi(1,:))
        valor_clase = log(pdf_c(caract_valida_furi(:,i),media_neut2,Q_neut2 + regu));
        clase = 'n';

        valor_clase2 = log(pdf_c(caract_valida_furi(:,i),media_feli2,Q_feli2 + regu));
        if valor_clase2 > valor_clase
            clase = 'h';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_furi(:,i),media_tris2,Q_tris2 + regu));
        if valor_clase2 > valor_clase
            clase = 's';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_furi(:,i),media_furi2,Q_furi2 + regu));
        if valor_clase2 > valor_clase
            clase = 'a';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_furi(:,i),media_disg2,Q_disg2 + regu));
        if valor_clase2 > valor_clase
            clase = 'd';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_furi(:,i),media_mied2,Q_mied2 + regu));
        if valor_clase2 > valor_clase
            clase = 'f';
            valor_clase = valor_clase2;
        end

        if clase == 'a'
            correcto_furioso = correcto_furioso + 1;
        else
            error_furioso = error_furioso + 1;
        end

    end

    %Se evalua los vectores de características de validación - disgusto
    for i = 1 : length(caract_valida_disg(1,:))
        valor_clase = log(pdf_c(caract_valida_disg(:,i),media_neut2,Q_neut2 + regu));
        clase = 'n';

        valor_clase2 = log(pdf_c(caract_valida_disg(:,i),media_feli2,Q_feli2 + regu));
        if valor_clase2 > valor_clase
            clase = 'h';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_disg(:,i),media_tris2,Q_tris2 + regu));
        if valor_clase2 > valor_clase
            clase = 's';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_disg(:,i),media_furi2,Q_furi2 + regu));
        if valor_clase2 > valor_clase
            clase = 'a';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_disg(:,i),media_disg2,Q_disg2 + regu));
        if valor_clase2 > valor_clase
            clase = 'd';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_disg(:,i),media_mied2,Q_mied2 + regu));
        if valor_clase2 > valor_clase
            clase = 'f';
            valor_clase = valor_clase2;
        end

        if clase == 'd'
            correcto_disgusto = correcto_disgusto + 1;
        else
            error_disgusto = error_disgusto + 1;
        end

    end

    %Se evalua los vectores de características de validación - disgusto
    for i = 1 : length(caract_valida_mied(1,:))
        valor_clase = log(pdf_c(caract_valida_mied(:,i),media_neut2,Q_neut2 + regu));
        clase = 'n';

        valor_clase2 = log(pdf_c(caract_valida_mied(:,i),media_feli2,Q_feli2 + regu));
        if valor_clase2 > valor_clase
            clase = 'h';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_mied(:,i),media_tris2,Q_tris2 + regu));
        if valor_clase2 > valor_clase
            clase = 's';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_mied(:,i),media_furi2,Q_furi2 + regu));
        if valor_clase2 > valor_clase
            clase = 'a';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_mied(:,i),media_disg2,Q_disg2 + regu));
        if valor_clase2 > valor_clase
            clase = 'd';
            valor_clase = valor_clase2;
        end

        valor_clase2 = log(pdf_c(caract_valida_mied(:,i),media_mied2,Q_mied2 + regu));
        if valor_clase2 > valor_clase
            clase = 'f';
            valor_clase = valor_clase2;
        end

        if clase == 'f'
            correcto_miedo = correcto_miedo + 1;
        else
            error_miedo = error_miedo + 1;
        end

    end
    
    error_total = error_disgusto + error_feliz + error_furioso + error_miedo + error_neutro + error_triste;
    
    correcto_total = correcto_disgusto + correcto_feliz + correcto_furioso + correcto_miedo + correcto_neutro + correcto_triste;
    if menor_error > error_total 
        menor_error = error_total;
        correcto_total_mejor = correcto_total;
        alpha_opt = alpha;
    end
    figure(8)
    scatter(j,error_total,'xk')
    title('Número de Errores Totales vs \lambda, (\lambda = 0.001 * i)')
    xlabel('i')
    ylabel('Número de Errores')
    hold all
    
end
error_porcentaje_validacion = menor_error/(menor_error + correcto_total_mejor)

%% Punto 2.f

regu = alpha_opt * eye(length(Q_neut));

error_neutro = 0;
correcto_neutro = 0;
error_neut_feli = 0;
error_neut_tris = 0;
error_neut_furi = 0;
error_neut_disg = 0;
error_neut_mied = 0;

error_feliz = 0;
correcto_feliz = 0;
error_feli_neut = 0;
error_feli_tris = 0;
error_feli_furi = 0;
error_feli_disg = 0;
error_feli_mied = 0;


error_triste  = 0;
correcto_triste = 0;
error_tris_feli = 0;
error_tris_neut = 0;
error_tris_furi = 0;
error_tris_disg = 0;
error_tris_mied = 0;


error_furioso = 0;
correcto_furioso = 0;
error_furi_feli = 0;
error_furi_neut = 0;
error_furi_tris = 0;
error_furi_disg = 0;
error_furi_mied = 0;


error_disgusto = 0;
correcto_disgusto = 0;
error_disg_feli = 0;
error_disg_neut = 0;
error_disg_tris = 0;
error_disg_furi = 0;
error_disg_mied = 0;


error_miedo = 0;
correcto_miedo = 0;
error_mied_feli = 0;
error_mied_neut = 0;
error_mied_tris = 0;
error_mied_furi = 0;
error_mied_disg = 0;


for i = 1 : length(caract_prueba_neut(1,:))
    valor_clase = log(pdf_c(caract_prueba_neut(:,i),media_neut2, Q_neut2 + regu));
    clase = 'n';

    valor_clase2 = log(pdf_c(caract_prueba_neut(:,i),media_feli2,Q_feli2 + regu));
    if valor_clase2 > valor_clase
        clase = 'h';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_neut(:,i),media_tris2,Q_tris2 + regu));
    if valor_clase2 > valor_clase
        clase = 's';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_neut(:,i),media_furi2,Q_furi2 + regu));
    if valor_clase2 > valor_clase
        clase = 'a';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_neut(:,i),media_disg2,Q_disg2 + regu));
    if valor_clase2 > valor_clase
        clase = 'd';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_neut(:,i),media_mied2,Q_mied2 + regu));
    if valor_clase2 > valor_clase
        clase = 'f';
        valor_clase = valor_clase2;
    end

    if clase == 'n'
        correcto_neutro = correcto_neutro + 1;
    else
        error_neutro = error_neutro + 1;
        
        if clase == 'h'
            error_neut_feli = error_neut_feli + 1;
        elseif clase == 's'
            error_neut_tris = error_neut_tris + 1;
        elseif clase == 'a'
            error_neut_furi = error_neut_furi + 1;
        elseif clase == 'd'
            error_neut_disg = error_neut_disg + 1;
        elseif clase == 'f'
            error_neut_mied = error_neut_mied + 1;
        end
    end

end

for i = 1 : length(caract_prueba_feli(1,:))
    valor_clase = log(pdf_c(caract_prueba_feli(:,i),media_neut2,Q_neut2 + regu));
    clase = 'n';

    valor_clase2 = log(pdf_c(caract_prueba_feli(:,i),media_feli2,Q_feli2 + regu));
    if valor_clase2 > valor_clase
        clase = 'h';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_feli(:,i),media_tris2,Q_tris2 + regu));
    if valor_clase2 > valor_clase
        clase = 's';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_feli(:,i),media_furi2,Q_furi2 + regu));
    if valor_clase2 > valor_clase
        clase = 'a';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_feli(:,i),media_disg2,Q_disg2 + regu));
    if valor_clase2 > valor_clase
        clase = 'd';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_feli(:,i),media_mied2,Q_mied2 + regu));
    if valor_clase2 > valor_clase
        clase = 'f';
        valor_clase = valor_clase2;
    end

    if clase == 'h'
        correcto_feliz = correcto_feliz + 1;
    else
        error_feliz = error_feliz + 1;
        
        if clase == 'n'
            error_feli_neut = error_feli_neut + 1;
        elseif clase == 's'
            error_feli_tris = error_feli_tris + 1;
        elseif clase == 'a'
            error_feli_furi = error_feli_furi + 1;
        elseif clase == 'd'
            error_feli_disg = error_feli_disg + 1;
        elseif clase == 'f'
            error_feli_mied = error_feli_mied + 1;
        end
    end

end


for i = 1 : length(caract_prueba_tris(1,:))
    valor_clase = log(pdf_c(caract_prueba_tris(:,i),media_neut2,Q_neut2 + regu));
    clase = 'n';

    valor_clase2 = log(pdf_c(caract_prueba_tris(:,i),media_feli2,Q_feli2 + regu));
    if valor_clase2 > valor_clase
        clase = 'h';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_tris(:,i),media_tris2,Q_tris2 + regu));
    if valor_clase2 > valor_clase
        clase = 's';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_tris(:,i),media_furi2,Q_furi2 + regu));
    if valor_clase2 > valor_clase
        clase = 'a';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_tris(:,i),media_disg2,Q_disg2 + regu));
    if valor_clase2 > valor_clase
        clase = 'd';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_tris(:,i),media_mied2,Q_mied2 + regu));
    if valor_clase2 > valor_clase
        clase = 'f';
        valor_clase = valor_clase2;
    end

    if clase == 's'
        correcto_triste = correcto_triste + 1;
    else
        error_triste = error_triste + 1;
        
        if clase == 'n'
            error_tris_neut = error_tris_neut + 1;
        elseif clase == 'h'
            error_tris_feli = error_tris_feli + 1;
        elseif clase == 'a'
            error_tris_furi = error_tris_furi + 1;
        elseif clase == 'd'
            error_tris_disg = error_tris_disg + 1;
        elseif clase == 'f'
            error_tris_mied = error_tris_mied + 1;
        end
    end

end


for i = 1 : length(caract_prueba_furi(1,:))
    valor_clase = log(pdf_c(caract_prueba_furi(:,i),media_neut2,Q_neut2 + regu));
    clase = 'n';

    valor_clase2 = log(pdf_c(caract_prueba_furi(:,i),media_feli2,Q_feli2 + regu));
    if valor_clase2 > valor_clase
        clase = 'h';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_furi(:,i),media_tris2,Q_tris2 + regu));
    if valor_clase2 > valor_clase
        clase = 's';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_furi(:,i),media_furi2,Q_furi2 + regu));
    if valor_clase2 > valor_clase
        clase = 'a';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_furi(:,i),media_disg2,Q_disg2 + regu));
    if valor_clase2 > valor_clase
        clase = 'd';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_furi(:,i),media_mied2,Q_mied2 + regu));
    if valor_clase2 > valor_clase
        clase = 'f';
        valor_clase = valor_clase2;
    end

    if clase == 'a'
        correcto_furioso = correcto_furioso + 1;
    else
        error_furioso = error_furioso + 1;
        
        if clase == 'n'
            error_furi_neut = error_furi_neut + 1;
        elseif clase == 'h'
            error_furi_feli = error_furi_feli + 1;
        elseif clase == 's'
            error_furi_tris = error_furi_tris + 1;
        elseif clase == 'd'
            error_furi_disg = error_furi_disg + 1;
        elseif clase == 'f'
            error_furi_mied = error_furi_mied + 1;
        end
    end

end


for i = 1 : length(caract_prueba_disg(1,:))
    valor_clase = log(pdf_c(caract_prueba_disg(:,i),media_neut2,Q_neut2 + regu));
    clase = 'n';

    valor_clase2 = log(pdf_c(caract_prueba_disg(:,i),media_feli2,Q_feli2 + regu));
    if valor_clase2 > valor_clase
        clase = 'h';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_disg(:,i),media_tris2,Q_tris2 + regu));
    if valor_clase2 > valor_clase
        clase = 's';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_disg(:,i),media_furi2,Q_furi2 + regu));
    if valor_clase2 > valor_clase
        clase = 'a';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_disg(:,i),media_disg2,Q_disg2 + regu));
    if valor_clase2 > valor_clase
        clase = 'd';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_disg(:,i),media_mied2,Q_mied2 + regu));
    if valor_clase2 > valor_clase
        clase = 'f';
        valor_clase = valor_clase2;
    end

    if clase == 'd'
        correcto_disgusto = correcto_disgusto + 1;
    else
        error_disgusto = error_disgusto + 1;
        
        if clase == 'n'
            error_disg_neut = error_disg_neut + 1;
        elseif clase == 'h'
            error_disg_feli = error_disg_feli + 1;
        elseif clase == 's'
            error_disg_tris = error_disg_tris + 1;
        elseif clase == 'a'
            error_disg_furi = error_disg_furi + 1;
        elseif clase == 'f'
            error_disg_mied = error_disg_mied + 1;
        end
    end

end


for i = 1 : length(caract_prueba_mied(1,:))
    valor_clase = log(pdf_c(caract_prueba_mied(:,i),media_neut2,Q_neut2 + regu));
    clase = 'n';

    valor_clase2 = log(pdf_c(caract_prueba_mied(:,i),media_feli2,Q_feli2 + regu));
    if valor_clase2 > valor_clase
        clase = 'h';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_mied(:,i),media_tris2,Q_tris2 + regu));
    if valor_clase2 > valor_clase
        clase = 's';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_mied(:,i),media_furi2,Q_furi2 + regu));
    if valor_clase2 > valor_clase
        clase = 'a';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_mied(:,i),media_disg2,Q_disg2 + regu));
    if valor_clase2 > valor_clase
        clase = 'd';
        valor_clase = valor_clase2;
    end

    valor_clase2 = log(pdf_c(caract_prueba_mied(:,i),media_mied2,Q_mied2 + regu));
    if valor_clase2 > valor_clase
        clase = 'f';
        valor_clase = valor_clase2;
    end

    if clase == 'f'
        correcto_miedo = correcto_miedo + 1;
    else
        error_miedo = error_miedo + 1;
        
        if clase == 'n'
            error_mied_neut = error_mied_neut + 1;
        elseif clase == 'h'
            error_mied_feli = error_mied_feli + 1;
        elseif clase == 's'
            error_mied_tris = error_mied_tris + 1;
        elseif clase == 'a'
            error_mied_furi = error_mied_furi + 1;
        elseif clase == 'd'
            error_mied_disg = error_mied_disg + 1;
        end
    end

end

error_total = error_disgusto + error_feliz + error_furioso + error_miedo + error_neutro + error_triste

correcto_total = correcto_disgusto + correcto_feliz + correcto_furioso + correcto_miedo + correcto_neutro + correcto_triste

error_porcentaje = error_total/(error_total + correcto_total)

Clase = {'Neutral';'Feliz';'Triste';'Furioso';'Disgusto';'Miedo'};

Neutral = [correcto_neutro;error_feli_neut;error_tris_neut;error_furi_neut;error_disg_neut;error_mied_neut];
Feliz = [error_neut_feli;correcto_feliz;error_tris_feli;error_furi_feli;error_disg_feli;error_mied_feli];
Triste = [error_neut_tris;error_feli_tris;correcto_triste;error_furi_tris;error_disg_tris;error_mied_tris];
Furioso = [error_neut_furi;error_feli_furi;error_tris_furi;correcto_furioso;error_disg_furi;error_mied_furi];
Disgusto = [error_neut_disg;error_feli_disg;error_tris_disg;error_furi_disg;correcto_disgusto;error_mied_disg];
Miedo = [error_neut_mied;error_feli_mied;error_tris_mied;error_furi_mied;error_disg_mied;correcto_miedo];

T = table(Clase,Neutral,Feliz,Triste,Furioso,Disgusto,Miedo)
