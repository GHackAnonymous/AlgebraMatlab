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
%Alumnos Eder G�mez de Segura - Xabier Gandiaga
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
 h = ezplot('19.94*(exp(-0.02*x)) + 10.10*(exp(-0.07*x))', Tiempo)

set(h, 'color', 'r')

hold on

plot(Tiempo,y,'*b')

hold off
