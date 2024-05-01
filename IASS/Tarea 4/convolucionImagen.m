function [convolucionada] = convolucionImagen(imagen, kernel)

% Entradas:
% imagen -> una matriz de MxN que corresponde a la imagen a la que se le
% aplica la convoluci�n.
% kernel -> una matriz de nxn que corresponde al kernel/filtro usado para
% convolucionar.

% Salidas:
% convolucionada -> imagen (matriz) resultante del proceso de convoluci�n.

% Declaraci�n de filas y columnas de la imagen de entrada
M = size(imagen, 1);
N = size(imagen, 2);

% Cantidad de filas y columnas del kernel, que es una matriz cuadrada.
filasKernel = size(kernel, 1);

% Se inicializa la salida.
convolucionada = zeros(M,N);

% Se recorre toda la imagen y el kernel.
for i=1:M
   for j=1:N
      for s=1:filasKernel
          for t=1:filasKernel
              
              % Para hacer la convoluci�n, se deben multiplicar los p�xeles
              % debajo del kernel. Sin embargo, esto genera problemas para
              % las esquinas de la imagen, as� como para toda la primera
              % fila y columna como para la �ltima fila y columna. Por lo
              % tanto, en caso de encontrarse por fuera de estas filas y
              % columnas, se realiza la operaci�n de convoluci�n sin
              % problema de acuerdo a la ecuaci�n. De lo contrario, los
              % valores del kernel que no tienen un valor correspondiente
              % dentro de la imagen se mapean a 0.
              if i+s-filasKernel+1 >= 1 && i+s-filasKernel+1 <= M && j+t-filasKernel+1 >= 1 && j+t-filasKernel+1 <= N
                  convolucionada(i,j) = convolucionada(i,j) + kernel(s,t)*imagen(i+s-filasKernel+1, j+t-filasKernel+1);
              else
                  convolucionada(i,j) = convolucionada(i,j) + 0;
              end
          end
      end
   end
end

% Para poder visualizar la imagen, los datos tienen que estar en formato
% uint8.
convolucionada = uint8(convolucionada);


end