clear 

s = tf('s');
 
K = 1;
T = 0.2;

% Discretização pelo método ZOH
Gs = 1/(s*(s+1))
KGs = K*Gs
Gz = c2d(Gs, T, 'zoh')
KGz = K*Gz


% Cáculo de K para que Kv = 2
syms z
Kv = 2

delayTimesGz = ((1-z^(-1))*((0.01873*z + 0.01752))/(z^2 - 1.8187*z + 0.8187))

oneOverK = limit(delayTimesGz/(Kv*T), z, 1)
K = double(1/oneOverK)

margin(K*Gz)

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

freq = solve(((0.01873*x + 0.01752)/(x^2 - 1.819*x + 0.8187)) == mag, x)
freq = eval(freq)

for i = [1:2]
    if imag(freq(i)) == 0
        tau = 1/(freq(i)*sqrt(alpha))
    end
end    

z = tf('z');
% O compensador em avanço tem forma (1+tau*w)/(1+alpha*tau*w)
Gdz = (1+tau*z)/(1+alpha*tau*z)


margin(K*Gz)
hold on
margin(K*Gdz*Gz)
