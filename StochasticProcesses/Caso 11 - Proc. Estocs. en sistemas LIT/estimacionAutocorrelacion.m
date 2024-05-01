clc, clear all, close all;

t = linspace(-5,10,1000);

pes = [1,2,5,20,100];

for i=1:length(pes)
    
    P = pes(i);
    
    for r=1:P
        x = 0.25*randn(size(t));
        Rx(r,:) = xcorr(x);

        M = 50;
        h = (1/M)*ones(1,M);
        y = filter(h,1,x);
        Ry(r,:) = xcorr(y);

    end

    figure, 
    subplot(311), plot(t,x), hold on, plot(t,y,'linewidth',2), hold off
    title(['Estimaci�n de la autocorrelaci�n con P = ', num2str(P)])
    xlabel('Tiempo discreto'), ylabel('Se�al de ejemplo')
    legend('Se�al de entrada','Se�al de salida')

    tau = linspace(1000,-1000,length(Rx));
    subplot(312), plot(tau,mean(Rx,1)), xlabel('\tau'), ylabel('Autocorr se�al entrada')
    subplot(313), plot(tau,mean(Ry,1)), xlabel('\tau'), ylabel('Autocorr se�al salida') 
end
