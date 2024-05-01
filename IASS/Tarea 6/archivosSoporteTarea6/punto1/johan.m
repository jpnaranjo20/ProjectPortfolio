clear all, close all, clc;

% Defina numero de imagenes y numero de puntos
sequence_length = 4;
points_number = 12;

%%--------------------------------------------------------------------
% Importe la informacion de los puntos de las imagenes de acuerdo al formato dado por el archivo getPoints.m

%---- Escriba aqui su codigo. El vector de celdas 'ip' debe contener la informacion
ip = getPoints(sequence_length,points_number);
%%


% Remover media de los datos
ipnorm = cell(1,sequence_length);
af = ones(1,sequence_length);
bf = ones(1,sequence_length);
D = [];

for i = 1 : sequence_length
    af(i) = mean(ip{i}(:,1));
    bf(i) = mean(ip{i}(:,2));
    ipnorm{i} = ip{i}(:,:)' - (diag(mean(ip{i}(:,:)',2))*ones(2,points_number));
    D = [D; ipnorm{i}];
end

%% -------------------------------------------------
% Hacer factorizacion de la matriz de datos D utilizando singular value decomposition

[T,W,Q] = svd(D);

%---- Escriba aqui su codigo. Las matrices A0 y P0 deben ser el resultado de la factorizacion, donde D0=A0P0 es
% la matriz de rango 3 mas cercana a D de acuerdo a la norma Frobenius
TK = T(:,1:3);
WK = W(1:3,1:3);
QK = Q(:,1:3);

A0 = TK*sqrt(WK);
P0 = sqrt(WK)*QK';



%% ----------------------------------------------------- 
% Hacer el Euclidean upgrade. La estructura resultante se llama 'invCP0'

dFdD = [];
nondFdD = [];

for k = 1 : sequence_length
    a11 = A0(2*k-1,1);
    a12 = A0(2*k-1,2);
    a13 = A0(2*k-1,3);
    a21 = A0(2*k,1);
    a22 = A0(2*k,2);
    a23 = A0(2*k,3);
    
    dFdD = [dFdD; a11*a21 a11*a22+a12*a21 a11*a23+a13*a21  a12*a22 a12*a23+a13*a22 a13*a23];
    nondFdD = [nondFdD; a11*a21 a11*a22+a12*a21 a11*a23+a13*a21  a12*a22 a12*a23+a13*a22 a13*a23];
    temp1 = [ a11*a11 a11*a12+a12*a11 a11*a13+a13*a11  a12*a12 a12*a13+a13*a12 a13*a13  ];
    temp2 = [ a21*a21 a21*a22+a22*a21 a21*a23+a23*a21  a22*a22 a22*a23+a23*a22 a23*a23  ];
    
    a1k(:,k) =  [a11 a12 a13]';
    a2k(:,k) =  [a21 a22 a23]';
    
    dFdD = [dFdD; temp1-temp2];
    nondFdD = [nondFdD; temp1; temp2];
end

