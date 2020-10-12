T1 = 0.1;
T2 = 0.01;
Gs = tf([1],[1 1]);
G1 = c2d(Gs, T1, 'zoh');
G2 = c2d(Gs, T2, 'zoh');

bode(Gs, G1,G2)