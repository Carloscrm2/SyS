  %% Practica 2: señales en tiempo continuo
  % integrantes: 
  % Gómez García Carlos Eduardo
  % Contreras Porfirio Alejandro
  % Serrano Gómez Erick
  % 
  %% Objetivos
  %   
  % * Manipulacion básica de MATLAB
  % * Gráficas de señales reales y complejas continuas
  % * Transformación de señales continuas (escalamientos y traslaciones)
  % * Calculo de energía y potencia de señales continuas
  %
  %% Introducion
  %
  %
  %
  %
  %
  %% Problema 1
%*M1.1 funciones anonimas*.
%definimos la funcion f(t) = e^t*cos(2πt).   
  f= @(t) exp(-t).*cos(2*pi*t);
%ya definida f(t) la podemos evalular
 t = 0;
  f(t)

%%
%también se pude evaluar de la siguiente forma, sustituyendo
%directamente f(0)
  f(0)
%para evaluar una funcion en diferentes valores definimos un vector:
  t = (-2:2);
  f(t)
%%  
%graficamos a f(t) introduciendo el vector t que va de -2 a 2 
  figure
  plot(t,f(t));
  title('M1.1'); xlabel('t'); ylabel('f(t)'); grid;
%la gráfica M1.1 no muestra el comportamiento deseado, debido a que no
%tabulamos los suficientes puntos.
%redefinimos al vector t que ahora va de -2 a 2 pero en lugar de ir de 1
%en 1 va 0.01 en 0.01
  t = (-2:0.01:2);
%%  
% evaluamos nuevamente la funcion y graficamos
  figure
  plot(t,f(t));
  title('M1.2'); xlabel('t'); ylabel('f(t)'); grid;
%la figura M1.2 ya muestra el comportamiento esperado

%%
%*M1.2 operadores relacionales y la funcion escalon unitario*
%definimos la función escalon unitario:
  u = @(t) t>=0;
  
  t = (-2:2);
  figure
  plot (t,u(t));
  title('M1.3'); xlabel('t'); ylabel('u(t)');
%nuevamente la gráfica M1.3 no muestra lo esperado.
%%
%hacemos la correcion del vector t
  t = (-2:0.01:2);
%graficamos u(t)
  figure
  plot (t,u(t));
  xlabel('t'); ylabel('u(t)');
  axis ([-2 2 -0.1 1.1]);
%%
%definimos el pulso unitario p(t) = u(t) − u(t − 1)
  p = @(t) t>=0 & t<1;
  figure
  t = -1:0.01:2; plot(t,p(t));
  title('M1.5'); xlabel('t'); ylabel('p(t) = u(t)-u(t-1)');
  axis ([-1 2 -.1 1.1]);
%%  
%*M1.3 operaciones en la variable independiente*
% |consideremos g(t) = f(t)u(t) = e^−t*cos(2πt)u(t)| 
  g = @(t) exp(-t).*cos(2*pi*t).*(t>=0);
  t = -2:0.01:2;
%
%%
% g(2t+1) 
  figure
  title('M1.6'); plot(t,g(2*t+1)); xlabel('t'); ylabel('g(2t+1)'); grid;
%%  
%g(-t+1)
  figure
  title('M1.7'); plot(t,g(-t+1)); xlabel('t'); ylabel('g(-t+1)'); grid;
%%
%g(2t+1)
  figure
  title('M1.8'); plot(t,g(2*t+1) +g(-t+1)); xlabel('t'); ylabel('h(t)'); grid;
%%  
%*M1.4 Integracion y estimación de la energia de una señal*
%considera la señal x(t) = e^t(u(t) − u(t − 1))
%la energia de la señal x(t) se expresa como 
%Ex = ∫|x(t)|2 dt = ∫e^2t dt.
%definimos la funcion x(t)
  x = @(t) exp(-t).*((t>=0) & (t<1));
  t = 0:0.01:1;
%%  
%calulamos la energia de la señal
  E_x = sum(x(t).*x(t)*0.01)
%este resultado no es del todo exacto, ya que calcularlo de esta manera
%no estan exacta como integrar  
%primero elevamos al cuadrado x(t)
 x_squared = @(t) exp(-2*t).*((t>=0) & (t<1));
%integramos
 E_x = integral(x_squared,0,1)
%% 
%ahora considera g(t), definida previamente como 
% Eg = ∫e^−2tcos^2(2πt)dt. Existe una solución de forma cerrada, pero requiere un poco de esfuerzo. 
%MATLAB proporciona una respuesta más rápidamente
 g_squared = @(t) exp(-2*t).*(cos(2*pi*t).^2).*(t>=0);
 t = 0:0.001:100;
 E_g = sum(g_squared(t)*0.001)
% una mejor aproximacion se obtiene integrando
  E_g = integral(g_squared, 0,100)
%%  
  %% Problema 2
  %
  % <<problema2.PNG>> 
  % 
% definimos la funcion x(t)
  figure
  x = @(t) (-t).*(t>=-4 & t<=0) + (t).*(t>0 & t<=2);
  t = -5:0.01:5;
  title('x(t)'); plot(t,x(t)); xlabel('t'); ylabel('x(t)'); grid;
  t = -5:0.01:10;
%%  
  % x(t-4)
  figure
  plot(t,x(t-4)); xlabel('t'); ylabel('x(t-4)'); grid;
%%  
  % x(t/1.5)
  t = -10:0.01:10;
  figure
  plot(t,x(t./(1.5))); xlabel('t'); ylabel('x(t/1.5)'); grid;
%%  
  % x(-t)
  figure
  plot(t,x(-t)); xlabel('t'); ylabel('x(-t)'); grid;
%%  
  % x(2t-4)
  figure
  plot(t,x(2.*t-4)); xlabel('t'); ylabel('x(2t-4)'); grid;
%%  
  % x(2-t)
  figure
  plot(t,x(2-t)); xlabel('t'); ylabel('x(2-t)'); grid;
%%
 %% Problema 3 
 %%
 % *Graficar las siguientes funciones* estas graficas van de R->R
 % <<transformadasFourier.PNG>> 
 % 
 
a=1/2; t=-10:0.01:10;
f=@(t) exp(-a*t).*(t>0);
grafica2d(t,f(t),'f(t)');

w=-10:0.01:10;
f=@(t) 1./(1j.*w+a);
grafica2d(t,f(t), 'F(jw)=F(w)');
%%
f=@(t) t.*exp(-a*t).*(t>0);
grafica2d(t,f(t),'f(t)');

f=@(t) 1./(1j.*w+a).^2;
grafica2d(t,f(t), 'F(jw)=F(w)');
%%
n=2;
f=@(t) (t.^n).*exp(-a.*t).*(t>0);
grafica2d(t,f(t), 'f(t)');

f=@(t) factorial(n)./(1j.*w+a).^(n+1);
grafica2d(t,f(t), 'F(jw)=F(w)');
%% Problema 4  
% Graficar las mismas funciones del problema 3 pero que vayan de R->R^2
% 
f = @(w) 1./(w.*1j+a);
grafica3d(w,real(f(w)), imag(f(w)),'F(jw)=F(W)');
%
%%
f=@(w) 1./(1j.*w+a).^2;
grafica3d(w,real(f(w)), imag(f(w)),'F(jw)=F(W)');
%%
f=@(w) factorial(n)./(1j.*w+a).^(n+1);
grafica3d(w,real(f(w)), imag(f(w)),'F(jw)=F(W)');

  
  