%% Datos
%Archivo  G2-EderGomezdeSegura-XabiGandiaga.pdf

%Ejercicios Tema6.6 Ejer10 y 13

%Grado Ingenier�a Inform�tica
%Asignatura Algebra Lineal
%Curso 1 de Grado
%Grupo F-G2
%T�tulo Tema 6.6 Ejercicios 10 y 13
%Alumnos Eder Gomez de Segura - Xabier Gandiaga
%Fecha 19 de Mayo 2016

%% Enunciado Ejercicio 10

%   Suponga que las sustancias radiactivas A y B tienen coeficientes
%   de decaimiento de .02 y .07, respectivamente. Si una mezcla de 
%   estas dos sustancias en el tiempo t = 0 contiene MA gramos de A
%   y MB gramos de B, entonces un modelo para la  cantidad total y
%   de la mezcla presente en el tiempo t es y = MAe^.02t + MBe^.07t
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


%% Metodolog�a

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

%   y=19.94e^-0,02t+10.10e^-0,07t

%% An�lisis y Conclusiones

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


%% C�digo Ejercicio 10
clear /all
clc

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
title('Gr�fico de Decaimiento')
xlabel('Tiempo (s)')
ylabel('Masa')
hold on

plot(Tiempo,y,'*b')

hold off

%% Enunciado Ejercicio 13

%   Para medir el desempe�o de un avi�n durante el despegue,se
%   midi� su posici�n horizontal cada segundo, desde t = 0 hasta
%   t = 12. Las posiciones (en pies) fueron: 0, 8.8,29.9, 62.0,
%   104.7, 159.1, 222.0, 294.5, 380.4, 471.1, 571.7,686.8, 
%   809.2.

%   A) Encuentre la curva c�bica de m�nimos cuadrados y = Beta0 +
%   Beta1t + Beta2t^2 + Beta3t^3 para estos datos.

%   B) Utilice el resultado de (a) para estimar la velocidad del
%   avi�n cuando t = 4.5 segundos.

%% Objetivos

%   Se nos presenta una serie de mediciones tomadas a partir 
%   de un evento f�sico en un tiempo limitado, siendo estas medidas
%   las coordenadas sobre el tiempo, medido en segundos, y la
%   posici�n horizontal del objeto en movimiento(medido en pies), 
%   un aeroplano en este caso.

%   Se pide encontrar la curva c�bica de m�nimos cuadrados de 
%   la ecuaci�n y =Beta0 +Beta1t + Beta2t^2 + Beta3t^3.    

%   Y utilizar el resultado de ese objetivo para calcular la 
%   velocidad del avi�n en el espacio de tiempo 4.5 segundos.

%% Metodolog�a

%   Lo primero que se ha de hacer es identificar la ecuaci�n
%   en cuesti�n que nos proporciona el ejercicio, ya que en 
%   un principio suponemos que se trata de un problema que 
%   ha de resolverse a partir del m�todo de m�nimos cuadrados.
%   En este caso la ecuaci�n describe un modelo lineal porque
%   es lineal en los par�metros desconocidos, ergo, podemos 
%   saber que necesitaremos calcular un vector de par�metro 
%   [Beta0 Beta1 Beta2 Beta3].

%   El modelo lineal es el siguiente, y=XBeta+ Epsilon

%   Prescindiremos del vector residual (Epsilon) pues no 
%   es necesario para el c�lculo.

%   Para ejecutar el c�lculo crearemos una matriz de dise�o
%   X(denominado �X� en el c�digo) a partir de la sustituci�n
%   de diferentes valores de �t� en la ecuaci�n que se nos da.

%   Tambi�n necesitaremos un vector de observaci�n y 
%   (denominado �Y� en el c�digo) formado a partir de las 
%   diferentes � yn� que se encuentran en las coordenadas 
%   dadas por el ejercicio. Es decir, ser� un vector de 
%   13 filas que incluir� las 13 coordenadas de �y� 
%   disponibles.

%   Si se quiere comprobar que el ejercicio necesita de un
%   acercamiento por m�nimos cuadrados para resolverse se
%   puede reducir una matriz creada por la matriz de dise�o
%   expandida por el vector de observaci�n (denominado 
%   Matriz2 en el c�digo).  Si el resultado de esta reducci�n 
%   es una matriz incompatible se confirma que el ejercicio
%   necesita del m�todo de m�nimos cuadrados para resolverse.

