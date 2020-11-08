//Tetris Programación Estructurada 

//Booleanos pantallas
boolean screenInicial = true;
boolean screenHowToPlay= false;
boolean screenConfiguracion = false;
boolean screenNiveles = false;
boolean screenColores = false;
boolean screenGame = false;
boolean screenPause = false;
boolean screenGameOver = false;
boolean screenRestart = false;
boolean screenPuntajes = false;

//Booleano para agregar el puntaje actual
boolean nuevoPuntaje = true;

//Booleano para cuando el tablero tiene fichas en la penultima fila
boolean ultimaPieza = false;

//Configuración de uso común

//Variables para las imagenes del game Over y la pantalla inicial
PImage tetrisImagen;// Imagen de inicio
PImage gameOverImagen;//Imagen del game Over

//fuenteTexto Textos
PFont fuenteTexto;  //Creamos una variable para almacenar una fuenta que introducimos en el proyecto mas adelante

final int redondeo = 7; //redondeo de botones
final color backColor = 20; //Color de fondo del juego en RGB
final color bColor = #E4E0E0;  //Color gris del tablero


//Pantalla de inicio

// Botones
final int buttonW = 730;  //Ancho botones de pantalla de inicio
final int buttonH = 120;  //Alto de botones de pantalla de inicio
final int buttonX = 125;  //Coordenada en x de botones de pantalla de inicio

final int playButtonY = 360;  //Coordenada en y del boton jugar de la pantalla de inicio

final int howButtonY = 520;  //Coordenada en y del boton como jugar de la pantalla de inicio

final int confButtonY = 680;  //Coordenada en y del boton configuracion de la pantalla de inicio


//Pantalla de como jugar

//Botones
final int buttonW2 = 250; //Ancho de los botones de la pantalla de como jugar
final int buttonY2 = 620;  //Coordenada en y de los botones de la pantalla de como jugar

final int playButton2X = 670;  //Coordenada en x del boton de jugar en la pantalla de como jugar

final int backButtonX = 60;  //Coordenad en x del boton volver en la pantalla de como jugar

//Pantalla de configuracion
final int configButtonX = 680;

final int configButtonY = 50;

final int originalButtonX = 200;
final int originalButtonY = 450;

//Constantes botones de nivel Pantalla de selección de Niveles
final int dimLevelButton = 100;
final int levelButtonX1 = 180;
final int levelButtonY1 = 150;

//Pantalla de Seleccion de colores

int posicionXCuadroColor;
int posicionYCuadroColor;

color [][] matrizColores = new color [5][7];

//Pantalla de pausa


final int continueButtonY = 60;  //Coordenada en y del boton continuar de la pantalla de pausa

final int restartButtonY = 260;  //Coordenada en y del boton restart de la pantalla de pausa
final int restartButtonY2 = 550;

final int howButtonY2 = 460;  //Coordenada en y del boton como jugar de la pantalla de pausa

final int inicioButtonY = 660;  //Coordenada en y del boton inicio de la pantalla de pausa

//Pantalla restart

final int dimYesNoButtonX = 200;
final int yesNoButtonY = 450;
final int yesButtonX = 190;
final int noButtonX = 590;


//Pantalla de juego

//Representacion del tablero en forma de una matriz 21X12
final int rows = 21;  //Filas de la matriz del tablero
final int columns = 12;  //Columnas de la matriz del tablero

//Utilizamos un ArrayList para facilitar la eliminacion y la adicion de filas
ArrayList<color[]> tablero = new ArrayList<color[]>();

//Definimos el ancho de cada cuadrado
final int dimCuadro = 40;

//Valores para la representacion

// Matriz en la que almacenamos los valores binarios de cada rotacion de los tetrominos
final int [][] arrayTetrominos = {{61440, 17476, 61440, 17476}, // Valores Binarios de las Rotaciones de la Figura I
  {59392, 50240, 11776, 35008}, // Valores Binarios de las Rotaciones de la Figura L
  {27648, 35904, 27648, 35904}, // Valores Binarios de las Rotaciones de la Figura S
  {50688, 19584, 50688, 19584}, // Valores Binarios de las Rotaciones de la Figura z
  {57856, 17600, 36352, 51328}, // Valores Binarios de las Rotaciones de la Figura J
  {26112, 26112, 26112, 26112}, // Valores Binarios de las Rotaciones de la Figura O
  {58368, 19520, 19968, 35968}};// Valores Binarios de las Rotaciones de la Figura T

//Variables para selección del tetromino a representar
int numTetromino = (int)random (7);  //Esta variable nos dira cual tetromino pintar en el tablero en movimiento
int numNextTetromino = (int)random (7);  //Esta variable nos dira cual tetromino pintar cuando el tetromino se haya posicionado

// Definimos la rotacion inicial en el inicio del array
int tRotation = 0;
int pRotation = 3;

// posicion inicial del tetromino 
int desplazamientoX = 4;  //Centro del tablero (posicion inicial del tetromino)
int desplazamientoY = 0;  //Primera fila del tablero (posicion inicial del tetromino)

//Variables de posicion para dibujar los cuadros de cada tetromino
float posX;
float posY;

//Variables de posicion de cuadros para las rotaciones y coliciones
int posColisionX;
int posColisionY;

//Arreglo de los colores de los tetrominos
color [] tetrominoColor = new color [7];
color colorTetromino;  //Esta variable nos determinara el color del tetromino a dibujar

//Tiempo y eliminación de filas llenas
int timer;  //Tiempo 
int intervalo = 1000;  //Nos dice la velocidad con la que baja la pieza, la utilizamos dependiendo de los niveles
final int cambioIntervalo = 100;
int puntaje = 0;
int nivel = 1;
int eliminatedRows = 0;

