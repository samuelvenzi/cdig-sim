s = tf('s');

transf = 1/(s*(s+2));

disc = c2d(transf, 0.2, 'zoh');

rlocus(disc)
zgrid