%   La operaci�n a realizarse para obtener los valores del 
%   vector de par�metro es el siguiente:

%   Beta = (((Traspuesta de X)*X)^-1)* Traspuesta de X * Y

%   (�Beta=(((X')*X)^-1)*X'*Y�, en el c�digo)

%   Esto nos proporcionar� los valores del vector de 
%   par�metro con los que crear la ecuaci�n de la curva de
%   m�nimos cuadrados a graficar.

%   La velocidad del aeroplano en funci�n al tiempo ser� el
%   resultado de reemplazar el valor de t (4.5 segundos) en
%   la derivada de dicha ecuaci�n. La unidad en la que se 
%   calcula es de pies/segundos, pues los datos proporcionados
%   por el ejercicio se han medido en esas unidades.

%% Resultados

%   Los valores del vector de par�metro son
%   Beta =
%       -0.8558
%       4.7025
%       5.5554
%       -0.0274

%   Lo que significa que la ecuaci�n de la curva de 
%   m�nimos cuadrados a graficar es 
%   y = -0.8558 + 4.7025t + 5.5554t^2 -0.0274t^3.

%   La velocidad del avi�n en el segundo 4.5 es 
%   de 53.0387 pies/segundo, 16,16619576 metros/segundo.

%% An�lisis y Conclusiones

%   Como se puede observar en el gr�fico que se ha creado 
%   a partir del c�digo, la curva de m�nimos cuadrados estimar�
%   casi perfectamente los valores que se puedan pedir de este 
%   ejercicio en funci�n a la posici�n del aeroplano y el tiempo
%   transcurrido. Esto se deduce a partir del visionado de la 
%   cercan�a de las coordenadas originales proporcionadas en el
%   ejercicio a la curva, pues las estimaciones que la funci�n 
%   hace de las mediciones f�sicas reales ser�n mejores cuanto
%   m�s se acerque la curva que representa la funci�n a estas 
%   en el gr�fico.

%   El que la curva se eleve a medida que el tiempo avanza confirma 
%   que la posici�n horizontal del avi�n va en aumento y que este a 
%   la vez aumenta tambi�n la velocidad a la que se mueve.

%% C�digo Ejercicio 13

clear \all
clc

X = [1 0 0 0 ; 1 1 1 1; 1 2 2^2 2^3; 1 3 3^2 3^3;1 4 4^2 4^3; 1 5 5^2 5^3; 1 6 6^2 6^3; 1 7 7^2 7^3; 1 8 8^2 8^3; 1 9 9^2 9^3; 1 10 10^2 10^3; 1 11 11^2 11^3; 1 12 12^2 12^3]
Y = [0; 8.8; 29.9; 62.0; 104.7; 159.1; 222.0; 294.5; 380.4; 471.1; 571.7; 686.8; 809.2]

Matriz2 = [1 0 0 0 0; 1 1 1 1 8.8; 1 2 2^2 2^3 29.9; 1 3 3^2 3^3 62.0;1 4 4^2 4^3 104.7; 1 5 5^2 5^3 159.1; 1 6 6^2 6^3 222.0; 1 7 7^2 7^3 294.5; 1 8 8^2 8^3 380.4; 1 9 9^2 9^3 471.1; 1 10 10^2 10^3 571.7; 1 11 11^2 11^3 686.8; 1 12 12^2 12^3 809.2]

Tiempo = [0 1 2 3 4 5 6 7 8 9 10 11 12]

gauss = rref(Matriz2)

Beta=(((X')*X)^-1)*X'*Y

i= 1;
while i < 14
    [y(i)] = Beta(1) + Beta(2)*Tiempo(i) + Beta(3)*Tiempo(i)^2 + Beta(4)*Tiempo(i)^3;
    i = i+1;
end
y

syms x
figure (1)
h = ezplot('-0.85 + 4.70*x + 5.55*x^2 + -0.02*x^3', [0,12]);

set(h, 'color', 'r')
title('Gr�fico de Posici�n')
xlabel('Tiempo (s)')
ylabel('Pies')

hold on
plot(Tiempo,y,'*b')
hold off

syms t b1 b2 b3 b4

Derivada = diff(b1 + b2*t + b3*t^2 + b4*t^3, t)

t = 4.5;
Estimacion = 3*Beta(4)*t^2 + 2*Beta(3)*t + Beta(2)
