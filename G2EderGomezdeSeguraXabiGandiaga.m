clear /all
clc
%%
%---------------------------------------------------
%Archivo  G2 - EderGomezdeSegura-XabiGandiaga . pdf
%
%Ejercicios Tema6.6 Ejer10 y 13
%---------------
%Grado Ingenieria Informatica
%Asignatura Algebra Lineal
%Curso 1 de Grado 
%Grupo F-G2
%Titulo Tema 6.6 Ejercicios 10 y 13
%Alumnos Eder Gómez de Segura - Xabier Gandiaga
%Fecha 19 de Mayo 2016
%---------------
%Objetivos
%
%Metodologia
%Resultados
%Analisis
%Conclusiones

%Todo en un mismo archivo

%--------------------------

%Ejer 10

Matriz = [exp(-0.02*10) exp(-0.07*10) 21.34; exp(-0.02*11) exp(-0.07*11) 20.68; exp(-0.02*12) exp(-0.07*12) 20.05; exp(-0.02*14) exp(-0.07*14) 18.87; exp(-0.02*15) exp(-0.07*15) 18.39]

rref(Matriz)

% como es 0=1 es un sistema incompatible por lo tanto tenemos que resolver
% con el metodo de minimos cuadrados

%%Metodo de minimos cuadrados
%Vectores x e y
X = [exp(-0.02*10) exp(-0.07*10); exp(-0.02*11) exp(-0.07*11); exp(-0.02*12) exp(-0.07*12); exp(-0.02*14) exp(-0.07*14); exp(-0.02*15) exp(-0.07*15)]
Y=  [21.34;20.68;20.05;18.87;18.30]

%para realizar temos que utilizar la formaula Beta=(((x^t)*x)^-1)*(x^t)*y
Beta=(((X')*X)^-1)*X'*Y

% Por lo tanto la curva de minimos cuadrados deseado es, y = 19,94*(e^-0,02*tiempo)+10,10*(e^-0,07*tiempo)

Tiempo = [10 11 12 14 15]

i= 1;
%y = zeros(5);
while i < 6
    [y(i)] = 19.94*(exp(-0.02*Tiempo(i))) + 10.10*(exp(-0.07*Tiempo(i)))
    i = i+1;
end

% Grafico de los puntos Tiempo e y con la linea aprosimada en Rojo

% puntos = cordenadas; Curva = aprosimacion

syms x

figure (1)
ezplot('19.94*(exp(-0.02*x)) + 10.10*(exp(-0.07*x))', Tiempo)
hold on

plot(Tiempo,y,'*b')

hold off

%% ------------

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
ezplot('-0.85 + 4.70*x + 5.55*x^2 + -0.02*x^3', [0,12])
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