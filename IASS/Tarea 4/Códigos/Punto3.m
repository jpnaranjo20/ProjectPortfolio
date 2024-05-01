%% a) Convolución de imágenes

% Ver la función convolucionImagen.m

%% b) Prueba con la imagen ladron.jpg y dos filtros de blurring y edge detection

% Se lee la imagen y se decalarn las matrices relacionadas a los kernel
% requeridos para cada operación (blurring, edge detection).

ladron = imread('ladron.jpg');
b = 3;
c = 9;
d = 8;

blurring = [1/c 1/c 1/c;
            1/c 0 1/c;
            1/c 1/c 1/c];

edge = [-1 -1 -1;
        -1 8 -1;
        -1 -1 -1;];

% Se convoluciona la imagen original con cada kernel para obtener una
% imagen de salida correspondiente al efecto de ese kernel.
borrosa = convolucionImagen(ladron, blurring);
detecBordes = convolucionImagen(ladron, edge);

%% 
imshow(ladron);
figure
imshow(borrosa);
figure 
imshow(detecBordes);

%% c) Transformada de Fourier

% Prueba
negro = imread('negro2.png');
negro = rgb2gray(negro);

Y = fft2(negro);
magY = abs(Y);
Ysh = fftshift(Y);
% Se aplica conversión logarítmica para adecuarse al tamaño de 8 bits.
Ylog = log(1+abs(Ysh));
figure(1);imagesc(Ylog);title('Transformada de Fourier de la imagen de prueba')

%%

Yoriginal = fft2(ladron);
magYoriginal = abs(Yoriginal);
Yshoriginal = fftshift(Yoriginal);
% Se aplica conversión logarítmica para adecuarse al tamaño de 8 bits.
Ylogoriginal = log(1+abs(Yshoriginal));
figure(2);imagesc(Ylogoriginal);title('Transformada de Fourier de la imagen original')
colorbar

Yblur = fft2(borrosa);
magYblur = abs(Yblur);
Yshblur = fftshift(Yblur);
% Se aplica conversión logarítmica para adecuarse al tamaño de 8 bits.
Ylogblur = log(1+abs(Yshblur));
figure(3);imagesc(Ylogblur);title('Transformada de Fourier de la imagen borroseada')
colorbar

Yedge = fft2(detecBordes);
magYedge = abs(Yedge);
Yshedge = fftshift(Yedge);
% Se aplica conversión logarítmica para adecuarse al tamaño de 8 bits.
Ylogedge = log(1+abs(Yshedge));
figure(4);imagesc(Ylogedge);title('Transformada de Fourier de la imagen con bordes detectados')
colorbar

