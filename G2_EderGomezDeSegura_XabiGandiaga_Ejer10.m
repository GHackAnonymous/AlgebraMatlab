clear /all
clc

%% Datos
%Archivo  G2-EderGomezdeSegura-XabiGandiaga.pdf

%Ejercicios Tema6.6 Ejer10 y 13

%Grado Ingenieria Informatica
%Asignatura Algebra Lineal
%Curso 1 de Grado
%Grupo F-G2
%Titulo Tema 6.6 Ejercicios 10 y 13
%Alumnos Eder Gomez de Segura - Xabier Gandiaga
%Fecha 19 de Mayo 2016

%% Enunciado Ejercicio 10

%   Suponga que las sustancias radiactivas A y B tienen coeficientes
%   de decaimiento de .02 y .07, respectivamente. Si una mezcla de 
%   estas dos sustancias en el tiempo t = 0 contiene MA gramos de A
%   y MB gramos de B, entonces un modelo para la  cantidad total y
%   de la mezcla presente en el tiempo t es y = MAe?.02t + MBe?.07t
%   (6)

%   Suponga que las cantidades iniciales MA, MB se desconocen,
%   pero que un cient�fico puede medir la cantidad total presente
%   en diferentes tiempos y registra los siguientes puntos (ti, yi):
%   (10, 21.34), (11, 20.68), (12, 20.05), (14, 18.87) y (15,
%   18.30).

%   a. Describa un modelo lineal que pueda usarse para estimar
%   MA y MB.

%   b. [M] Encuentre la curva de m�nimos cuadrados basada en (6).


%% Objetivos

%   Se nos presenta una serie de mediciones que se pueden cumplir
%   dentro de un espacio de tiempo determinado(medido en segundos)
%   de dos sustancias  radioactivas respecto a la masa(medida en
%   gramos) presente de estas en cada momento, masas que ir�n 
%   reduci�ndose gracias al decaimiento radioactivo. 
%   Se pide encontrar un modelo lineal que pueda usarse para estimar
%   MA y MB y la curva de m�nimos cuadrados que represente el 
%   decaimiento gr�ficamente.


%% Metodologia

%   Lo primero que se ha de hacer es identificar la ecuaci�n en
%   cuesti�n que nos proporciona el ejercicio, ya que en un 
%   principio suponemos que se trata de un problema que ha de
%   resolverse a partir del m�todo de m�nimos cuadrados.  
%   En este caso la ecuaci�n describe un modelo lineal porque
%   es lineal en los par�metros desconocidos, ergo, podemos
%   saber que necesitaremos calcular un vector de par�metro 
%   [Beta0 Beta1].

%   El modelo lineal es el siguiente, y=XBeta+ Epsilon

%   Prescindiremos del vector residual (Epsilon) pues no es
%   necesario para el c�lculo.

%   Para ejecutar el c�lculo crearemos una matriz de dise�o 
%   X(denominado �X� en el c�digo) a partir de la sustituci�n de
%   diferentes valores de �t� en la ecuaci�n que se nos da.

%   Tambi�n necesitaremos un vector de observaci�n y (denominado
%   �Y� en el c�digo) formado a partir de las diferentes � yn� que
%   se encuentran en las coordenadas dadas por el ejercicio .  
%   Es decir, ser� un vector de 5 filas que incluir� los 5 valores
%   de �ymasa� disponibles.

%   Si se quiere comprobar que el ejercicio necesita de un
%   acercamiento por m�nimos cuadrados para resolverse se puede
%   reducir una matriz creada por la matriz de dise�o expandida
%   por el vector de observaci�n (denominado Matriz1 en el c�digo).
%   Si el resultado de esta reducci�n es una matriz incompatible
%   se confirma que el ejercicio necesita del m�todo de m�nimos
%   cuadrados para resolverse.

%   La operaci�n a realizarse para obtener los valores del vector
%   de par�metro es el siguiente:

%   Beta = (((Traspuesta de X)*X)^-1)* Traspuesta de X * Y

%   (�Beta=(((X')*X)^-1)*X'*Y�, en el c�digo)

%   Esto nos proporcionar� los valores del vector de par�metro
%   con los que crear la ecuaci�n de la curva de m�nimos 
%   cuadrados a graficar.

%% Resultados

%   Los valores del vector de par�metro son

%   Beta =
%       19.9411
%       10.1015

%   Lo que significa que la ecuaci�n de la curva de m�nimos 
%   cuadrados a graficar es      

%   y=19.94e^0,02t+10.10e^0,07t

%% Analisis y Conclusiones

%   Como se puede observar en el gr�fico que se ha creado a 
%   partir del c�digo, la curva de m�nimos cuadrados estimar� casi
%   perfectamente los valores de la masa total que se puedan pedir
%   de este ejercicio en funci�n al tiempo transcurrido.  
%   Esto se deduce a partir del visionado de la cercan�a de las
%   mediciones de datos originales proporcionadas en el ejercicio
%   a la curva, pues las estimaciones que la funci�n hace de las 
%   mediciones f�sicas reales ser�n mejores cuanto m�s se acerque 
%   la curva que representa la funci�n a estas en el gr�fico.

%   El que la curva se asemeje a una l�nea recta decayente significa
%   que representa un decaimiento a nivel at�mico continuo, es decir,
%   una desintegraci�n continua de la masa, pues la masa formada por
%   la suma de los dos elementos radioactivos seguir� decreciendo a
%   medida que avance el tiempo. 


%% Codigo Ejercicio 10


%Vectores x e y
X = [exp(-0.02*10) exp(-0.07*10); exp(-0.02*11) exp(-0.07*11); exp(-0.02*12) exp(-0.07*12); exp(-0.02*14) exp(-0.07*14); exp(-0.02*15) exp(-0.07*15)]
Y=  [21.34;20.68;20.05;18.87;18.30]

Matriz1 = [exp(-0.02*10) exp(-0.07*10) 21.34; exp(-0.02*11) exp(-0.07*11) 20.68; exp(-0.02*12) exp(-0.07*12) 20.05; exp(-0.02*14) exp(-0.07*14) 18.87; exp(-0.02*15) exp(-0.07*15) 18.39]

Tiempo = [10 11 12 14 15]

Gauss = rref(Matriz1)

Beta=(((X')*X)^-1)*X'*Y

i= 1;
while i < 6
    [y(i)] = Beta(1)*(exp(-0.02*Tiempo(i))) + Beta(2)*(exp(-0.07*Tiempo(i)));
    i = i+1;
end
y

syms x;
figure (1)
 h = ezplot('19.94*(exp(-0.02*x)) + 10.10*(exp(-0.07*x))', Tiempo);

set(h, 'color', 'r')
title('Grafico de Decaimiento')
xlabel('Tiempo (s)')
ylabel('Masa')
hold on

plot(Tiempo,y,'*b')

hold off
