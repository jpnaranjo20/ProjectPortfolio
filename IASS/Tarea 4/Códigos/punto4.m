%Se leen las im�genes
ladron = imread('ladron.jpg');
ladronborroso = imread('ladronborroso.jpg');
%Se convierten las im�genes a double para realizar operaciones
U = cast(ladron,'double');
V = cast(ladronborroso,'double');
%Se plantea la funci�n a optimizar
func = @(x) norm(V-conv2(U,[x(1), x(2), x(3); 0, 0, 0; x(4), x(5), x(6)], 'same'), 'fro')^2;
%Se definen las condiciones iniciales de la soluci�n
init = zeros(1, 6);
%Se resuelve el problema de optimizaci�n
[sol1, sol2] = fminunc(func, init);
%Se define el kernel con la soluci�n hallada
H = [sol1(1), sol1(2), sol1(3); 0, 0, 0; sol1(4), sol1(5), sol1(6)];
%preguntar
U = double(U)/256;
%Se filtra la imagen original con el kernel encontrado en la soluci�n
filtrada = imfilter(U, H);
%Se muestran las tres im�genes (ladron, ladronborroso y filtrada)
figure(4)
subplot(1,3,1)
imshow(ladron)
subplot(1,3,2)
imshow(ladronborroso)
subplot(1,3,3)
imshow(filtrada)