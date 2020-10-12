clear 

s = tf('s');

K = 1;
T = 0.2;

% Discretização pelo método ZOH
Gs = 1/(s*(s+1))
KGs = K*Gs
Gz = c2d(Gs, T, 'zoh')
KGz = K*Gz

w = s
% Aplicar ao resultado de Gz a seguinte substituição
z = (1+(T/2)*w)/(1-(T/2)*w)
Gw = (0.018730753077982*z + 0.017523096306422)/(z^2 -1.818730753077982*z + 0.818730753077982)
Gw = minreal(Gw, 1*10^(-5))

% Desenvolvendo o resultado de Gw manualmento, chegamos à Gww
Gww = ((1+w/300)*(1-w/10))/(w*(w+1))


% Cáculo de K para que Kv = 2
syms z
Kv = 2

delayTimesGz = ((1-z^(-1))*((0.01873*z + 0.01752))/(z^2 - 1.8187*z + 0.8187))

oneOverK = limit(delayTimesGz/(Kv*T), z, 1)
K = double(1/oneOverK)

margin(K*Gww)

% Pelo diagrama de bode, o sistema precisa de mais 20˚ para atingir 50˚ de
% margem de fase, como margem de segurança -> 30˚
angle = 30
sphi = sin(pi*(angle)/180)

syms a
alpha = eval(solve(sphi == (1-a)/(1+a), a))


% Encontrar a frequência onde a magnitude é igual a -20log(1/sqrt(alpha))
syms x
magDB = -20*log10(1/sqrt(alpha))

mag = 10^(magDB/(20))

freq = solve(((2*sqrt(1+(x/300)^2)*sqrt(1+(x/10)^2))/(x*sqrt(1+x^2))) == mag, x)
freq = eval(freq)

for i = [1:2]
    if imag(freq(i)) == 0
        tau = 1/(freq(i)*sqrt(alpha))
    end
end    

% O compensador em avanço tem forma (1+tau*w)/(1+alpha*tau*w)
Gdw = (1+tau*w)/(1+alpha*tau*w)

z = tf('z')
w = (2/T)*((z-1)/(z+1))

Gdz = (0.9914*w + 1)/(0.3305*w + 1)
Gdz = minreal(Gdz, 10^(-5)) 

% margin(K*Gww)
% hold on
% margin(K*Gdw*Gww)
% hold on
margin(K*Gz*Gdz)
