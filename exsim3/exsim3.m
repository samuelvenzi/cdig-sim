
z = tf('z');

for T = [0.5, 1.0, 2.0]
    z = tf('z', T);
    
    Gc = (2*z)/(z-1);
    Gp = (1-exp(-T))/(z-exp(-T));

    Geq = Gc*Gp;

    H = feedback(Geq, 1);
    
    y = step(H, [0 : T : 30]);
    stepinfo(y, [0 : T : 30])
    if T == 0.5
        stairs([0 : T : 30],y)
    end
    if T == 1
        stairs([0 : T : 30],y)
    end
    if T == 2
        stairs([0 : T : 30],y)
    end
    
    hold on
end

legend('0.5', '1.0', '2.0');

