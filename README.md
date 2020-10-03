# :large_orange_diamond: Juego de Tetris :large_orange_diamond:
Autor: Andrés Felipe Forero Salas

GitHub nickname: [fore1806](https://github.com/fore1806) 

En el presente proyecto se pretende realizar el repaso de programación estructurada para la materia de Programación Orientada a Objetos, mediante el desarrollo del juego de tetris con el bitwise.

## Objetivo:

Repasar los conceptos básicos de la programación estructurada al implementar el juego del tetris.

## Implementación:

Para el desarrollo del juego del tetris, se utilizaron los conceptos de la programación estructurada, teniendo vital importancia el uso de bitwise para el desarrollo de las colisiones de los tetrominos y de su diagramación. Para la representación del tablero se utilizó un arreglo dinámico. En el desarrollo de la interfaz gráfica, fue indispensable el uso de variables de tipo booleanas y el desarrollo de diversos métodos que incluyen el uso de condicionales, ciclos y la API de Processing.

## Instrucciones de Juego:

Al iniciar el proyecto encontraras diferentes configuraciones, a continuación una pequeña guía para que te diviertas al maximo con el juego de tetris.

### Pantalla de Inicio:

![](images/pantalla-Inicio.JPG)

En esta pantalla puedes utilizar tu mouse para ir a las diferentes funcionalidades, ademas puedes utilizar tu teclado para ir a otras funcionalidades

|Tecla|                               Atajo                            |
|-----|----------------------------------------------------------------|
|  P  |Te lleva directamente al juego con las configuraciones iniciales|
|  H  |Te lleva a la pantalla de como jugar                            |
|  C  |Te lleva a la pantalla de Configuración                         |

### Pantalla de Como Jugar:

![](images/pantallaHow.JPG)

En esta pantalla se encuentran unas instrucciones básicas para poder jugar Tetris. Para navegar entre pantallas puede utilizar el mouse o los siguientes atajos de teclado.

|Tecla|                               Atajo                            |
|-----|----------------------------------------------------------------|
|  P  |Te lleva directamente al juego con las configuraciones iniciales|
|  B  |Te lleva a la pantalla de inicio                                |

### Pantalla de Configuración:

![](images/pantallaConf.JPG)

En esta pantalla puedes realizar la configuración inicial del juego, es decir, los colores de los tetrominos, y el nivel inicial del juego. Estas tareas se pueden realizar con el mouse o con las teclas, mencionadas a continuación.

|Tecla|                               Atajo                            |
|-----|----------------------------------------------------------------|
|  N  |Te lleva a la pantalla de selección de Niveles                  |
|  C  |Te lleva a la pantalla de selección de Colores                  |
|  I  |Define las configuraciones iniciales de colores y nivel         |
|  P  |Te lleva directamente al juego con la configuración determinada |
|  B  |Te lleva a la pantalla de inicio                                |

#### Pantalla de Selección de Nivel

![](images/pantallaNivel.JPG)

En esta pantalla seleccionas el nivel en el que comienza el juego, que definira la velocidad con la que bajan los tetrominos, y la ponderación que tendra el eliminar filas. Para seleccionar el nivel debes utilizar el mouse.

#### Pantalla de Selección de Colores

![](images/pantallaColor.JPG)

En esta pantalla seleccionas el color de cada uno de los tetrominos. Para elegir los colores debes utilizar el mouse.

Los atajos de teclado para ambas pantallas (Selección de Niveles y Colores) se relacionan a continuación

|Tecla|                               Atajo                            |
|-----|----------------------------------------------------------------|
|  P  |Te lleva al juego con las configuraciones realizadas            |
|  B  |Te lleva a la pantalla de configuración                         |

### Pantalla de Juego:

![](images/pantallaJuego.JPG)

Aquí es donde sucede el juego, en esta pantalla se observa el puntaje, nivel y el siguiente tetromino del juego. Para jugar se utilizan los siguientes comandos

| Tecla |                               Atajo                            |
|-----  |----------------------------------------------------------------|
| S-Down|Mueve el tetromino una posición hacia abajo                     |
| A-Left|Mueve el tetromino una posición a la izquierda                  |
|D-Right|Mueve el tetromino una posición a la derecha                    |
|  W-O  |Hace que el tetromino haga una rotación en sentido horario      |
|   P   |Te lleva al menú de Pausa                                       |

#### Menú de Pausa

![](images/pantallaPausa.JPG)

En el manú de Pausa se pueden hacer diferentes cosas desde seguir jugando, pasando por recomenzar el juego y hasata ir a la pantalla de inicio. Para estas funcionalidades contamos con diferentes atajos de teclado.

|Tecla|                               Atajo                            |
|-----|----------------------------------------------------------------|
|  P  |Te permite continuar con la partida actual                      |
|  R  |Te permite comenzar una nueva partida                           |
|  H  |Te lleva a la pantalla de Como Jugar                            |
|  I  |Te lleva a la pantalla de Inicio                                |

### Pantalla de Game Over

![](images/pantallaGameOver.JPG)

Esta pantalla solo se muestra una vez has perdido, en ella se observa tu puntaje y otras opciones a las que se puede acceder con el mouse o con tu teclado de la siguiente forma

|Tecla|                               Atajo                            |
|-----|----------------------------------------------------------------|
|  S  |Puedes consultar los puntajes más altos del juego               |
|  R  |Te lleva a la pantalla de volver a jugar                        |
|  I  |Te lleva a la pantalla de Inicio                                |

#### Pantalla de Mejores Puntajes

![](images/pantallaPuntaje.JPG)

A esta pantalla se puede acceder haciendo click sobre el puntaje obtenido una vez has perdido el juego, o utilizando la tecla S mencionado anteriormente. En esta pantalla se presentan los mejores puntajes obtenidos en el juego durante una sesión. Para seguir jugando u otras funcionalidades se deben utilizar los siguientes atajos de teclado.

|Tecla|                               Atajo                            |
|-----|----------------------------------------------------------------|
|  B  |Te permite volver a la pantalla anterior (pantalla de Game Over)|
|  R  |Te lleva a la pantalla de volver a jugar                        |
|  I  |Te lleva a la pantalla de Inicio                                |

#### Pantalla de Volver a Jugar

![](images/pantallaRestart.JPG)

Esta pantalla te da la opción de volver a jugar en el nivel en el que perdiste durante la partida inmediatamente anterior, o volver a comenzar desde el nivel 1. Para acceder a estas opciones debes utilizar el mouse.