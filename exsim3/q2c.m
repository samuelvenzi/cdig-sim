
T = 0.2; 
z = tf('z', T);

Gc = 12.67*(z-0.6703)/(z-0.2543);
Gz = (0.0175*z + 0.0154)/(z^2 - 1.6703*z + 0.6703);
Gp = (z - 0.97)/(z - 0.99);

Geq = Gc*Gz*Gp;

H = feedback(Geq, 1);

t = 0:T:50;  % the time vector

input = t;   % assuming ramp with slope=1
y = lsim(H, input, t);
plot(t,t)
hold on
stairs(t,y)


