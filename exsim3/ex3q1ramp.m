
z = tf('z');

for T = [0.5, 1.0, 2.0]
    z = tf('z', T);
    
    Gc = (2*z)/(z-1);
    Gp = (1-exp(-T))/(z-exp(-T));

    Geq = Gc*Gp;

    H = feedback(Geq, 1);
    
    t = 0:T:120;  % the time vector

    input = t;   % assuming ramp with slope=1
    y = lsim(H, input, t);
    plot(t,t)
    if T == 0.5
        stairs(t,y)
    end
    if T == 1
        stairs(t,y)
    end
    if T == 2
        stairs(t,y)
    end
    
    hold on
end

legend('0.5', '1.0', '2.0');

