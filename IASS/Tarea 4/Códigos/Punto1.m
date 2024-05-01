%% 
imagen = imread('paisaje.tif');
J = histeq(imagen);

imshow(imagen);
figure

imshowpair(imagen,J,'montage')
axis off

figure 

% Histogramas

vector = zeros(1,255);
vector2 = zeros(1,255);
ejex = 1:1:255;

for i=1:size(J,1)
    for j=1:size(J,2)
        indice = imagen(i,j);
        indice2 = J(i,j);
        vector(indice+1) = vector(indice+1)+1;
        vector2(indice2+1) = vector2(indice2+1)+1;
    end
end

vector = vector/(300*399);
vector2 = vector2/(300*399);

% Funciones de distribución acumulada

acum1 = zeros(length(vector),1);
acum2 = zeros(length(vector2),1);

for i=1:length(acum1)
   if i==1
      acum1(i) = vector(i);
      acum2(i) = vector2(i);
   else
      acum1(i) = (vector(i) + acum1(i-1)); 
      acum2(i) = (vector2(i) + acum2(i-1)); 
   end
end

stem(ejex, vector)
ylabel('p(r_k)','FontSize',20,'FontWeight','bold')
hold on
yyaxis right
plot(ejex, acum1)
title('Histograma original','FontSize',20,'FontWeight','bold')
xlabel('Valor RGB (r_k)','FontSize',20,'FontWeight','bold')
ylabel('Distribución acumulada','FontSize',20,'FontWeight','bold')
grid on
ax = gca;
ax.FontSize = 16; 
% ylim([0 13e4])

figure

stem(ejex, vector2)
ylabel('p(r_k)','FontSize',20,'FontWeight','bold')
hold on
yyaxis right
plot(ejex, acum2)
title('Histograma ecualizado','FontSize',20,'FontWeight','bold')
xlabel('Valor RGB (r_k)','FontWeight','bold')
ylabel('Distribución acumulada','FontWeight','bold')
grid on
ax = gca;
ax.FontSize = 16; 