//Eliminacion de filas
int[] filasLlenas = {20, 20, 20, 20};
int filasAEliminar = 0;

//Boton de pausa
final int pauseBottonX = 855;
final int pauseBottonY = 100;
final int radioPauseButton = 50;

//Puntajes
int[] highScores = new int [10];


void setup() {
  //Pantalla de 980x480 pixeles, se tendran 250 pixeles libres a lado y lado del tetris
  size(980, 840);

  //Cargamos la fuente de Texto para los textos
  fuenteTexto = loadFont("Cambria-Bold-80.vlw");

  //Cargamos las imagenes
  tetrisImagen = loadImage("tetris.png");
  gameOverImagen = loadImage("game_over.png");

  // Creamos el ArrayList
  tablero = new ArrayList<color[]>();
  // ArrayList de arrays con ceros en sus elementos.
  for (int k = 0; k < rows; k++) {
    tablero.add(new color[columns]);
  }

  //Asignamos el valor de color de borde al tablero con el metodo
  setupTablero();

  //Funciones sobre colores
  coloresIniciales(); //Definimos los colores iniciales de los tetrominos (clasicos)
  llenarRandomColors(); //Llenamos la matriz de seleccion de los colores para la pantalla de configuracion
}


void draw() {

  //Cuando se debe mostrar la pantalla inicial
  if (screenInicial) {
    tetrisInicialScreen();
  }

  //Cuando se debe mostrar la pantalla de juego
  else if (screenGame) {    
    gameScreen();
  }

  //Cuando se debe mostrar la pantalla de como jugar
  else if (screenHowToPlay) {
    howToPlayScreen();
  }

  //Cuando se debe mostrar la pantalla de configuracion
  else if (screenConfiguracion) {
    configuracionScreen();
  }

  //Cuando se debe mostrar la pantalla de seleccion de niveles
  else if (screenNiveles) {
    nivelesScreen();
  }

  //Cuando se debe mostrar la pantalla de seleccion de colores
  else if (screenColores) {
    coloresScreen();
  }

  //Cuando se debe mostrar la pantalla de pausa
  else if (screenPause) {
    pauseScreen();
  } 

  //Cuando se debe mostrar la pantalla de game over
  else if (screenGameOver) {
    gameOverSreen();
  } 

  //Cuando se debe mostrar ña pantalla de Restart
  else if (screenRestart) {
    screenRestartGame();
  }

  //Cuando se debe mostar la pantalla de puntajes
  else if (screenPuntajes) {
    screenPuntajes();
  }
}


//Funciones de interaccion con el usuario

