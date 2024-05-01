%% Punto 1.a.
close all
clear all
clc
load('datosiris.txt')
largo = datosiris(:,1);
ancho = datosiris(:,2);

scatter(largo,ancho,'.k')
grid on
xlabel('Largo (cm)')
ylabel('Ancho (cm)')
title('SÈpalos de flores tipo Iris')

%% Punto 1.b.

close all
clear all
clc
load('datosiris.txt')
largo = datosiris(:,1);
ancho = datosiris(:,2);

figure(1)
scatter(largo,ancho,'.k')
hold all

figure(2)
scatter(largo,ancho,'.k')
hold all

K = 4; %N√∫mero de Gaussianas
m = length(largo);

% Inicializaci√≥n de variables
Mu = rand(2,K).*10;

C = zeros(2,2,K);
for i = 1:K
    C(1,1,i) = 1;
    C(2,2,i) = 1;
end


alpha = zeros(K,1);
for i = 1:K
    alpha(i,1) = 1/K;
end


distancia1 = 1e10;
distancia2 = 1e10;
epsilon = 0.001;
C_ant = C;
Mu_ant = Mu;

regu = 0.01 * eye(2);
cont = 0;
while cont < 1000 && (distancia1 > epsilon && distancia2 > epsilon)
    
    % E-Step
    denominador = 0;
    for r = 1:K

%         Nm_org = mvnpdf(datosiris,Mu(:,r)',C(:,:,r));
        
        Nm = zeros(150,1);
        for i = 1:m
            xi = [largo(i),ancho(i)]';
            Nm(i) = exp(-1/2 .* (xi' - Mu(:,r)') * inv(C(:,:,r)) * (xi - Mu(:,r)));
            Nm(i) = Nm(i)/(sqrt(det(C(:,:,r)))*(2*pi)^(2/2));
        end
        denominador = denominador + alpha(r) * Nm;

    end
    
    for k = 1:K %Este for recorre las distribuciones, 3 Gaussianas

%         Nm_org = mvnpdf(datosiris,Mu(:,k)',C(:,:,k));
        Nm = zeros(150,1);
        for i = 1:m
            xi = [largo(i),ancho(i)]';
            Nm(i) = exp(-1/2 * (xi' - Mu(:,k)') * inv(C(:,:,k)) * (xi - Mu(:,k)));
            Nm(i) = Nm(i)/(sqrt(det(C(:,:,k)))*(2*pi)^(2/2));
        end
        numerador = Nm * alpha(k);

        gamma(:,k) = numerador./denominador;

    end

    % M-Step
    N = zeros(K,1);
    Mu = zeros(2,K);
    C = zeros(2,2,K);
    for k = 1:K %Este for recorre las distribuciones, 3 Gaussianas
        
        
        N(k) = sum(gamma(:,k));
        
        Mu(:,k) = sum(gamma(:,k) .* datosiris)/N(k);
        

        for i = 1:m
            xi = [largo(i),ancho(i)]';
            C(:,:,k) = C(:,:,k) + gamma(i,k) * ( (xi-Mu(1:2,k)) * (xi-Mu(1:2,k))' );
        end
        
        C(:,:,k) = C(:,:,k) / N(k) + regu;
        alpha(k) = N(k)/m;
    end
    
    distancia1 = 0;
    for i = 1:K
        distancia1 = distancia1 + norm(C_ant(:,:,K)-C(:,:,K));
    end
    
    distancia2 = norm(Mu_ant-Mu);
    
    
    C_ant = C;
    Mu_ant = Mu;
    
    cont = cont + 1;
end


u = linspace(-8,10,1000);
ejey = linspace(2,4.5);

[X,Y] = meshgrid(u,u);

Zt = 0;
for i = 1:K
    aux = mvnpdf([X(:),Y(:)],Mu(:,i)',C(:,:,i));
    Z = reshape(aux,size(X));
    Zt = Zt + Z * alpha(i);
    figure(2)
    contour(X,Y,Z)
    hold all
    xlim([4,8])
    ylim([2,5])
    grid on
    xlabel('Largo (cm)')
    ylabel('Ancho (cm)')
    title('SÈpalos de flores tipo Iris')
end

figure(1)
hold all
contour(X,Y,Zt)

xlim([4,8])
ylim([2,5])
grid on
xlabel('Largo (cm)')
ylabel('Ancho (cm)')
title('SÈpalos de flores tipo Iris')
