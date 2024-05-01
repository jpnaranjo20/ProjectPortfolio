function [Mu,C,alpha] = algoritmoEM(X,K, lambda)
%X matriz de datos
%k número de Gaussianas


largo = X(:,1);
dim = length(X(1,:));

m = length(largo);

% Inicialización de variables

Mu = rand(dim,K);


C = zeros(dim,dim,K);
for i = 1:K
    C(:,:,i) = eye(dim);
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

regu = lambda * eye(dim);
cont = 0;
while cont < 350 && (distancia1 > epsilon && distancia2 > epsilon)
    
    % E-Step
    denominador = 0;
    for r = 1:K

        Nm = mvnpdf(X,Mu(:,r)',C(:,:,r));        
        denominador = denominador + alpha(r) * Nm;

    end
    
    for k = 1:K %Este for recorre las distribuciones, k Gaussianas


        Nm = mvnpdf(X,Mu(:,k)',C(:,:,k));
        numerador = Nm * alpha(k);
        gamma(:,k) = numerador./denominador;

    end

    % M-Step
    N = zeros(K,1);
    Mu = zeros(dim,K);
    C = zeros(dim,dim,K);
    for k = 1:K %Este for recorre las distribuciones, k Gaussianas
        
        
        N(k) = sum(gamma(:,k));
        
        Mu(:,k) = sum(gamma(:,k) .* X)/N(k);
        

        for i = 1:m
            C(:,:,k) = C(:,:,k) + gamma(i,k) * ( transpose(X(i,:)-Mu(1:end,k)') * (X(i,:)-Mu(1:end,k)'));
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






end