void mousePressed() {

  //Pantalla Inicial
  if (screenInicial) {
    if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > playButtonY) && (mouseY < playButtonY + buttonH)) { //Cambiamos el estado de las pantallas
      screenInicial = false;
      screenGame = true;
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > howButtonY) && (mouseY < howButtonY + buttonH)) {  //Cambiamos el estado de las pantallas
      screenInicial = false;
      screenHowToPlay= true;
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > confButtonY) && (mouseY < confButtonY + buttonH)) { //Cambiamos el estado de las pantallas
      screenInicial = false;
      screenConfiguracion= true;
    }
  } 

  //Pantalla de Como Jugar
  else if (screenHowToPlay) {
    if ((mouseX > playButton2X) && (mouseX < playButton2X + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {  //Cambiamos el estado de las pantallas
      screenGame = true;
      screenHowToPlay= false;
    } else if ((mouseX > backButtonX) && (mouseX < backButtonX + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {  //Cambiamos el estado de las pantallas
      screenInicial = true;
      screenHowToPlay= false;
    }
  }

  //Pantalla de Configuración
  else if (screenConfiguracion) {

    if ((mouseX > playButton2X) && (mouseX < playButton2X + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {  //Cambiamos el estado de las pantallas
      screenGame = true;
      screenConfiguracion= false;
    } else if ((mouseX > backButtonX) && (mouseX < backButtonX + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {  //Cambiamos el estado de las pantallas
      screenInicial = true;
      screenConfiguracion= false;
    } else if ((mouseX > configButtonX) && (mouseX < configButtonX + 200) && 
      (mouseY > configButtonY) && (mouseY < configButtonY + buttonH)) {  //Cambiamos el estado de las pantallas
      screenNiveles = true;
      screenConfiguracion= false;
    } else if ((mouseX > configButtonX) && (mouseX < configButtonX + 200) && 
      (mouseY > (configButtonY + buttonH + 50)) && (mouseY < (configButtonY + buttonH + 50) + buttonH)) { //Cambiamos el estado de las pantallas
      screenColores = true;
      screenConfiguracion= false;
    } else if ((mouseX > originalButtonX) && (mouseX < originalButtonX + 580) && 
      (mouseY > originalButtonY) && (mouseY < originalButtonY + buttonH)) {  //Cambiamos el estado de las pantallas
      nivel = 1;
      intervalo = 1000;
      coloresIniciales();
    }
  }

  //Pantalla de Seleccion de Colores
  else if (screenColores) {
    colorSeleccionado();
  }

  //Pantalla de Seleccion de Colores
  else if (screenNiveles) {

    nivelSeleccionado();
    if ((mouseX > playButton2X) && (mouseX < playButton2X + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {
      screenGame = true;
      screenNiveles = false;
    } else if ((mouseX > backButtonX) && (mouseX < backButtonX + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {
      screenConfiguracion = true;
      screenNiveles = false;
    }
  }

  //Pantalla de juego
  else if (screenGame) {
    float d = dist(mouseX, mouseY, pauseBottonX, pauseBottonY);
    if (d<radioPauseButton) {
      screenGame = false;
      screenPause= true;
    }
  }

  //Pantalla de Pausa
  else if (screenPause) {
    if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > continueButtonY) && (mouseY < continueButtonY + buttonH)) {
      screenPause = false;
      screenGame = true;
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > restartButtonY) && (mouseY < restartButtonY + buttonH)) {
      screenPause = false;
      screenRestart= true;
      restart();
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > howButtonY2) && (mouseY < howButtonY2 + buttonH)) {
      screenPause = false;
      screenHowToPlay= true;
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > inicioButtonY) && (mouseY < inicioButtonY + buttonH)) {
      screenPause = false;
      screenInicial = true;
      restart();
    }
  }

  //Pantalla de GameOver
  else if (screenGameOver) {
    if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > restartButtonY2) && (mouseY < restartButtonY2 + buttonH)) {
      screenRestart = true;
      screenGameOver = false;
      restart();
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > inicioButtonY + 50) && (mouseY < inicioButtonY + buttonH + 50)) {
      screenInicial = true;
      screenGameOver = false;
      restart();
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > restartButtonY2 -(50+buttonH)) && (mouseY < restartButtonY2 - 50)) {
      screenPuntajes = true;
      screenGameOver = false;
    }
  }

  //Pantalla de Restart
  else if (screenRestart) {
    if ((mouseX > yesButtonX) && (mouseX < yesButtonX + dimYesNoButtonX) && 
      (mouseY > yesNoButtonY) && (mouseY < yesNoButtonY + buttonH)) {
      screenRestart = false;
      screenGame = true;
      restart();
    } else if ((mouseX > noButtonX) && (mouseX < noButtonX + dimYesNoButtonX) && 
      (mouseY > yesNoButtonY) && (mouseY < yesNoButtonY + buttonH)) {
      intervalo = 1000;
      nivel = 1;
      screenRestart = false;
      screenGame = true;
      restart();
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > inicioButtonY) && (mouseY < inicioButtonY + buttonH)) {
      screenInicial = true;
      screenGameOver = false;
      restart();
    }
  }
}


void keyPressed() {

  //Pantalla de Juego
  if (screenGame) {
    //Movimiento a la izquierda
    if (keyCode == 65 || keyCode == 37) {
      if (!leftKnock(numTetromino)) {
        desplazamientoX--;
      }
    }
    //Movimiento a la derecha
    else if (keyCode == 68 || keyCode == 39) {
      if (!rightKnock(numTetromino)) {
        desplazamientoX++;
      }
    }
    //Movimiento hacia abajo
    else if (keyCode == 83 || keyCode == 40) {
      if (!downKnock(numTetromino)) {
        desplazamientoY++;
      }
      //Puntaje adicional por bajar mas rapido
      if (nivel<=5) {
        puntaje += 1;
      } else {
        puntaje += 3;
      }
    }
    //Menu de pausa
    else if (key == 'p' || key == 'P') {
      screenPause = true;
      screenGame = false;
    }
    //Rotación
    else if (key == 'W' || key == 'w' || key == 'O' || key == 'o') {
      pRotation = tRotation;
      tRotation = (tRotation + 1)%4;
      if (rotationKnock(numTetromino)) {
        tRotation = pRotation;
      };
    }
  }

  //Pantalla de Seleccion de Colores
  else if (screenColores) {
    //Jugar
    if (key == 'p' || key == 'P') {
      screenColores = false;
      screenGame = true;
    } 
    //Pantalla de Configuración
    else if (key =='b' || key == 'B') {
      screenColores = false;
      screenConfiguracion = true;
    }
  }

  //Pantalla de Selección de niveles
  else if (screenNiveles) {
    //Jugar
    if (key == 'p' || key == 'P') {
      screenNiveles = false;
      screenGame = true;
    } 
    //Pantalla de Configuración
    else if (key =='b' || key == 'B') {
      screenNiveles = false;
      screenConfiguracion = true;
    }
  }

  //Pantalla Inicial
  else if (screenInicial) {
    //Jugar
    if (key == 'p' || key == 'P') {
      screenInicial = false;
      screenGame = true;
    }
    //Pantalla de Configuracion
    else if (key =='c' || key == 'C') {
      screenInicial = false;
      screenConfiguracion = true;
    }
    //Pantalla de Como Jugar
    else if (key == 'h' || key =='H') {
      screenInicial = false;
      screenHowToPlay = true;
    }
  }

  //Pantalla de Como Jugar
  else if (screenHowToPlay) {
    //Jugar
    if (key == 'p' || key == 'P') {
      screenHowToPlay = false;
      screenGame = true;
    } 
    //Pantalla de Inicio
    else if (key =='b' || key == 'B') {
      screenHowToPlay = false;
      screenInicial = true;
    }
  } 

  //Pantalla de Pausa
  else if (screenPause) {
    //Jugar
    if (key == 'p' || key == 'P') {
      screenPause = false;
      screenGame = true;
    } 
    //Inicio
    else if (key == 'i' || key == 'I') {
      screenPause = false;
      screenInicial = true;
      restart();
    } 
    //Pantalla de Como Jugar
    else if (key == 'h' || key == 'H') {
      screenPause = false;
      screenHowToPlay = true;
    } 
    //Pantalla de reiniciar
    else if (key == 'r' || key == 'R') {
      screenPause = false;
      screenRestart = true;
    }
  }

  //Pantalla de Configuracion
  else if (screenConfiguracion) {
    //Jugar
    if (key == 'p' || key == 'P') {
      screenConfiguracion = false;
      screenGame = true;
    }
    //Pantalla de Inicio
    else if (key =='b' || key == 'B') {
      screenConfiguracion = false;
      screenInicial = true;
    } 
    //Pantalla de Seleccion de Colores
    else if (key == 'c' || key == 'C') {
      screenConfiguracion = false;
      screenColores = true;
    } 
    //Pantalla de Seleccion de Niveles
    else if (key == 'n' || key == 'N') {
      screenConfiguracion = false;
      screenNiveles = true;
    }
    //Volvemos a las condiciones iniciales del juego
    else if (key == 'i' || key == 'I') {
      nivel = 1;
      intervalo = 1000;
      coloresIniciales();
    }
  }

  //Pantalla de Game Over
  else if (screenGameOver) {
    //Pantalla de restart
    if (key == 'r' || key == 'R') {
      screenGameOver = false;
      screenRestart = true;
    }
    //Pantalla de inicio
    else if (key == 'i' || key == 'I') {
      screenGameOver = false;
      screenInicial = true;
      restart();
    } 
    //Pantalla de Puntajes
    else if (key == 's' || key == 'S') {
      screenGameOver = false;
      screenPuntajes = true;
    }
  }

  //Pantalla de Puntajes
  else if (screenPuntajes) {
    //Pantalla de restart
    if (key == 'r' || key == 'R') {
      screenPuntajes = false;
      screenRestart = true;
    }
    //Pantalla de GameOver
    else if (key == 'b' || key == 'B') {
      screenGameOver = true;
      screenPuntajes = false;
    } 
    //Pantalla de Inicio
    else if (key == 'i' || key == 'I') {
      screenGameOver = false;
      screenInicial = true;
      restart();
    }
  }
}


//Metodos de cada pantalla con funciones adicionales

// Pantalla de inicio
void tetrisInicialScreen() {

  background(backColor);

  push();
  fill(bColor);
  rect(buttonX, playButtonY, buttonW, buttonH, redondeo);
  rect(buttonX, howButtonY, buttonW, buttonH, redondeo);
  rect(buttonX, confButtonY, buttonW, buttonH, redondeo);
  pop();

  image(tetrisImagen, 20, 20, 940, 330); //Imagen del comienzo

  push();
  textFont(fuenteTexto);
  textSize(80);
  textAlign(CENTER, CENTER);
  fill(backColor);
  text("JUGAR", buttonX + buttonW/2, playButtonY+buttonH/2);
  text("¿COMO JUGAR?", buttonX + buttonW/2, howButtonY+buttonH/2);
  text("CONFIGURACIÓN", buttonX + buttonW/2, confButtonY+buttonH/2);
  pop();
}

// Pantalla de instrucciones
void howToPlayScreen() {
  background(backColor);

  push();
  textFont(fuenteTexto);
  textAlign(CENTER, CENTER);
  fill(240);
  //Titulo
  textSize(80);
  text("¿CÓMO JUGAR?", width/2, 80);
  //Cuerpo
  textSize(35);
  text("Para mover el tetromino puedes utilizar las letras", width/2, 200);
  text("A, S, D o las flechas de tu teclado. Si deseas rotar", width/2, 260);
  text("tu tetromino utiliza la tecla W o la tecla O. Si ", width/2, 320);
  text("deseas pausar el juego oprime la tecla P. Que tambien", width/2, 380);
  text("puedes utilizar para jugar desde diferentes pantallas.", width/2, 440);
  text("Otros atajos de teclado son la tecla B para volver ", width/2, 500);
  text("a la pantalla anterior o R para ir a la pantalla de restart.", width/2, 560);
  pop();
  //Botones
  push();
  fill(bColor);
  rect(playButton2X, buttonY2, buttonW2, buttonH, redondeo);
  rect(backButtonX, buttonY2, buttonW2, buttonH, redondeo);
  pop();
  //Texto Botones
  push();
  textFont(fuenteTexto);
  textSize(60);
  textAlign(CENTER, CENTER);
  fill(backColor);
  text("JUGAR", playButton2X + buttonW2/2, buttonY2 + buttonH/2);
  text("INICIO", backButtonX + buttonW2/2, buttonY2 + buttonH/2);
  pop();
}

// Pantalla de configuracion
void configuracionScreen() {
  background(backColor);
  //Botones
  push();
  fill(bColor);
  rect(configButtonX, configButtonY, 200, buttonH, redondeo);
  rect(configButtonX, (configButtonY + buttonH + 50), 200, buttonH, redondeo);
  rect(playButton2X, buttonY2, buttonW2, buttonH, redondeo);
  rect(backButtonX, buttonY2, buttonW2, buttonH, redondeo);
  rect(originalButtonX, originalButtonY, 580, buttonH, redondeo);
  pop();
  //Texto 
  push();
  textFont(fuenteTexto);
  textAlign(CENTER, CENTER);
  fill(240);
  //Titulo
  textSize(60);
  text("Nivel inicial", 315, configButtonY+buttonH/2);
  text("Colores", 315, (configButtonY + buttonH + 50)+buttonH/2 );
  //texto Botones
  fill(backColor);
  textSize(25);
  text("PERSONALIZAR", configButtonX + 100, configButtonY+buttonH/2);
  text("PERSONALIZAR", configButtonX + 100, (configButtonY + buttonH + 50)+buttonH/2 );
  textSize(45);
  text("CONFIGURACIÓN INICIAL", width/2, originalButtonY + buttonH/2);
  textSize(80);
  text("JUGAR", playButton2X + buttonW2/2, buttonY2 + buttonH/2);
  text("ATRAS", backButtonX + buttonW2/2, buttonY2 + buttonH/2);
  pop();
}

//Pantalla de niveles
void nivelesScreen() {
  background(backColor);
  //Botones
  push();
  fill(bColor);
  strokeWeight(2);
  for (int i = 0; i < 5; i++) {  //Ciclo para dibujar los 10 cuadros de los botones de los niveles
    for (int j = 0; j < 2; j++) {
      rect(levelButtonX1 + i*130, levelButtonY1 + j*130, dimLevelButton, dimLevelButton, redondeo);
    }
  }
  rect(playButton2X, buttonY2, buttonW2, buttonH, redondeo);
  rect(backButtonX, buttonY2, buttonW2, buttonH, redondeo);
  pop();
  //Texto Botones
  push();
  textFont(fuenteTexto);
  textAlign(CENTER, CENTER);
  fill(backColor);
  textSize(80);
  int numeroNivel; //Variable auxiliar
  for (int i = 0; i < 5; i++) {  //Ciclo para poner el numero en cada boton
    for (int j = 0; j < 2; j++) {
      numeroNivel = (i+1)+5*j;
      text(numeroNivel, levelButtonX1 + i*130 + dimLevelButton/2, levelButtonY1 + j*130 + dimLevelButton/2);
    }
  }
  text("JUGAR", playButton2X + buttonW2/2, buttonY2 + buttonH/2);
  text("ATRAS", backButtonX + buttonW2/2, buttonY2 + buttonH/2);
  pop();
}

//Funcion para seleccionar el nivel
void nivelSeleccionado() {
  for (int i = 0; i<5; i++) {  //Ciclo para evaluar la posicion del mouse con respecto a los botones de los nivels
    for (int j=0; j<2; j++) {
      if ((mouseX>180 + i*130) && (mouseX<(180 + i*130+dimLevelButton)) && (mouseY>150+ j*130) && (mouseY<(150+ j*130 + dimLevelButton))) {
        nivel = (i+1) + (5*j);
        intervalo = 1000-((nivel-1)*cambioIntervalo);
      }
    }
  }
}

//Pantalla de colores
void coloresScreen() {
  background(backColor);
  for (int i=0; i<=4; i++) {  //Ciclo para dibujar los 35 cuadros para los colores
    for (int j=0; j<=6; j++) {
      push();
      strokeWeight(2);
      fill(matrizColores[i][j]);
      posicionXCuadroColor = 490 + i*80;
      posicionYCuadroColor = dimCuadro + 3*j*dimCuadro;
      square(posicionXCuadroColor, posicionYCuadroColor, dimCuadro);
      pop();
    }
  }
  //Ciclo para dibujar los tetrominos en la parte izquierda de la pantalla de seleccion
  for (int k = 0; k<=6; k++) {
    push();
    strokeWeight(2);
    fill(tetrominoColor[k]);
    for (int i = 0; i <= 15; i++) {
      if ((arrayTetrominos[k][0] & (1 << 15 - i)) != 0) {
        posX = (i%4)*dimCuadro + 150;
        posY = ((i/4)|0) * dimCuadro + dimCuadro + k*dimCuadro*3 - 20;
        square(posX, posY, dimCuadro);
      }
    }
    pop();
  }
}

void coloresIniciales() {
  //Color clasico de cada tetromino
  tetrominoColor[0] = #1EE1D4; //Color tetromino I 
  tetrominoColor[1] = #EE9709; //Color tetromino L
  tetrominoColor[2] = #35C067; //Color tetromino S
  tetrominoColor[3] = #B81A16; //Color tetromino Z
  tetrominoColor[4] = #26339A; //Color tetromino J 
  tetrominoColor[5] = #F7F619; //Color tetromino O
  tetrominoColor[6] = #B056E7; //Color tetromino T
}

void llenarRandomColors() {  //Función para asignar colores random a los 35 cuadros
  for (int i=0; i<=4; i++) {
    for (int j=0; j<=6; j++) {
      int r = (int)random(256);
      int g = (int)random(256);
      int b = (int)random(256);
      matrizColores[i][j] = color(r, g, b);
    }
  }
}

void colorSeleccionado() {  //Funcion para la seleccion del color
  for (int i = 0; i<5; i++) {  //Funcion para evaluar la posicion del mouse respecto a los cuadro de colores
    for (int j=0; j<7; j++) {
      if ((mouseX>490 + i*80) && (mouseX<(490 + i*80+dimCuadro)) && (mouseY>dimCuadro + 3*j*dimCuadro) && (mouseY<(dimCuadro + 3*j*dimCuadro + dimCuadro))) {
        tetrominoColor[j] = matrizColores[i][j];  //Se asigna al arreglo de los colores de los tetrominos el color clickeado
      }
    }
  }
}

//Pantalla de Pausa
void pauseScreen() {

  background(backColor);
  //Botones
  push();
  fill(bColor);
  rect(buttonX, continueButtonY, buttonW, buttonH, redondeo);
  rect(buttonX, restartButtonY, buttonW, buttonH, redondeo);
  rect(buttonX, howButtonY2, buttonW, buttonH, redondeo);
  rect(buttonX, inicioButtonY, buttonW, buttonH, redondeo);
  pop();
  //Texto Botones
  push();
  textFont(fuenteTexto);
  textSize(80);
  textAlign(CENTER, CENTER);
  fill(backColor);
  text("CONTINUAR", buttonX + buttonW/2, continueButtonY+buttonH/2);
  text("RESTART", buttonX + buttonW/2, restartButtonY+buttonH/2);
  text("¿COMO JUGAR?", buttonX + buttonW/2, howButtonY2+buttonH/2);
  text("INICIO", buttonX + buttonW/2, inicioButtonY+buttonH/2);
  pop();
}


//Pantalla de game over
void gameOverSreen() {

  background(backColor);
  //Botones
  push();
  fill(bColor);
  rect(buttonX, restartButtonY2-50 - buttonH, buttonW, buttonH, redondeo);
  rect(buttonX, restartButtonY2, buttonW, buttonH, redondeo); //Boton de restart, reutilizamos la variable de altura de How2
  rect(buttonX, inicioButtonY + 50, buttonW, buttonH, redondeo);
  pop();
  //Imagen
  image(gameOverImagen, 20, 20, 940, 330);
  //Texto Botones
  push();
  textFont(fuenteTexto);
  textSize(80);
  textAlign(CENTER, CENTER);
  fill(backColor);
  text("RESTART", buttonX + buttonW/2, restartButtonY2 +buttonH/2);
  text("INICIO", buttonX + buttonW/2, inicioButtonY + 50 +buttonH/2);
  text("Score Final:", buttonX + buttonW/4 + 60, restartButtonY2-50- buttonH+buttonH/2);
  textSize(40);
  text(puntaje, buttonX + buttonW*3/4 + 35, restartButtonY2-50- buttonH+buttonH/2);
  pop();
  //Metodo que añade nuestro puntaje a los puntajes mas altos, si asi debe ser
  puntajeSuperior();
}

//Funcion puntajeSuperior
void puntajeSuperior() {
  if (puntaje>highScores[9] && nuevoPuntaje) {
    highScores[9] = puntaje;
    nuevoPuntaje = false;
  }
  highScores = sort(highScores);  //Organizamos de menor a mayor
  highScores = reverse(highScores);  //Reorganizamos de mayor a menor
}

//Pantalla de Restart
void screenRestartGame() {
  background(backColor);
  //Botones
  push();
  fill(bColor);
  rect(buttonX, inicioButtonY, buttonW, buttonH, redondeo);
  rect(yesButtonX, yesNoButtonY, dimYesNoButtonX, buttonH, redondeo);
  rect(noButtonX, yesNoButtonY, dimYesNoButtonX, buttonH, redondeo);
  pop();
  //Texto Botones
  push();
  textFont(fuenteTexto);
  textAlign(CENTER, CENTER);
  fill(240);
  //Titulo
  textSize(80);
  text("Reiniciar el juego", width/2, 80);
  //Texto Botones
  fill(backColor);
  text("SI", yesButtonX + dimYesNoButtonX/2, yesNoButtonY +buttonH/2);
  text("NO", noButtonX + dimYesNoButtonX/2, yesNoButtonY +buttonH/2);
  text("INICIO", buttonX + buttonW/2, inicioButtonY +buttonH/2);
  //Cuerpo
  textSize(40);
  fill(240);
  text("¿Al reiniciar el juego deseas", width/2, 200);
  text("continuar en el nivel", width/2, 260);
  text("en el que te encuentras?", width/2, 320);
  pop();
}

//Pantalla de Puntajes
void screenPuntajes() {
  background(backColor);

  push();
  textFont(fuenteTexto);
  textAlign(CENTER, CENTER);
  fill(240);
  //Titulo
  textSize(80);
  text("High Scores", width/2, 80);
  for (int i=0; i<10; i++) {  //Ciclo para mostrar el arreglo de puntjaes mas altos
    textSize(50);
    text(highScores[i], width/2, 190 + 50*i);
  }
  //Puntaje Actual
  text("Tu puntaje fue:", width/2, 720);
  text(puntaje, width/2, 780);
  pop();
}


//Pantalla de Juego
void gameScreen() {
  background(backColor);

  drawTablero();  //Dibujamos el tablero junto con los tetrominos ya estaticos
  levelScore();   //Funcion para mostrar el puntaje y el nivel en el recuadro de la derecha 
  rectPiezaSig();  //Funcion para dibujar el rectangulo en el que se dibuja el siguiente tetromino
  drawTetromino(numNextTetromino, 0);  //Dibujamos el siguiente tetromino
  drawTetromino(numTetromino, 1);  //Dibujamos el tetromino que esta en movimiento 
  tiempo();  //Funcion del tiempo para hacer bajar el tetromino o eliminar filas
  gameOver();  //Metodo que evalua si hay piezas en la ultima fila del juego
  pauseBotton();  //Dibuja el boton de pausa
  nivelActual();  //Metodo para el cambio de nivel
}

//Funciones para jugar

//Funcion para dibujar los tetrominos en pantalla
void drawTetromino(int numero, int siMovimiento) {

  //Definimos el color aqui, para no tener que definirlo posteriormente a la hora de guardar el tetromino en el arrreglo
  colorTetromino =tetrominoColor[numero]; 

  //Dibujamos el tetromino que se tiene movimiento (el que va cayendo)
  if (siMovimiento ==1) {  
    push();
    strokeWeight(2);
    fill(colorTetromino);
    //Evaluamos si en la penultima fila, en las columnas en las que sale el nuevo tetromino ya hay tetrominos
    for (int j = 4; j < 8; j++) {
      if (tablero.get(1)[j] != 0) {
        ultimaPieza = true;
      }
    }

    //Si hay piezas en esta zona debemos dibujar el tetromino desde una posicion mas arriba
    if (ultimaPieza) {
      for (int i = 0; i <= 15; i++) {
        if ((arrayTetrominos[numero][tRotation] & (1 << 15 - i)) != 0) {
          posX = (i%4)*dimCuadro + desplazamientoX*dimCuadro + 250;
          posY = ((i/4)|0) * dimCuadro + desplazamientoY*dimCuadro - 40;
          square(posX, posY, dimCuadro);
        }
      }
    } 
    //Dibujamos normal
    else {
      for (int i = 0; i <= 15; i++) {
        if ((arrayTetrominos[numero][tRotation] & (1 << 15 - i)) != 0) {
          posX = (i%4)*dimCuadro + desplazamientoX*dimCuadro + 250;
          posY = ((i/4)|0) * dimCuadro + desplazamientoY*dimCuadro;
          square(posX, posY, dimCuadro);
        }
      }
    }
    pop();
  }
  //Dibujamos el Tetromino que debe ser el siguiente en el rectangulo de la funcion rectPiezaSig
  else {
    push();
    strokeWeight(2);
    fill(colorTetromino);
    for (int i = 0; i <= 15; i++) {
      if ((arrayTetrominos[numero][0] & (1 << 15 - i)) != 0) {
        posX = (i%4)*dimCuadro + 45;
        posY = ((i/4)|0) * dimCuadro + 8*dimCuadro;
        square(posX, posY, dimCuadro);
      }
    }
    pop();
  }
}

//Funcion del tiempo, para bajar el tetromino y eliminar filas llenas
void tiempo() {
  if (millis() - timer >= intervalo) {
    yMovement();  //Bajamos el tetromino en movimiento una casilla
    timer = millis();  //Asignamos el valor de millis a la variable para asi empezar un nuevo "intervalo"
    deleteCompleteRows();  //Eliminamos las filas llenas
  }
}

//Funcion para dibujar el rectangulo gris en el que se muestra el siguiente tetromino a dibujar
void rectPiezaSig() {
  //Rectangulo externo
  push();
  fill(bColor);
  stroke(backColor);
  strokeWeight(5);
  rect(5, 7*dimCuadro, 6*dimCuadro, 4*dimCuadro);
  pop();
  //Rectangulo interior
  push();
  fill(backColor);
  stroke(backColor);
  strokeWeight(5);
  rect(45, 8*dimCuadro, 4*dimCuadro, 2*dimCuadro);
  pop();
  //Dibujamos las lineas para darle la misma apariencia del tablero a este rectangulo
  push();
  fill(backColor);
  strokeWeight(2);
  for (int i = 5; i<=(6*dimCuadro+5); i += dimCuadro) {
    line(i, 7*dimCuadro, i, 11*dimCuadro);
  }
  for (int j=7*dimCuadro; j<=11*dimCuadro; j+=dimCuadro) {
    line(5, j, 245, j);
  }
  pop();
}

//Funcion para devolver el tablero a su estado inicial (setup)
void setupTablero() {
  //imprimirArrayList();
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      if (j == 0 || j == columns - 1 || i == rows - 1) {
        tablero.get(i)[j] = bColor;  //Color gris en los cuadros del borde
      } else {
        tablero.get(i)[j] = 0;   //Color negro en el tablero (Donde caen los tetrominos)
      }
    }
  }
}

