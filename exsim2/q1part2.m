syms z s
F_zoh = (100*z^2 - 56*z)/(z^2 - 1.56*z + 0.6065);
F_ret_f = (100*z^2 - 50*z)/(z^2 - 1.5*z + 0.56);
F_ret_t = (100*z^2 - 60*z)/(z^2 - 1.6*z - 0.641);
F_trp = (100*z^2 - 55*z)/(z^2 - 1.55*z - 0.6047);
F_map = (100*z^2 - 56*z)/(z^2 - 1.56*z + 0.6065);
F_cont = (100*s + 500)/(s^2 + 5*s + 6);

time_F_zoh = iztrans(F_zoh);
time_F_ret_f = iztrans(F_ret_f);
time_F_ret_t = iztrans(F_ret_t);
time_F_trp = iztrans(F_trp);
time_F_map = iztrans(F_map);
time_F_cont = ilaplace(F_cont);

y_zoh = {};
y_ret_f = {};
y_ret_t = {};
y_trp = {};
y_map = {};
y = {};

n = [0:1:100];
for v = 0:1:100
    y_zoh = [y_zoh, subs(time_F_zoh, v)];
    y_ret_f = [y_ret_f, subs(time_F_ret_f, v)];
    y_ret_t = [y_ret_t, subs(time_F_ret_t, v)];
    y_trp = [y_trp, subs(time_F_trp, v)];
    y_map = [y_map, subs(time_F_map, v)];
    y = [y, subs(time_F_cont, v)];
end   

figure

plot(y)
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

xlim([0 80])
ylim([0 100])

hold off

legend('Cont.', 'ZOH', 'Ret Frente', 'Ret Trás', 'Trap', 'Map') 