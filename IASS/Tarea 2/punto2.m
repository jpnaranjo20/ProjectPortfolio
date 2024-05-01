%% Punto 2

% a)
[pcgN, tN, fsN] = cargarAudio('pcgNormal.wav');
[pcgP, tP, fsP] = cargarAudio('pcgPatologica.wav');

subplot(2,1,1)
plot(tN, pcgN)
grid on
xlabel('t [s]','FontSize',20','FontWeight','bold')
ylabel('Amplitud','FontSize',20','FontWeight','bold')
title('PCG Normal','FontSize',20','FontWeight','bold')
axis([0 12 -0.8 0.8])
ax = gca;

subplot(2,1,2)
plot(tP, pcgP)
grid on
xlabel('t [s]','FontSize',20','FontWeight','bold')
ylabel('Amplitud','FontSize',20','FontWeight','bold')
title('PCG Patológica','FontSize',20','FontWeight','bold')
axis([0 12 -0.8 0.8])

% b)

[fnormal, Xnormal] = espectro(pcgN, fsN);
[fpat, Xpat] = espectro(pcgP, fsP);

figure

subplot(2,1,1)
plot(fnormal, Xnormal)
grid on
xlabel('f [Hz]','FontSize',20','FontWeight','bold')
ylabel('Amplitud del espectro','FontSize',20','FontWeight','bold')
title('Espectro del PCG Normal','FontSize',20','FontWeight','bold')
axis([-500 500 0 5000])

subplot(2,1,2)
plot(fpat, Xpat)
grid on
xlabel('f [Hz]','FontSize',20','FontWeight','bold')
ylabel('Amplitud del espectro','FontSize',20','FontWeight','bold')
title('Espectro del PCG Patológico','FontSize',20','FontWeight','bold')

axis([-500 500 0 5000])
