% Limpa a workspace
clear

% Definicao do tempo de amostragem
Ts = 0.1

% Definicao da funcao de transferencia da planta
z = tf('z', Ts);

% G_z = -0.003678*((z+0.7183)/(z-1)*(z-0.3678))
w = tf('s')
z = (1 + (Ts/2)*w)/(1 - (Ts/2)*w)

% G_w = 0.003678*((z+0.7183)/((z-1)*(z-0.3678)))
G_w2 = 55*0.003678*(((0.01406*w + 1.7188)*(1- 0.05*w))/((0.1*w)*(0.06839*w + 0.6322)))

% zero(G_w)
% zero(G_w2)
% pole(G_w)
% pole(G_w2)

% bode(G_w2)
margin(G_w2)