ooi = [0;1;1];
V9 = inv((nondFdD')*nondFdD)*(nondFdD')*(repmat(ooi,sequence_length,1)) ;
CCT = [ V9(1) V9(2) V9(3); V9(2) V9(4) V9(5); V9(3) V9(5) V9(6);]';
[U,S,V] = svd(CCT);
[aa,bb] = eig(CCT);

if(sum(diag(S)<=0)>0||trace(CCT)<0||sum(diag(bb)<=0)>0)
    posi = 0;
    Cli = U*sqrt(S);
else
    posi = 1;
    Cli = chol(CCT);
end
Cli = Cli';

c11 = Cli(1,1);
c12 = Cli(1,2);
c13 = Cli(1,3);
c21 = Cli(2,1);
c22 = Cli(2,2);
c23 = Cli(2,3);
c31 = Cli(3,1);
c32 = Cli(3,2);
c33 = Cli(3,3);
C = [c11 c12 c13; c21 c22 c23; c31 c32 c33; ];


iteration_number = 100;
for nonl_times = 1 : iteration_number
    dDdC = [];
    dDdC = [dDdC; 2*c11 2*c12  2*c13 0 0 0 0 0 0];    % dD1/dC
    dDdC = [dDdC; c21 c22 c23  c11 c12 c13 0 0 0];    % dD2/dC
    dDdC = [dDdC; c31 c32 c33  0 0 0 c11 c12 c13];    % dD3/dC
    dDdC = [dDdC; 0 0 0 2*c21 2*c22 2*c23 0 0 0];     % dD4/dC
    dDdC = [dDdC; 0 0 0 c31 c32 c33  c21 c22 c23];    % dD5/dC
    dDdC = [dDdC; 0 0 0 0 0 0 2*c31 2*c32  2*c33 ];   % dD6/dC
    
    df = nondFdD * dDdC;
    
    fx = [];
    for k = 1 : sequence_length
        fx = [fx;  a1k(:,k)'*C*C'*a2k(:,k);  (a1k(:,k)'*C*C'*a1k(:,k))-1; (a2k(:,k)'*C*C'*a2k(:,k))-1];
    end
    
    norm(fx);
    beta = 10^2;   % step size = 1/beta;
    delta_k = beta * eye(size(df'*df,1));
    dx = -inv(df'*df + delta_k )*df'*fx/1;
    
    c11 = c11 + dx(1,1);
    c12 = c12 + dx(2,1);
    c13 = c13 + dx(3,1);
    c21 = c21 + dx(4,1);
    c22 = c22 + dx(5,1);
    c23 = c23 + dx(6,1);
    c31 = c31 + dx(7,1);
    c32 = c32 + dx(8,1);
    c33 = c33 + dx(9,1);
    C = [c11 c12 c13; c21 c22 c23; c31 c32 c33; ];
end

InvCP0 = inv(C)*P0;

Ahat = cell(1,sequence_length);
for i = 1: sequence_length
    a1 = A0(2*i-1,:)*C;
    a2 = A0(2*i,:)*C;
    a1 = a1/norm(a1);
    a2 = a2/norm(a2);
    Ahat{i} = [ a1; a2; cross(a1, a2)];
end
A1c = Ahat{1};
InvCP0 = A1c*InvCP0;
for i = 1: sequence_length
    %Ahat{i} = Ahat{i}*inv(A1c);
    Ahat{i} = Ahat{i}/A1c;
    a1 = Ahat{i}(1,:)/norm(Ahat{i}(1,:));
    a2 = Ahat{i}(2,:)/norm(Ahat{i}(2,:));
    Ahat{i} = [ a1; a2; cross(a1, a2)];
end





%%---------------------------------------
% Grafique la reconstriccion 3D 

%---- Escriba aqui su codigo. Grafique la estructura antes del Euclidean upgrade (es decir, P0), y la
% estructura despues del Euclidean upgrade (es decir, invCP0).
%% ANTES DEL EUCLIDEAN UPGRADE
contador = 0;
for i = 1:12
    contador = contador + 1;
    x(contador) = P0(1,i);
    y(contador) = P0(2,i);
    z(contador) = P0(3,i);
    if i == 4
        contador = contador + 1;
        x(contador) = P0(1,1);
        y(contador) = P0(2,1);
        z(contador) = P0(3,1);
        
        contador = contador + 1;
        x(contador) = P0(1,i);
        y(contador) = P0(2,i);
        z(contador) = P0(3,i);
    elseif i == 6
        contador = contador + 1;
        x(contador) = P0(1,3);
        y(contador) = P0(2,3);
        z(contador) = P0(3,3);
        
        contador = contador + 1;
        x(contador) = P0(1,i);
        y(contador) = P0(2,i);
        z(contador) = P0(3,i);
    elseif i == 8
        contador = contador + 1;
        x(contador) = P0(1,5);
        y(contador) = P0(2,5);
        z(contador) = P0(3,5);
        
        contador = contador + 1;
        x(contador) = P0(1,i);
        y(contador) = P0(2,i);
        z(contador) = P0(3,i);
    elseif i == 9
        contador = contador + 1;
        x(contador) = P0(1,7);
        y(contador) = P0(2,7);
        z(contador) = P0(3,7);
        
        contador = contador + 1;
        x(contador) = P0(1,i);
        y(contador) = P0(2,i);
        z(contador) = P0(3,i);
    elseif i == 11
        contador = contador + 1;
        x(contador) = P0(1,7);
        y(contador) = P0(2,7);
        z(contador) = P0(3,7);
        
        contador = contador + 1;
        x(contador) = P0(1,i);
        y(contador) = P0(2,i);
        z(contador) = P0(3,i);
    elseif i == 12
        contador = contador + 1;
        x(contador) = P0(1,2);
        y(contador) = P0(2,2);
        z(contador) = P0(3,2);
        
        contador = contador + 1;
        x(contador) = P0(1,i);
        y(contador) = P0(2,i);
        z(contador) = P0(3,i);
    end
    
end
figure(1)
plot3(x,-y,z)

%% DESPUES DEL EUCLIDEAN UPGRADE
contador = 0;
for i = 1:12
    contador = contador + 1;
    x(contador) = InvCP0(1,i);
    y(contador) = InvCP0(2,i);
    z(contador) = InvCP0(3,i);  
    if i == 4
        contador = contador + 1;
        x(contador) = InvCP0(1,1);
        y(contador) = InvCP0(2,1);
        z(contador) = InvCP0(3,1);
        
        contador = contador + 1;
        x(contador) = InvCP0(1,i);
        y(contador) = InvCP0(2,i);
        z(contador) = InvCP0(3,i);
    elseif i == 6
        contador = contador + 1;
        x(contador) = InvCP0(1,3);
        y(contador) = InvCP0(2,3);
        z(contador) = InvCP0(3,3);
        
        contador = contador + 1;
        x(contador) = InvCP0(1,i);
        y(contador) = InvCP0(2,i);
        z(contador) = InvCP0(3,i);
    elseif i == 8
        contador = contador + 1;
        x(contador) = InvCP0(1,5);
        y(contador) = InvCP0(2,5);
        z(contador) = InvCP0(3,5);
        
        contador = contador + 1;
        x(contador) = InvCP0(1,i);
        y(contador) = InvCP0(2,i);
        z(contador) = InvCP0(3,i);
    elseif i == 9
        contador = contador + 1;
        x(contador) = InvCP0(1,7);
        y(contador) = InvCP0(2,7);
        z(contador) = InvCP0(3,7);
        
        contador = contador + 1;
        x(contador) = InvCP0(1,i);
        y(contador) = InvCP0(2,i);
        z(contador) = InvCP0(3,i);
    elseif i == 11
        contador = contador + 1;
        x(contador) = InvCP0(1,7);
        y(contador) = InvCP0(2,7);
        z(contador) = InvCP0(3,7);
        
        contador = contador + 1;
        x(contador) = InvCP0(1,i);
        y(contador) = InvCP0(2,i);
        z(contador) = InvCP0(3,i);
    elseif i == 12
        contador = contador + 1;
        x(contador) = InvCP0(1,2);
        y(contador) = InvCP0(2,2);
        z(contador) = InvCP0(3,2);
        
        contador = contador + 1;
        x(contador) = InvCP0(1,i);
        y(contador) = InvCP0(2,i);
        z(contador) = InvCP0(3,i);
    end
    
end
figure(2)
plot3(x,-y,z)

%% BONO
imshow('houseimage3.jpg'), hold on,

u = [];
v = [];
for n=1:points_number
    [xi,yi] = ginput(1);
    u(n) = xi;
    v(n) = yi;
end

unos = ones(12,1);
P = [InvCP0(1,:)',InvCP0(2,:)',InvCP0(3,:)',unos];
P = P';
ceros = zeros(4,1);
[n m] = size(P');
Wb = zeros(n*2,12);
cont = 1;

%Cálculo de W
for i = 1:2*n
    if mod(i,2) == 0
        
        Wb(i,1:4) = ceros';
        Wb(i,5:8) = P(:,cont)';
        Wb(i,9:12) = -v(cont).*P(:,cont)';
        
        cont = cont + 1;
    else
        Wb(i,1:4) = P(:,cont)';
        Wb(i,5:8) = ceros';
        Wb(i,9:12) = -u(cont).*P(:,cont)';
    end
    
end

wTw = Wb'*Wb;
[Vb,Db] = eig(wTw);
Db;
Vb;
alpha = 1e10;
vector_menor = 0;

%Se obtiene la posición del vector propio relacionado con el menor valor
%propio.
for i = 1 : 12
    if Db(i,i) < alpha && Db(i,i) ~= 0
        alpha = Db(i,i);
        vector_menor = i;
    end
end
alpha;
m = Vb(:,vector_menor);

%Se separan los vectores m1, m2 y m3
m1 = m(1:4);
m2 = m(5:8);
m3 = m(9:12);

%%
i_casa = imread('houseimage3.jpg');
u1 = round(dot(m1,[InvCP0(1,1),InvCP0(2,1),InvCP0(3,1),1])/dot(m3,[InvCP0(1,1),InvCP0(2,1),InvCP0(3,1),1]));
v1 = round(dot(m2,[InvCP0(1,1),InvCP0(2,1),InvCP0(3,1),1])/dot(m3,[InvCP0(1,1),InvCP0(2,1),InvCP0(3,1),1]));

u2 = round(dot(m1,[InvCP0(1,2),InvCP0(2,2),InvCP0(3,2),1])/dot(m3,[InvCP0(1,2),InvCP0(2,2),InvCP0(3,2),1]));
v2 = round(dot(m2,[InvCP0(1,2),InvCP0(2,2),InvCP0(3,2),1])/dot(m3,[InvCP0(1,2),InvCP0(2,2),InvCP0(3,2),1]));

u3 = round(dot(m1,[InvCP0(1,3),InvCP0(2,3),InvCP0(3,3),1])/dot(m3,[InvCP0(1,3),InvCP0(2,3),InvCP0(3,3),1]));
v3 = round(dot(m2,[InvCP0(1,3),InvCP0(2,3),InvCP0(3,3),1])/dot(m3,[InvCP0(1,3),InvCP0(2,3),InvCP0(3,3),1]));

u4 = round(dot(m1,[InvCP0(1,4),InvCP0(2,4),InvCP0(3,4),1])/dot(m3,[InvCP0(1,4),InvCP0(2,4),InvCP0(3,4),1]));
v4 = round(dot(m2,[InvCP0(1,4),InvCP0(2,4),InvCP0(3,4),1])/dot(m3,[InvCP0(1,4),InvCP0(2,4),InvCP0(3,4),1]));

I2 = imcrop(i_casa,[u1 v1 u4 v4]);
figure(1)
imshow(i_casa)
figure(2)
imshow(I2)
%%
figure(3)
hold on
plot3(x,y,z)

p1 = [InvCP0(1,1),InvCP0(2,1),InvCP0(3,1)]';
p2 = [InvCP0(1,2),InvCP0(2,2),InvCP0(3,2)]';
p3 = [InvCP0(1,3),InvCP0(2,3),InvCP0(3,3)]';

auxA = [p2(2), p3(2);p2(3), p3(3)];
auxB = -[p2(1), p3(1);p2(3), p3(3)];
auxC = [p2(1), p3(1);p2(2), p3(2)];

A_p1 = det(auxA);
B_p1 = det(auxB);
C_p1 = det(auxC);

D_p1 = -A_p1*p1(1)-B_p1*p1(2)-C_p1*p1(3);


p1 = [InvCP0(1,3),InvCP0(2,3),InvCP0(3,3)]';
p2 = [InvCP0(1,4),InvCP0(2,4),InvCP0(3,4)]';
p3 = [InvCP0(1,5),InvCP0(2,5),InvCP0(3,5)]';

auxA = [p2(2), p3(2);p2(3), p3(3)];
auxB = -[p2(1), p3(1);p2(3), p3(3)];
auxC = [p2(1), p3(1);p2(2), p3(2)];

A_p2 = det(auxA);
B_p2 = det(auxB);
C_p2 = det(auxC);

D_p2 = -A_p2*p1(1)-B_p2*p1(2)-C_p2*p1(3);


p1 = [InvCP0(1,5),InvCP0(2,5),InvCP0(3,5)]';
p2 = [InvCP0(1,6),InvCP0(2,6),InvCP0(3,6)]';
p3 = [InvCP0(1,7),InvCP0(2,7),InvCP0(3,7)]';

auxA = [p2(2), p3(2);p2(3), p3(3)];
auxB = -[p2(1), p3(1);p2(3), p3(3)];
auxC = [p2(1), p3(1);p2(2), p3(2)];

A_p3 = det(auxA);
B_p3 = det(auxB);
C_p3 = det(auxC);

D_p3 = -A_p3*p1(1)-B_p3*p1(2)-C_p3*p1(3);


p1 = [InvCP0(1,9),InvCP0(2,9),InvCP0(3,9)]';
p2 = [InvCP0(1,10),InvCP0(2,10),InvCP0(3,10)]';
p3 = [InvCP0(1,11),InvCP0(2,11),InvCP0(3,11)]';

auxA = [p2(2), p3(2);p2(3), p3(3)];
auxB = -[p2(1), p3(1);p2(3), p3(3)];
auxC = [p2(1), p3(1);p2(2), p3(2)];

A_p4 = det(auxA);
B_p4 = det(auxB);
C_p4 = det(auxC);

D_p4 = -A_p4*p1(1)-B_p4*p1(2)-C_p4*p1(3);

p1 = [InvCP0(1,2),InvCP0(2,2),InvCP0(3,2)]';
p2 = [InvCP0(1,11),InvCP0(2,11),InvCP0(3,11)]';
p3 = [InvCP0(1,12),InvCP0(2,12),InvCP0(3,12)]';

auxA = [p2(2), p3(2);p2(3), p3(3)];
auxB = -[p2(1), p3(1);p2(3), p3(3)];
auxC = [p2(1), p3(1);p2(2), p3(2)];

A_p5 = det(auxA);
B_p5 = det(auxB);
C_p5 = det(auxC);

D_p5 = -A_p5*p1(1)-B_p5*p1(2)-C_p5*p1(3);



%%
myIm = imread('houseimage3.jpg');
figure(2)
hold all


% imageIn,upperLeftPoint3,normal,imXDirVec,scale,varargin
imsurf(myIm,[InvCP0(1,4),InvCP0(2,4),InvCP0(3,4)],[A_p1, B_p1, C_p1],0.3);
axis equal
view([-35 35]);
colormap(gray);

%%
i_casa = imread('houseimage3.jpg');
epsilon = 1;
pasos = 1;
for i = -209 : pasos : -60
    for j = 6 : pasos : 192
        for k = -74 : pasos : 338
            
            % Se obtiene los valores 3D de la malla pero transformados a pixeles de la imagen
            u_im = round(dot(m1,[i,j,k,1])/dot(m3,[i,j,k,1]));
            v_im = round(dot(m2,[i,j,k,1])/dot(m3,[i,j,k,1]));
            if  (u_im >= 1 && u_im <= 576) && (v_im >= 1 && v_im <= 768)
                
                p4 = [i,j,k]';

                res1 = A_p1*p4(1)+B_p1*p4(2)+C_p1*p4(3)+D_p1;
                res2 = A_p2*p4(1)+B_p2*p4(2)+C_p2*p4(3)+D_p2;
                res3 = A_p3*p4(1)+B_p3*p4(2)+C_p3*p4(3)+D_p3;
                res4 = A_p4*p4(1)+B_p4*p4(2)+C_p4*p4(3)+D_p4;
                res5 = A_p5*p4(1)+B_p5*p4(2)+C_p5*p4(3)+D_p5;

            
                if (res1 > -epsilon && res1 < epsilon) || (res2 > -epsilon && res2 < epsilon) || (res3 > -epsilon && res3 < epsilon) || (res4 > -epsilon && res4 < epsilon) || (res5 > -epsilon && res5 < epsilon)
                    color = double(i_casa(u_im,v_im))/255;

                    figure(2)
                    hold on
                    scatter3(i,j,k,'.','MarkerFaceColor',[color color color])
                end
            end
        end
    end
end
%%

for i = round(min(InvCP0(1,:))):pasos:round(max(InvCP0(1,:)))
    for j = round(min(InvCP0(2,:))):pasos:round(max(InvCP0(2,:)))
        for k = round(min(InvCP0(3,:))):pasos:round(max(InvCP0(3,:)))
            
            % Se obtiene los valores 3D de la malla pero transformados a pixeles de la imagen
            u_im = round(dot(m1,[i,j,k,1])/dot(m3,[i,j,k,1]));
            v_im = round(dot(m2,[i,j,k,1])/dot(m3,[i,j,k,1]));
            
            if u_im >= u(1) && u_im <= u(2) && v_im >= v(1) && v_im <= v(4) 
                color = double(i_casa(u_im,v_im))/255;

                figure(3)
                hold on
                scatter3(i,j,k,'.','MarkerFaceColor',[color color color])
            end
        end
    end
end




%%
p1 = [0,0,0]';
p2 = [2,0,0]';
p3 = [2,0,2]';

auxA = [p2(2), p3(2);p2(3), p3(3)];
auxB = -[p2(1), p3(1);p2(3), p3(3)];
auxC = [p2(1), p3(1);p2(2), p3(2)];

A = det(auxA);
B = det(auxB);
C = det(auxC);

D = -A*p1(1)-B*p1(2)-C*p1(3);

p4 = [0,1,3]';

res = A*p4(1)+B*p4(2)+C*p4(3)+D