//Funcion para dibujar el tablero, junto con los tetrominos ya posicionados
void drawTablero() {
  for (int i=0; i < rows; i++) {
    push();
    stroke(125);
    line(250, i*dimCuadro, width - 250, i*dimCuadro);
    pop();
    for (int j=0; j < columns; j++) {
      push();
      stroke(125);
      line(j*dimCuadro+250, 0, j*dimCuadro+250, height);
      pop();
      if (tablero.get(i)[j] != 0) {  //Solo dibujamos los cuadros que no son ceros (posiciones vacias)
        push();
        stroke(0);
        strokeWeight(2);
        fill(tablero.get(i)[j]);
        square(j*dimCuadro+250, i*dimCuadro, dimCuadro);
        pop();
      }
    }
  }
}


//Funciones booleanas para los Choques

//Choque a la abajo
boolean downKnock(int numero) {
  if (ultimaPieza) {
    for (int i = 0; i < 16; i ++) {
      if ((arrayTetrominos[numero][tRotation] & (1 << i)) != 0) {
        posColisionX = ((15-i)%4) + desplazamientoX;
        posColisionY = (((15-i)/4)|0) + desplazamientoY -1;
        if ((tablero.get(posColisionY+1)[posColisionX] != 0)) {
          if (!screenGameOver) {
            nextTetromino(numTetromino);
          }
          return true;
        }
      }
    }
    return false;
  } else {
    for (int i = 0; i < 16; i ++) {
      if ((arrayTetrominos[numero][tRotation] & (1 << i)) != 0) {
        posColisionX = ((15-i)%4) + desplazamientoX;
        posColisionY = (((15-i)/4)|0) + desplazamientoY;
        if (tablero.get(posColisionY+1)[posColisionX] != 0) {
          if (!screenGameOver) {
            nextTetromino(numTetromino);
          }
          return true;
        }
      }
    }
    return false;
  }
}

