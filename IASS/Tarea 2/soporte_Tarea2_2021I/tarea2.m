%% Tarea 2 - Señales 2

%% Punto 1

% b)
[s, t, fs] = cargarAudio('borges.wav');
[frec, Xmag] = espectro(s, fs);

% Gráfica del espectro de la señal de audio
plot(frec, Xmag)
grid on
xlabel('f [Hz]')
ylabel('Magnitud del espectro')
title('Espectro de la señal de audio borges.wav')

% c)
fs1 = 10000;
fs2 = 20000;
fs3 = 6000;

subplot(3, 1, 1)
[f1, Xmag1] = espectro(s, fs1);
plot(f1, Xmag1)
axis([-11000 11000 0 300])
grid on
xlabel('f [Hz]')
ylabel('Magnitud del espectro')
title('Espectro del audio con fs_1 = 10kHz')

subplot(3, 1, 2)
[f2, Xmag2] = espectro(s, fs2);
plot(f2, Xmag2)
axis([-11000 11000 0 300])
grid on
xlabel('f [Hz]')
ylabel('Magnitud del espectro')
title('Espectro del audio con fs_2 = 20kHz')

subplot(3, 1, 3)
[f3, Xmag3] = espectro(s, fs3);
plot(f3, Xmag3)
axis([-11000 11000 0 300])
grid on
xlabel('f [Hz]')
ylabel('Magnitud del espectro')
title('Espectro del audio con fs_3 = 6kHz')

% d)

% Con fs1
% soundsc(s, fs1);

% Con fs2
% soundsc(s, fs2);

% Con fs3
soundsc(s, fs3);

% Es claro que los audios escuchados con una frecuencia de muestreo mayor
% se escuchan más rápido por la presencia de frecuencias más altas en su
% contenido espectral. Por ejemplo, con fs2, se escucha muy rápido y agudo el audio
% porque con esta frecuencia de muestreo, el espectro demusestra la
% presencia de frecuencias muy altas. El caso contrario sucede con fs3,
% pues su espectro muestra presencia de frecuencias muy bajas, lo que
% ocasiona que se escuche lento y grave.

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

% c)

% De acuerdo a la información obtenida en el espectro de la señal normal
% como la señal patológica, se puede afirmar que a partir de una frecuencia
% de aproximadamente 270 Hz, el espectro de la señal patológica demuestra
% tener una amplitud mucho mayor a la amplitud del espectro de la señal
% normal. Por esta razón, un sistema que pueda detectar de forma automática
% una regurgitación aórtica puede ser un filtro pasa altas con frecuencia
% de corte de 270 Hz, pues así se quita la parte del espectro que es casi
% idéntico y solo quedan las partes diferentes, y se decide por el espectro
% que tenga una magnitud mayor después de pasar por el filtro.

%% Punto 3

%% letra a
[xa1,tiempoa1,fsa1]=cargarAudio('a1.wav');
[xa2,tiempoa2,fsa2]=cargarAudio('a2.wav');
[xa3,tiempoa3,fsa3]=cargarAudio('a3.wav');
[xa4,tiempoa4,fsa4]=cargarAudio('a4.wav');
[xa5,tiempoa5,fsa5]=cargarAudio('a5.wav');
[xa6,tiempoa6,fsa6]=cargarAudio('a6.wav');
[xa7,tiempoa7,fsa7]=cargarAudio('a7.wav');
[xa8,tiempoa8,fsa8]=cargarAudio('a8.wav');

[freca1,Xmaga1]=espectro(xa1,fsa1);
[freca2,Xmaga2]=espectro(xa2,fsa2);
[freca3,Xmaga3]=espectro(xa3,fsa3);
[freca4,Xmaga4]=espectro(xa4,fsa4);
[freca5,Xmaga5]=espectro(xa5,fsa5);
[freca6,Xmaga6]=espectro(xa6,fsa6);
[freca7,Xmaga7]=espectro(xa7,fsa7);
[freca8,Xmaga8]=espectro(xa8,fsa8);

