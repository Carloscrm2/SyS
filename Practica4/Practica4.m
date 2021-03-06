%% Práctica 4: Convolución y Correlación
% integrantes:
% Gómez García Carlos Eduardo
% Contreras Porfirio Alejandro
% Gómez Serrano Eric
%% Objetivos
% * Conocer métodos básicos de integración numérica
% * Manipulación de instrucciones en MATLAB
% * Simular convoluciones y correlaciones de señales continuas
%% Introducción
% Teorema fundamental del cálculo
%
% $x^2+e^{\pi i}$ 
%% PR04 problema 1
t = -10:0.001:10;
x = @(t) ((t>=0).*(1-t).*(t<=1)+(t>1).*(t-1).*(t<=2));
h = @(t) heaviside(t)-heaviside(t-1);
c = @(t) (t>0).*(t-(t.^2)/2).*(t<=1)+(t>1).*(t.^2-3.*t+5/2).*(t<=2)+(t>2).*(-t.^2/2+2.*t-3/2).*(t<=3);
grafica2d(t,x(t),'x(t)');
grafica2d(t,h(t),'h(t)');
% Graficas de las señales involucradas en la convolucion 
%%
% 
% convconm(x,h,c); %llamada de la función que realiza la convolucion
%
%%
% 
% La grafica de color amarrillo es la gráfica del resultado analitco y el punto movil es el resultado de la simulacion
%
% <<PR041.gif>>
% 
%% PR04 problema 3
x_1 = @(t) (t<=0).*(0)+(t>0).*(t).*(t<=1)+(t>1).*(1).*(t<=2);
h_1= @(t) (t<=1).*(0)+(t>1).*(1).*(t<=3)+(t>3).*(0);
c_1= @(t) (t>1).*((t.^2)/2-t+1/2).*(t<=2)+(t>2).*((2.*t+1)/2-2).*(t<=3)+(t>3).*((-t.^2+6.*t-8)/2+1).*(t<=4)+(t>4).*(-t+5).*(t<=5);
grafica2d(t,x_1(t),'x(t)');
grafica2d(t,h_1(t),'h(t)');
% Graficas de las señales involucradas en la convolucion
%%
% 
% convconm(x_1,h_1,c_1); %llamada de la función que realiza la convolucion
%
%%
% 
% La grafica de color amarrillo es la gráfica del resultado analitco y el punto movil es el resultado de la simulacion
%
% <<PR042.gif>>
% 
%% PR06 problema e)
h_2= @(t) heaviside(t)-2*heaviside(t-3)+heaviside(t-4);
x_2= @(t) (-4<t).*(-1).*(t<=-3)+(-3<t).*(1).*(t<=0);
c_2= @(t) (t>3).*(-4+t).*(t<4)+(t>1).*(2-t).*(t<3)+(t>0).*(-3.*t+4).*(t<1)+(t>-1).*(3.*t+4).*(t<0)+(t>-3).*(t+2).*(t<-1)+(t>-4).*(-4-t).*(t<-3);
grafica2d(t,x_2(t),'x(t)');
grafica2d(t,h_2(t),'x(-t)');
% Graficas de las señales involucradas en la autocorrelacion
%%
% 
% convconm(x_2,h_2,c_2); %llamada de la función que realiza la convolucion
%
%%
% 
% La grafica de color amarrillo es la gráfica del resultado analitco y el punto movil es el resultado de la simulacion
%
% <<PR06e.gif>>
% 
%% PR06 problema f)
h_3 = @(t) heaviside(t)-2.*heaviside(t-2)+heaviside(t-4);
x_3= @(t) (-4<t).*(-1).*(t<=-3)+(-3<t).*(1).*(t<=0);
c_3= @(t) (-4<t).*(-4-t).*(t<=-3)+(-3<t).*(2+t).*(t<=-2)+(-2<t).*(6+3.*t).*(t<=-1)+(-1<t).*(2-t).*(t<=0)+(0<t).*(-3.*t+2).*(t<=1)+(1<t).*(-t).*(t<=2)+(2<t).*(t-4).*(t<=4);
grafica2d(t,x_3(t),'x(t)');
grafica2d(t,h_3(t),'h(t)');
% Graficas de las señales involucradas en la convolucion
%%
% 
% convconm(x_3,h_3,c_3); %llamada de la función que realiza la convolucion
%
%%
% 
% La grafica de color amarrillo es la gráfica del resultado analitco y el punto movil es el resultado de la simulacion
%
% <<PR06f.gif>>
% 