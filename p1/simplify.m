clear
% some random symbolic expression
syms z
syms Kc
syms R
syms D

myHugeExpression = (((Kc*R*z)/(z-1))*((0.1881*z + 0.1636)/(9*z^2-14.65*z+5.913)) + ((D*1.037*z)/(3*z^2 - 5.222*z +2.222)))/(1 + Kc*((0.1881*z + 0.1636)/(9*z^2-14.65*z+5.913)))

% Simplify with 4 digits of precision
simplifiedExpression =simplify(expand(myHugeExpression))
newExpression = vpa(simplifiedExpression,4)