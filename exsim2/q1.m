s = tf('s'); 
z = tf('z', 0.1);
% Declarar funções de transferências
Gs = 1/((s+2)*(s+3));
Gz_zoh = (0.004241*z + 0.00359)/(z^2 - 1.56*z + 0.6065);
Gz_ret_f = (0.01)/(z^2 - 1.5*z + 0.56);
Gz_ret_t = (0.00641*z^2)/(z^2 - 1.6*z + 0.641);
Gz_trp= (0.00197*z^2 + 0.00359*z + 0.00197)/(z^2 - 1.56*z + 0.6065);
Gz_map = (0.00391*z + 0.00391)/(z^2 - 1.56*z + 0.6065);

figure
ys = step(Gs);
y_zoh = step(Gz_zoh);
y_ret_f = step(Gz_ret_f);
y_ret_t = step(Gz_ret_t);
y_trp = step(Gz_trp);
y_map = step(Gz_map);

plot(ys)
hold on
stairs(y_zoh)
hold on
stairs(y_ret_f)
hold on
stairs(y_ret_t)
hold on
stairs(y_trp)
hold on
stairs(y_map)

xlim([0 150])
ylim([0 0.3])

hold off

legend('Ys', 'ZOH', 'Ret Frente', 'Ret Trás', 'Trap', 'Map') 