//Funcion para el movimiento en la vertical
void yMovement() {
  if (!downKnock(numTetromino)) {  //Si no hay choque en la vertical, dibujamos el tetromino un posicion abajo
    desplazamientoY++;
  }
}

//Choque a la izquierda
boolean leftKnock(int numero) {

  for (int j = 0; j < 4; j++)
  {
    for (int i = j; i < 16; i += 4) {
      if ((arrayTetrominos[numero][tRotation] & (1 << 15 - i)) != 0) {
        posColisionX = (i%4) + desplazamientoX;
        posColisionY = ((i/4)|0) + desplazamientoY;
        if (tablero.get(posColisionY)[posColisionX-1] != 0)
          return true;
      }
    }
  }
  return false;
}

//Choque a la derecha
boolean rightKnock(int numero) {

  for (int j = 0; j < 4; j++)
  {
    for (int i = j; i < 16; i += 4) {
      if ((arrayTetrominos[numero][tRotation] & (1 << i)) != 0) {
        posColisionX = ((15-i)%4) + desplazamientoX;
        posColisionY = (((15-i)/4)|0) + desplazamientoY;
        if (tablero.get(posColisionY)[posColisionX+1] != 0)
          return true;
      }
    }
  }
  return false;
}

//Choque al hacer una rotacion
boolean rotationKnock(int numero) {

  for (int i = 0; i <= 15; i++) {
    if ((arrayTetrominos[numero][tRotation] & (1 << 15 - i)) != 0) {
      posColisionX = (i%4) + desplazamientoX;
      posColisionY = ((i/4)|0) + desplazamientoY;
      if (tablero.get(posColisionY)[posColisionX] != 0) return true;
    }
  }
  return false;
}

