%% Enunciado Ejercicio 13

%   Para medir el desempeño de un avión durante el despegue,se
%   midió su posición horizontal cada segundo, desdet = 0 hasta
%   t = 12. Las posiciones (en pies) fueron: 0, 8.8,29.9, 62.0,
%   104.7, 159.1, 222.0, 294.5, 380.4, 471.1, 571.7,686.8, 
%   809.2.

%   A) Encuentre la curva cúbica de mínimos cuadrados y = Beta0 +
%   Beta1t + Beta2t2 + Beta3t3 para estos datos.

%   B) Utilice el resultado de (a) para estimar la velocidad del
%   avión cuando t = 4.5 segundos.

%% Objetivos

%   Se nos presenta una serie de mediciones tomadas a partir 
%   de un evento físico en un tiempo limitado, siendo estas medidas
%   las coordenadas sobre el tiempo, medido en segundos, y la
%   posición horizontal del objeto en movimiento(medido en pies), 
%   un aeroplano en este caso.

%   Se pide encontrar la curva cúbica de mínimos cuadrados de 
%   la ecuación y =Beta0 +Beta1t + Beta2t2 + Beta3t3.    

%   Y utilizar el resultado de ese objetivo para calcular la 
%   velocidad del avión en el espacio de tiempo 4.5 segundos.

%% Metodología

%   Lo primero que se ha de hacer es identificar la ecuación
%   en cuestión que nos proporciona el ejercicio, ya que en 
%   un principio suponemos que se trata de un problema que 
%   ha de resolverse a partir del método de mínimos cuadrados.
%   En este caso la ecuación describe un modelo lineal porque
%   es lineal en los parámetros desconocidos, ergo, podemos 
%   saber que necesitaremos calcular un vector de parámetro 
%   [Beta0 Beta1 Beta2 Beta3].

%   El modelo lineal es el siguiente, y=XBeta+ Epsilon

%   Prescindiremos del vector residual (Epsilon) pues no 
%   es necesario para el cálculo.

%   Para ejecutar el cálculo crearemos una matriz de diseño
%   X(denominado “X” en el código) a partir de la sustitución
%   de diferentes valores de “t” en la ecuación que se nos da.

%   También necesitaremos un vector de observación y 
%   (denominado “Y” en el código) formado a partir de las 
%   diferentes “ yn” que se encuentran en las coordenadas 
%   dadas por el ejercicio. Es decir, será un vector de 
%   13 filas que incluirá las 13 coordenadas de “y” 
%   disponibles.

%   Si se quiere comprobar que el ejercicio necesita de un
%   acercamiento por mínimos cuadrados para resolverse se
%   puede reducir una matriz creada por la matriz de diseño
%   expandida por el vector de observación (denominado 
%   Matriz2 en el código).  Si el resultado de esta reducción 
%   es una matriz incompatible se confirma que el ejercicio
%   necesita del método de mínimos cuadrados para resolverse.

%   La operación a realizarse para obtener los valores del 
%   vector de parámetro es el siguiente:

%   Beta = (((Traspuesta de X)*X)^-1)* Traspuesta de X * Y

%   (“Beta=(((X')*X)^-1)*X'*Y”, en el código)

%   Esto nos proporcionará los valores del vector de 
%   parámetro con los que crear la ecuación de la curva de
%   mínimos cuadrados a graficar.

%   La velocidad del aeroplano en función al tiempo será el
%   resultado de reemplazar el valor de t (4.5 segundos) en
%   la derivada de dicha ecuación. La unidad en la que se 
%   calcula es de pies/segundos, pues los datos proporcionados
%   por el ejercicio se han medido en esas unidades.

%% Resultados

%   Los valores del vector de parámetro son
%   Beta =
%       -0.8558
%       4.7025
%       5.5554
%       -0.0274

%   Lo que significa que la ecuación de la curva de 
%   mínimos cuadrados a graficar es 
%   y = -0.8558 + 4.7025t + 5.5554t^2 -0.0274t^3.

%   La velocidad del avión en el segundo 4.5 es 
%   de 53.0387 pies/segundo, 16,16619576 metros/segundo.

%% Análisis y Conclusiones

%   Como se puede observar en el gráfico que se ha creado 
%   a partir del código, la curva de mínimos cuadrados estimará
%   casi perfectamente los valores que se puedan pedir de este 
%   ejercicio en función a la posición del aeroplano y el tiempo
%   transcurrido. Esto se deduce a partir del visionado de la 
%   cercanía de las coordenadas originales proporcionadas en el
%   ejercicio a la curva, pues las estimaciones que la función 
%   hace de las mediciones físicas reales serán mejores cuanto
%   más se acerque la curva que representa la función a estas 
%   en el gráfico.

%   El que la curva se eleve a medida que el tiempo avanza confirma 
%   que la posición horizontal del avión va en aumento y que este a 
%   la vez aumenta también la velocidad a la que se mueve.

%% Codigo Ejercicio 13

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
title('Grafico de Aceleración')
xlabel('Tiempo (s)')
ylabel('Pies')

hold on
plot(Tiempo,y,'*b')
hold off

syms t b1 b2 b3 b4

Derivada = diff(b1 + b2*t + b3*t^2 + b4*t^3, t)

t = 4.5;
Estimacion = 3*Beta(4)*t^2 + 2*Beta(3)*t + Beta(2)
