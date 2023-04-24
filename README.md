# Parqueadero Inteligente
Ejercicio para crear un parqueadero inteligente con VHDL, el cual cuente el tiempo que dura cada auto estacionado y cuanto tiempo se pasa de un tiempo pre establecido.
Se requirió que el ejercicio cumpliera con lo siguiente:
Un parqueadero con 8 lugares disponibles desea visualizar el tiempo consumido por las personas cuando ocupan un espacio libre. De esta manera, cada vez que un vehículo llega al parqueadero se debe asignar un lugar e iniciar un temporizador de 35 segundos, al final de este tiempo si el vehículo sigue ocupando el espacio debe avisar por medio de una alarma e iniciar un temporizador que indique el tiempo de mas que ha demorado para su respectiva facturación. Si el vehículo sale dentro del tiempo de los 35 segundos debe detener el temporizador, almacenar el tiempo para una futura felicitación y esperar hasta que un Nuevo vehículo ingrese.
## Implementación
Para que este proyecto funcione se debe generar un proyecto, con la herramienta de quartus, para cada archivo .vhd y añadir en al proyecto principal (**Parquero_Inteligente**) los otros dos archivos vhd.
Para implementarlo es necesario una tarjera FPGA Cyclone III: EP3C16F484C6, y asignar a sus respectivos pines cada entrada o salida del proyecto.
## Funcionamiento
Utilizamos la señal de reloj interna de la tarjeta FPGA la cual está asignada a 50Mhz dentro de un divisor de frecuencia, el cual nos ayuda a obtener una señal final de 1hz la cual se denomina como señal de reloj que nos da el conteo en **segundos**, esta señal se conectará  al contador con el fin de que sus cambios dependan del flanco de subida  de la señal ya dividida.

Para poder proporcionar el conteo tanto ascendente como descendente para cada lugar del parqueadero se creo un contador en un archivo .vhd aparte en cual posteriormente seria utilizado en cada vehículo por medio de port maps.

Cada salida de los port maps se guardo en señales distintas, pudiendo seleccionar cual de ellas ver en el display de 7 segmentos gracias a unos with select los cuales cumplen la función de un multiplexor, dicho multiplexor va que espacio del parqueadero se mostrara en el display  de acuerdo al valor de la señal opción corresponde a la salida de otro contador.

Al decodificador de 7 segmentos llega la señal del contador en cualquier caso particular de with select y posteriormente se utiliza una salida vectorial de 7 espacios para conectarlo a los paneles digitales de 7 segmentos, utilizamos decodificadores individuales para unidades, decenas y espacios del parqueadero.

A continuacion mostramos la vista RTL del proyecto:

![rtl view 1](https://lh3.google.com/u/2/d/1lkGqMccu5FEq0TVybyYicrFkNy0F-C0H=w1868-h903-iv1)

![rtl view 2](https://lh3.google.com/u/2/d/1PDHM3ERQRpVFvZbYpmRD8aIk-sbGO6Y2=w1115-h903-iv1)
