
for T = [0.5, 1.0, 2.0]
    z = tf('z', T);
    
    Gc = (z)/(z-1);
    Gp = (1-exp(-T))/(z-exp(-T));

    Geq = Gc*Gp;

    rlocus(Geq);
    
    hold on
end

legend('0.5', '1.0', '2.0');