plot(freca1,Xmaga1,freca2,Xmaga2,freca3,Xmaga3,freca4,Xmaga4,freca5,Xmaga5,freca6,Xmaga6,freca7,Xmaga7,freca8,Xmaga8)
title('Espectro de Frecuencia - Letra a')
xlabel('Frecuencia en Hertz')
ylabel('Amplitud')
xlim([-9000 9000])
ejex = -9000:500:9000;
xticks(ejex)
%% letra i
[xi1,tiempoi1,fsi1]=cargarAudio('i1.wav');
[xi2,tiempoi2,fsi2]=cargarAudio('i2.wav');
[xi3,tiempoi3,fsi3]=cargarAudio('i3.wav');
[xi4,tiempoi4,fsi4]=cargarAudio('i4.wav');
[xi5,tiempoi5,fsi5]=cargarAudio('i5.wav');
[xi6,tiempoi6,fsi6]=cargarAudio('i6.wav');
[xi7,tiempoi7,fsi7]=cargarAudio('i7.wav');
[xi8,tiempoi8,fsi8]=cargarAudio('i8.wav');

[freci1,Xmagi1]=espectro(xi1,fsi1);
[freci2,Xmagi2]=espectro(xi2,fsi2);
[freci3,Xmagi3]=espectro(xi3,fsi3);
[freci4,Xmagi4]=espectro(xi4,fsi4);
[freci5,Xmagi5]=espectro(xi5,fsi5);
[freci6,Xmagi6]=espectro(xi6,fsi6);
[freci7,Xmagi7]=espectro(xi7,fsi7);
[freci8,Xmagi8]=espectro(xi8,fsi8);

plot(freci1,Xmagi1,freci2,Xmagi2,freci3,Xmagi3,freci4,Xmagi4,freci5,Xmagi5,freci6,Xmagi6,freci7,Xmagi7,freci8,Xmagi8)
title('Espectro de Frecuencia - Letra i')
xlabel('Frecuencia en Hertz')
ylabel('Amplitud')
xlim([-9000 9000])
ejex = -9000:500:9000;
xticks(ejex)
%% letra u
[xu1,tiempou1,fsu1]=cargarAudio('u1.wav');
[xu2,tiempou2,fsu2]=cargarAudio('u2.wav');
[xu3,tiempou3,fsu3]=cargarAudio('u3.wav');
[xu4,tiempou4,fsu4]=cargarAudio('u4.wav');
[xu5,tiempou5,fsu5]=cargarAudio('u5.wav');
[xu6,tiempou6,fsu6]=cargarAudio('u6.wav');
[xu7,tiempou7,fsu7]=cargarAudio('u7.wav');
[xu8,tiempou8,fsu8]=cargarAudio('u8.wav');

[frecu1,Xmagu1]=espectro(xu1,fsu1);
[frecu2,Xmagu2]=espectro(xu2,fsu2);
[frecu3,Xmagu3]=espectro(xu3,fsu3);
[frecu4,Xmagu4]=espectro(xu4,fsu4);
[frecu5,Xmagu5]=espectro(xu5,fsu5);
[frecu6,Xmagu6]=espectro(xu6,fsu6);
[frecu7,Xmagu7]=espectro(xu7,fsu7);
[frecu8,Xmagu8]=espectro(xu8,fsu8);

plot(frecu1,Xmagu1,frecu2,Xmagu2,frecu3,Xmagu3,frecu4,Xmagu4,frecu5,Xmagu5,frecu6,Xmagu6,frecu7,Xmagu7,frecu8,Xmagu8)
title('Espectro de Frecuencia - Letra u')
xlabel('Frecuencia en Hertz')
ylabel('Amplitud')
xlim([-9000 9000])
ejex = -9000:500:9000;
xticks(ejex)

