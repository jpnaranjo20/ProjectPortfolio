[x,fs]=audioread('borgesRuido.wav');
x = sum(x, 2) / size(x, 2);
x=x';
tiempo = 0: 1/fs : (length(x)/fs) - (1/fs);

plot(tiempo, x)
grid on
xlabel('t [s]','FontSize',20','FontWeight','bold')
ylabel('Amplitud','FontSize',20','FontWeight','bold')
title('Señal','FontSize',20','FontWeight','bold')

figure

[frec, Xmag] = espectro(x, fs);
plot(frec, Xmag)
grid on
xlabel('f [Hz]')
ylabel('Magnitud del espectro')
title('Espectro de la señal de audio borges.wav')