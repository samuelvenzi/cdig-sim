clear 

z = tf('z')

Td = 95.9935
Kc = 0.0047103

Gz = (z+1)/(2*(z-1)^2)
Gc1 = Kc
Gc2 = Kc*Td*(z-1)/z

MF = (Kc*(z+1)*z)/(2*z^3 + (-4+Kc+Kc*Td)*z^2 + (2+Kc)*z - Kc*Td)

pole(MF)

step(MF)

MA = ((z+1)*(z-(Td/(1+Td))))/(z*(z-1)^2);
