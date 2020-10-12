syms Kc

z = 1 
Pz = z^3 + (z^2)*(0.0209*Kc - 2.628) + z*(2.285 - 0.002723*Kc) - 0.657 - 0.01817*Kc

b2t = abs(0.0003301*Kc^2 + 0.0239*Kc - 0.5684)
b0t = abs(0.00004977*Kc^2 - 0.0606*Kc + 1.1268)

b2 = sqrt((0.0003301*Kc^2 + 0.0239*Kc - 0.5684)^2)
b0 = sqrt((0.00004977*Kc^2 - 0.0606*Kc + 1.1268)^2)

S = solve(b2 - b0>0,Kc, 'ReturnConditions', true)
S.conditions