//Funcion para dibujar el siguiente tetromino, salva su posicion en la matriz y reinicia las variables, dando al tetromino a dibujar en movimiento el valor del tetromino que se encontraba como siguiente
void nextTetromino(int numero) {
  if (ultimaPieza) {
    for (int i = 0; i <= 15; i++) {
      if ((arrayTetrominos[numero][tRotation] & (1 << 15 - i)) != 0) {
        posColisionX = (i%4) + desplazamientoX;
        posColisionY = ((i/4)|0) + desplazamientoY - 1;
        if (posColisionY>=0) {
          tablero.get(posColisionY)[posColisionX] = colorTetromino;
        }
      }
    }
  } else {
    for (int i = 0; i <= 15; i++) {
      if ((arrayTetrominos[numero][tRotation] & (1 << 15 - i)) != 0) {
        posColisionX = (i%4) + desplazamientoX;
        posColisionY = ((i/4)|0) + desplazamientoY;
        tablero.get(posColisionY)[posColisionX] = colorTetromino;
      }
    }
  }
  //Reiniciamos variables
  numTetromino = numNextTetromino;  //Le damos el valor del tetromino que tenemos en la recamara
  numNextTetromino = (int) random (7);  //Nuevo valor Random
  tRotation = 0;
  pRotation = 3;
  desplazamientoX = 4;
  desplazamientoY = 0;
}

