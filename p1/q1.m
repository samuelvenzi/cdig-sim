format long
clear
s = tf('s');
z = tf('z');

T1 = 0.1;
T2 = 0.02;

Gs = 5/(s*(s+1));
Gcs = (3.2*(s+1))/(s+4);

stepinfo(feedback(Gs*Gcs,1))

% Letra a)
Gz1 = c2d(Gs, T1, 'zoh')
Gz2 = c2d(Gs, T2, 'zoh')

calc_Gz1 = (5*T1*(z - exp(-T1)) - 5*(z^2 + z*(-1-exp(-T1)) + exp(-T1)) + 5*(z^2 - 2*z + 1))/(z^2 + z*(-1-exp(-T1)) + exp(-T1))
calc_Gz2 = (5*T2*(z - exp(-T2)) - 5*(z^2 + z*(-1-exp(-T2)) + exp(-T2)) + 5*(z^2 - 2*z + 1))/(z^2 + z*(-1-exp(-T2)) + exp(-T2))

% Letra b)
% segurador de ordem zero
Gcz1 = c2d(Gcs, T1, 'zoh')
Gcz2 = c2d(Gcs, T2, 'zoh')

calc_Gcz1 = (0.8*(z - exp(-4*T1)) + 2.4*(z - 1))/(z - exp(-4*T1))
calc_Gcz2 = (0.8*(z - exp(-4*T2)) + 2.4*(z - 1))/(z - exp(-4*T2))

% mapeamento exato
Gcz1_m = c2d(Gcs, T1, 'matched')
Gcz2_m = c2d(Gcs, T2, 'matched')

k1 = 0.8*(1 - exp(-4*T1))/(1-exp(-T1))
k2 = 0.8*(1 - exp(-4*T2))/(1-exp(-T2))

calc_Gcz1_m = k1*(z - exp(-T1))/(z-exp(-4*T1))
calc_Gcz2_m = k2*(z - exp(-T2))/(z-exp(-4*T2))

% retangular para frente
calc_Gcz1_r = (3.2*(z-0.9))/(z-0.6)
calc_Gcz2_r = (3.2*(z-0.98))/(z-0.92)

% T = 0.1
FT_zoh_1 = feedback(Gz1*calc_Gcz1, 1)
pFTZoh1 = pole(FT_zoh_1)

FT_m_1 = feedback(Gz1*calc_Gcz1_m, 1)
pFTm1 = pole(FT_m_1)

FT_r_1 = feedback(Gz1*calc_Gcz1_r, 1)
pFTr1 = pole(FT_r_1)

% T = 0.02
FT_zoh_2 = feedback(Gz2*calc_Gcz2, 1)
pFTZoh2 = pole(FT_zoh_2)

FT_m_2 = feedback(Gz2*calc_Gcz2_m, 1)
pFTm2 = pole(FT_m_2)

FT_r_2 = feedback(Gz2*calc_Gcz2_r, 1)
pFTr2 = pole(FT_r_2)