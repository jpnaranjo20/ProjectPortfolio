%% Señales 2

%% Punto 2 c) ii) 

N = 7;
ref = 0.97*0.5;
resp = 0;

for k=-N:N
    ak = a(k);
    resp = resp + (abs(ak))^2;
    fprintf('k = %f\n', k);
    fprintf('resp = %f\n', resp);
end

% Necesitamos que se cumpla resp >= ref. Esto se logra con un N = 7.

%% Punto 2 c) iii) 
N = 7;

% Vector de armónicos
M = [0 1 ceil(N/4) ceil(N/2) floor(3*N/4) N];

T = 2;
f = 1/T;
m = 10000;
fm = m*1/T;
t = -T/2 : (1/fm) : T/2;
s = @(t) 0.5*(square(2*pi*f*(t+0.5)) + 1);

plot(t, s(t), 'LineWidth', 1);
hold on

% % Reconstruir  x(t) para i = N
for i=1:length(M)
    Y =  xrec(M(i),t);
    plot(t, Y, 'LineWidth', 1);
    str{i}=['M = ' num2str(M(i))];
end
str = cat(2, "Original", str);

title('Reconstrucción de la señal x(t)','FontSize',20','FontWeight','bold')
xlabel('t [s]','FontSize',20','FontWeight','bold')
ylabel('V [V]','FontSize',20,'FontWeight','bold')
ax = gca;
ax.FontSize = 16; 

grid on
hold off
legend(str)

%% Punto 2 c) iv) 

vec = zeros(length(M),1);

for i=1:length(M)
    y =  xrec(M(i),t);
    func = norm((s(t)-y),2)^2;
    vec(i) = func/length(t);
end

figure
hold on
stem(M,vec, 'LineWidth', 2)
grid on
xlabel('M','FontSize',20','FontWeight','bold')
ylabel('||x - s_M||_{2}^{2}','FontSize',20,'FontWeight','bold')
ax = gca;
ax.FontSize = 16; 