//Funcion para eliminar filas que se encuentran completas
void deleteCompleteRows() {
  for (int i = rows - 2; i >= 0; i--) {  //Primero recorremos para ver cuales estan completas
    int j = 0;
    for (j = 1; j < 11 && tablero.get(i)[j] != 0; j++) {
    }
    if (j == 11) {
      filasLlenas[filasAEliminar] = i;  //Si esta completa la añadimos al arrelo
      filasAEliminar += 1;
    }
  }

  for (int k=0; k<4 && (filasLlenas[k]!=20); k++) {  //Eliminamos todas las filas completas
    tablero.remove(filasLlenas[k]);
    puntaje = puntaje + (85*nivel) - nivel + (filasAEliminar*15);
    eliminatedRows +=1;
  }

  for (int k=0; k<4 && (filasLlenas[k]!=20); k++) {  //Finalmente añadimos las filas que se eliminaron en el paso anterior
    tablero.add(0, new color[columns]);
    tablero.get(0)[0] = bColor;
    tablero.get(0)[columns-1] = bColor;
  }

  filasAEliminar = 0;
  for (int r=0; r<4; r++) {
    filasLlenas[r] = 20;
  }
}

//Funcion para dibujar el boton de pausa en la pantalla de juego
void pauseBotton() {
  push();
  ellipseMode(RADIUS);
  fill(bColor);
  circle(pauseBottonX, pauseBottonY, radioPauseButton);
  fill(backColor);
  rect(pauseBottonX-30, pauseBottonY-30, 20, 60);
  rect(pauseBottonX+10, pauseBottonY-30, 20, 60);
  pop();
}

