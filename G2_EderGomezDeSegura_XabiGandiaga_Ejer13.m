clear
clc

%Ejer13

Matriz2 = [1 0 0 0 0; 1 1 1 1 8.8; 1 2 2^2 2^3 29.9; 1 3 3^2 3^3 62.0;1 4 4^2 4^3 104.7; 1 5 5^2 5^3 159.1; 1 6 6^2 6^3 222.0; 1 7 7^2 7^3 294.5; 1 8 8^2 8^3 380.4; 1 9 9^2 9^3 471.1; 1 10 10^2 10^3 571.7; 1 11 11^2 11^3 686.8; 1 12 12^2 12^3 809.2]

rref(Matriz2)

X = [1 0 0 0 ; 1 1 1 1; 1 2 2^2 2^3; 1 3 3^2 3^3;1 4 4^2 4^3; 1 5 5^2 5^3; 1 6 6^2 6^3; 1 7 7^2 7^3; 1 8 8^2 8^3; 1 9 9^2 9^3; 1 10 10^2 10^3; 1 11 11^2 11^3; 1 12 12^2 12^3]

Y = [0; 8.8; 29.9; 62.0; 104.7; 159.1; 222.0; 294.5; 380.4; 471.1; 571.7; 686.8; 809.2]

Beta=(((X')*X)^-1)*X'*Y



% Por lo tanto la curva de minimos cuadrados deseado es, y = -0.8558
% +4.7025t + 5.5554t^2 -0.0274t^3

Tiempo = [0 1 2 3 4 5 6 7 8 9 10 11 12]

i= 1;
while i < 14
    [y(i)] = Beta(1) + Beta(2)*Tiempo(i) + Beta(3)*Tiempo(i)^2 + Beta(4)*Tiempo(i)^3
    i = i+1;
end
syms x
% Grafico de los puntos Tiempo e y con la linea aprosimada en Rojo

figure (1)
h = ezplot('-0.85 + 4.70*x + 5.55*x^2 + -0.02*x^3', [0,12])

set(h, 'color', 'r')

hold on

plot(Tiempo,y,'*b')

hold off

syms t
syms b1
syms b2
syms b3
syms b4
Derivada = diff(b1 + b2*t + b3*t^2 + b4*t^3, t)

t = 4.5
b1 = Beta(1)
b2 = Beta(2)
b3 = Beta(3)
b4 = Beta(4)

Estimacion = 3*b4*t^2 + 2*b3*t + b2
