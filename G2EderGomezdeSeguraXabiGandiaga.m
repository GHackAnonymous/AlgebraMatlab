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

x = [exp(-0.02*10) exp(-0.07*10); exp(-0.02*11) exp(-0.07*11); exp(-0.02*12) exp(-0.07*12); exp(-0.02*14) exp(-0.07*14); exp(-0.02*15) exp(-0.07*15)]
y=  [21.34;20.68;20.05;18.87;18.30]

plot(x,y,'*b');