//Funcion para reiniciar el juego cuando se oprima restart
void restart() {
  //Asignamos el valor de 1 para las bordes del tablero
  setupTablero();
  //Reiniciamos todas las variables
  numTetromino = (int) random (7);  //En este caso si debemos tener un nuevo valor random
  numNextTetromino = (int) random (7);
  tRotation = 0;
  pRotation = 3;
  desplazamientoX = 4;
  desplazamientoY = 0;
  puntaje = 0;
  eliminatedRows = 0;
  ultimaPieza = false;
  nuevoPuntaje = true;
}

//Funcion para saber si el jugador perdio
void gameOver() {
  for (int j = 1; j < columns - 2; j++) {
    if (tablero.get(0)[j] != 0) {
      screenGame = false;
      screenGameOver = true;
    }
  }
}

//Funcion nivel
void nivelActual() {
  if ((eliminatedRows == 5) && (nivel < 10)) {
    nivel += 1;
    intervalo -= cambioIntervalo;
    eliminatedRows = 0;
  }
}

//Funcion para mostrar nivel y resultado
void levelScore() {
  //Rectangulo externo gris
  push();
  fill(bColor);
  stroke(backColor);
  strokeWeight(5);
  rect(735, 5*dimCuadro, 6*dimCuadro, 8*dimCuadro);
  pop();
  //Rectangulo interno negro
  push();
  fill(backColor);
  stroke(backColor);
  strokeWeight(5);
  rect(775, 6*dimCuadro, 4*dimCuadro, 6*dimCuadro);
  pop();
  //Textos de nivel y puntaje
  push();
  textFont(fuenteTexto);
  textSize(40);
  textAlign(CENTER, CENTER);
  fill(bColor);
  text("LEVEL", 775 + 2*dimCuadro, 6*dimCuadro + 30);
  text(nivel, 775 + 2*dimCuadro, 6*dimCuadro + 80);
  text("SCORE", 775 + 2*dimCuadro, 9*dimCuadro + 30);
  text(puntaje, 775 + 2*dimCuadro, 9*dimCuadro + 80);
  pop();
  //Lineas para dar aspecto de tablero
  push();
  fill(backColor);
  strokeWeight(2);
  for (int i = 735; i<=735+6*dimCuadro; i += 40) {
    line(i, 5*dimCuadro, i, 6*dimCuadro);
    line(i, 12*dimCuadro, i, 13*dimCuadro);
  }
  for (int j = 5*dimCuadro; j <= 13*dimCuadro; j+=dimCuadro) {
    line(735, j, 735 + dimCuadro, j);
    line(735 + 5*dimCuadro, j, 735 + 6*dimCuadro, j);
  }
  pop();
}
