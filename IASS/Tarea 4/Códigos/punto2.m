%% Punto 2
tabla = table2array(comprimida);
[m n] = size(tabla);

coeficientes = zeros(m,n);
%Los datos de los coeficientes se importan como formato tabla
%Por lo que, en este for se guardan en un arreglo normal.
for i = 1 : m
    for j = 1 : n
        coeficientes(i,j) = str2double(tabla(i,j));
    end
end

figure(1)
imagesc(coeficientes)
colorbar
%%

%Dimensiones imagen original
m_imagen = 630;
n_imagen = 945;

%Dimensiones de los coeficientes
[m_coef, n_coef] = size(coeficientes);

imagen = zeros(m_imagen,n_imagen);

%Recorrido donde "x" y "y" van desde 1 hasta el tamaño total de la imagen
for x = 1 : m_imagen
    for y = 1 : n_imagen

        for u = 1 : m_coef
                
            %Calculo de aplhaU
            if u == 1
                alphaU = 1/sqrt(m_imagen);
            else
                alphaU = sqrt(2/m_imagen);
            end
            
            for v = 1 : n_coef
               %Calculo de aplhaV
                if v == 1
                    alphaV = 1/sqrt(n_imagen);
                else
                    alphaV = sqrt(2/n_imagen);
                end 
                
                imagen(x,y) = imagen(x,y) + alphaU * alphaV * coeficientes(u,v) * cos((pi*(2*(x-1)+1)*(u-1))/(2*m_imagen)) * cos((pi*(2*(y-1)+1)*(v-1))/(2*n_imagen));
                
            end
        end
        
    end
end
figure(2)
imshow(imagen)