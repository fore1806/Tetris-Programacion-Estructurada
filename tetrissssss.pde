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

PImage tetrisImagen;// Imagen de inicio
PImage gameOverImagen;//Imagen del game Over

//Pantalla de inicio 

int yText = 100; //altura desde arriba para el mensaje tetris
int anchoText = 120; //ancho de cada letra de la palabra tetris
int alturaText = anchoText/2-10; //altura de cada subparte de Tetros
int redondeo = 7; //redondeo de botones
int backColor = 20; //Color de fondo del juego en RGB

// Botones

final int buttonW = 730;  //Ancho botones de pantalla de inicio
final int buttonH = 120;  //Alto de botones de pantalla de inicio
final int buttonX = 125;  //Coordenada en x de botones de pantalla de inicio

//Boton jugar

final int playButtonY = 360;  //Coordenada en y del boton jugar de la pantalla de inicio

//Boton como jugar

final int howButtonY = 520;  //Coordenada en y del boton como jugar de la pantalla de inicio

//Boton como jugar

final int confButtonY = 680;  //Coordenada en y del boton configuracion de la pantalla de inicio


//Fuente Textos

PFont fuente;  //Creamos una variable para almacenar una fuenta que introducimos en el proyecto mas adelante

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

final int dimLevelButton = 100;

final int levelButtonX1 = 180;
final int levelButtonX2 = 310;
final int levelButtonX3 = 440;
final int levelButtonX4 = 570;
final int levelButtonX5 = 700;

final int levelButtonY1 = 150;
final int levelButtonY2 = 280;

//Pantalla restart

final int dimYesNoButtonX = 200;
final int yesNoButtonY = 450;
final int yesButtonX = 190;
final int noButtonX = 590;

//Pantalla de Seleccion de colores

int posicionXCuadroColor;
int posicionYCuadroColor;

color [][] matrizColores = new color [5][7];

//Pantalla de juego

//Representacion del tablero en forma de una matriz 21X12

final int rows = 21;  //Filas de la matriz del tablero
final int columns = 12;  //Columnas de la matriz del tablero

//Utilizamos un ArrayList para facilitar la eliminacion y la adicionde filas
ArrayList<color[]> tablero = new ArrayList<color[]>();

//Definimos el ancho de cada cuadrado
final int dimCuadro = 40;

//Representacion en numero binario de cada tetromino junto con sus rotaciones
final int [] I = {3840, 17476, 61440, 17476};  //Figura I
final int [] L = {59392, 50240, 11776, 35008};  //Figura L
final int [] S = {27648, 35904, 27648, 35904};  //Figura S
final int [] Z = {50688, 19584, 50688, 19584};  //Figura Z
final int [] J = {57856, 17600, 36352, 51328};  //Figura J
final int [] O = {26112, 26112, 26112, 26112};  //Figura O
final int [] T = {58368, 19520, 19968, 35968};  //Figura T

//Valores importantes para la representacion

// Matriz en la que almacenamos los valores binarios de cada rotacion de los tetrominos

final int [][] arrayTetrominos = {{3840, 17476, 61440, 17476}, // Valores Binarios de las Rotaciones de la Figura I
  {59392, 50240, 11776, 35008}, // Valores Binarios de las Rotaciones de la Figura L
  {27648, 35904, 27648, 35904}, // Valores Binarios de las Rotaciones de la Figura S
  {50688, 19584, 50688, 19584}, // Valores Binarios de las Rotaciones de la Figura z
  {57856, 17600, 36352, 51328}, // Valores Binarios de las Rotaciones de la Figura J
  {26112, 26112, 26112, 26112}, // Valores Binarios de las Rotaciones de la Figura O
  {58368, 19520, 19968, 35968}};// Valores Binarios de las Rotaciones de la Figura T

color colorTetromino;  //Esta variable nos determinara el color del tetromino a dibujar
int numFigura = (int)random (7);  //Esta variable nos dira cual tetromino pintar despues
int numFiguraSig = (int)random (7);  //Esta variable nos dira cual tetromino pintar antes

// Definimos la rotacion inicial en el inicio del array
int tRotation = 0;
int pRotation = 3;

// posicion inicial del tetromino 
int desplazamientoX = 4;  //Centro del tablero (posicion inicial del tetromino)
int desplazamientoY = 0;  //Primera fila del tablero (posicion inicial del tetromino)

//Variables de posicion para dibujar los cuadros de cada tetromino
float posX;
float posY;

//Variables de posicion de cuadros para las rotaciones
int posColisionX;
int posColisionY;

//Colores en codigos hexadecimales

//Matriz para los colores de los tetrominos

//                                IColor , LColor, SColor,  ZColor,  JColor,  OColor, TColor 
color [] tetrominoColor = {#1EE1D4, #EE9709, #35C067, #B81A16, #26339A, #F7F619, #B056E7};

final color bColor = #E4E0E0;  //Color gris del tablero

//Parametro posicionX funcion draw Tetromino
//int tableroX = 170;
//int figuraProx = 825;

//Tiempo
int timer;  //Tiempo 
int intervalo = 1000;  //Nos dice la velocidad con la que baja la pieza, la utilizamos dependiendo de los niveles
int cambioIntervalo = 100;
int puntaje = 0;
int nivel = 1;
int eliminatedRows = 0;

//Boton de pausa

final int pauseBottonX = 855;
final int pauseBottonY = 100;
final int radioPauseButton = 50;

//Pantalla de pausa

//Boton Continuar

final int continueButtonY = 60;  //Coordenada en y del boton continuar de la pantalla de pausa

//Boton restart

final int restartButtonY = 260;  //Coordenada en y del boton restart de la pantalla de pausa

//Boton how

final int howButtonY2 = 460;  //Coordenada en y del boton como jugar de la pantalla de pausa

//Boton inicio

final int inicioButtonY = 660;  //Coordenada en y del boton inicio de la pantalla de pausa


final int restartButtonY2 = 460;



void setup() {
  //Pantalla de 980x480 pixeles, se tendran 250 pixeles libres a lado y lado del tetris
  size(980, 840);

  //Fuente para los textos
  fuente = loadFont("Cambria-Bold-80.vlw");
  
  //Cargamos las imagenes
  tetrisImagen = loadImage("tetris.png");
  gameOverImagen = loadImage("game_over.png");

  // Creamos ArrayList de arreglos de ceros como elementos
  tablero = new ArrayList<color[]>();
  // ArrayList de arrays con ceros en sus elementos.
  for (int k = 0; k < rows; k++) {
    tablero.add(new color[columns]);
  }
  setupTablero();
  
  llenarRandomColors();
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
  
  //Cuando se deben mostrar los niveles
  else if(screenNiveles){
    nivelesScreen();
  }
  
  //Cuando se deben mostrar los niveles
  else if(screenColores){
    coloresScreen();
  }

  //Cuando se deba mostrar la pantalla de pausa
  else if (screenPause) {
    pauseScreen();
  } 

  //Cuando se deba mostrar la pantalla de game over
  else if (screenGameOver) {
    gameOverSreen();
  }
  
  else if (screenRestart) {
    screenRestartGame();
  }

  println(puntaje, nivel, eliminatedRows, intervalo);
}


//Funciones de interaccion con el usuario

void mousePressed() {

  if (screenInicial) {
    if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > playButtonY) && (mouseY < playButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenInicial = false;
      screenGame = true;
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > howButtonY) && (mouseY < howButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenInicial = false;
      screenHowToPlay= true;
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > confButtonY) && (mouseY < confButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenInicial = false;
      screenConfiguracion= true;
    }
  } else if (screenHowToPlay) {
    if ((mouseX > playButton2X) && (mouseX < playButton2X + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenGame = true;
      screenHowToPlay= false;
    } else if ((mouseX > backButtonX) && (mouseX < backButtonX + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {
      //Cambiamos el estado de la pantalla
      screenInicial = true;
      screenHowToPlay= false;
    }
  } else if (screenConfiguracion) {
    
    //nivelSeleccionado();
    
    if ((mouseX > playButton2X) && (mouseX < playButton2X + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenGame = true;
      screenConfiguracion= false;
    } else if ((mouseX > backButtonX) && (mouseX < backButtonX + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {
      //Cambiamos el estado de la pantalla
      screenInicial = true;
      screenConfiguracion= false;
    } else if ((mouseX > configButtonX) && (mouseX < configButtonX + 200) && 
      (mouseY > configButtonY) && (mouseY < configButtonY + buttonH)) {
      //Cambiamos el estado de la pantalla
      screenNiveles = true;
      screenConfiguracion= false;
    }else if ((mouseX > configButtonX) && (mouseX < configButtonX + 200) && 
      (mouseY > (configButtonY + buttonH + 50)) && (mouseY < (configButtonY + buttonH + 50) + buttonH)) {
      //Cambiamos el estado de la pantalla
      screenColores = true;
      screenConfiguracion= false;
    }else if ((mouseX > originalButtonX) && (mouseX < originalButtonX + 580) && 
      (mouseY > originalButtonY) && (mouseY < originalButtonY + buttonH)) {
      //Cambiamos el estado de la pantalla
      nivel = 1;
      intervalo = 1000;
      tetrominoColor[0] = #1EE1D4; tetrominoColor[1] = #EE9709; tetrominoColor[2] =#35C067;
      tetrominoColor[3] = #B81A16; tetrominoColor[4] = #26339A; tetrominoColor[5] = #F7F619;
      tetrominoColor[6] =#B056E7;
    }
  }
  
  else if (screenColores){
    colorSeleccionado();
  }
  
  else if (screenNiveles){
    nivelSeleccionado();
    
    if ((mouseX > playButton2X) && (mouseX < playButton2X + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenGame = true;
      screenNiveles = false;
    } else if ((mouseX > backButtonX) && (mouseX < backButtonX + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {
      //Cambiamos el estado de la pantalla
      screenConfiguracion = true;
      screenNiveles = false;
  }
  }
  
  else if (screenGame) {
    float d = dist(mouseX, mouseY, pauseBottonX, pauseBottonY);
    if (d<radioPauseButton) {
      screenGame = false;
      screenPause= true;
    }
  } else if (screenPause) {
    if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > continueButtonY) && (mouseY < continueButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenPause = false;
      screenGame = true;
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > restartButtonY) && (mouseY < restartButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenPause = false;
      screenRestart= true;
      restart();
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > howButtonY2) && (mouseY < howButtonY2 + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenPause = false;
      screenHowToPlay= true;
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > inicioButtonY) && (mouseY < inicioButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenPause = false;
      screenInicial = true;
      restart();
    }
  } else if (screenGameOver) {
    if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > restartButtonY2) && (mouseY < restartButtonY2 + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenRestart = true;
      screenGameOver = false;
      restart();
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > inicioButtonY) && (mouseY < inicioButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenInicial = true;
      screenGameOver = false;
      restart();
    }
  } else if (screenRestart) {
    if ((mouseX > yesButtonX) && (mouseX < yesButtonX + dimYesNoButtonX) && 
      (mouseY > yesNoButtonY) && (mouseY < yesNoButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenRestart = false;
      screenGame = true;
      restart();
    } else if ((mouseX > noButtonX) && (mouseX < noButtonX + dimYesNoButtonX) && 
      (mouseY > yesNoButtonY) && (mouseY < yesNoButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      intervalo = 1000;
      nivel = 1;
      screenRestart = false;
      screenGame = true;
      restart();
    } else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > inicioButtonY) && (mouseY < inicioButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenInicial = true;
      screenGameOver = false;
      restart();
    }
  }
}


void keyPressed() {

  if (screenGame) {
    if (keyCode == 65 || keyCode == 37) {
      if (!leftKnock(numFigura)) desplazamientoX--;
    } else if (keyCode == 68 || keyCode == 39) {
      if (!rightKnock(numFigura)) desplazamientoX++;
    } else if (keyCode == 83 || keyCode == 40) {
      if (!downKnock(numFigura)) desplazamientoY++;
    } else if (key == 'p' || key == 'P') {
      screenPause = true;
      screenGame = false;
    } else if (key == 'W' || key == 'w' || key == 'O' || key == 'o') {
      pRotation = tRotation;
      tRotation = (tRotation + 1)%4;
      // Agregada esta condición para evitar bugs en las rotaciones cerca de un borde.
      if (rotationKnock(numFigura)) {
        tRotation = pRotation;
      };
    }
  } else if(screenColores){
    if(key == 'p' || key == 'P'){
      
      screenColores = false;
      screenGame = true;
      
    } else if (key =='b' || key == 'B'){
      
      screenColores = false;
      screenConfiguracion = true;
    }
    
  }
  else if(screenNiveles){
    if(key == 'p' || key == 'P'){
      
      screenNiveles = false;
      screenGame = true;
      
    } else if (key =='b' || key == 'B'){
      
      screenNiveles = false;
      screenConfiguracion = true;
    }
    
  }
  else if (screenInicial) {
    if(key == 'p' || key == 'P'){
      
      screenInicial = false;
      screenGame = true;
      
    } else if (key =='c' || key == 'C'){
      
      screenInicial = false;
      screenConfiguracion = true;
      
    } else if (key == 'h' || key =='H'){
      
      screenInicial = false;
      screenHowToPlay = true;
      
    }
  } 
  
  else if (screenHowToPlay) {
    if(key == 'p' || key == 'P'){
      
      screenHowToPlay = false;
      screenGame = true;
      
    } else if (key =='b' || key == 'B'){
      
      screenHowToPlay = false;
      screenInicial = true;
    }  
  } 
  
  else if (screenPause) {
    if (key == 'p' || key == 'P') {
      screenPause = false;
      screenGame = true;
    } else if(key == 'i' || key == 'I'){
      screenPause = false;
      screenInicial = true;
      restart();
    }else if(key == 'h' || key == 'H'){
      screenPause = false;
      screenHowToPlay = true;
    }else if(key == 'r' || key == 'R'){
      screenPause = false;
      screenRestart = true;
    }
  }
  
  else if (screenConfiguracion){
    if(key == 'p' || key == 'P'){
      
      screenConfiguracion = false;
      screenGame = true;
      
    } else if (key =='b' || key == 'B'){
      
      screenConfiguracion = false;
      screenInicial = true;
    } else if (key == 'c' || key == 'C'){
      screenConfiguracion = false;
      screenColores = true;
    } else if (key == 'n' || key == 'N'){
      screenConfiguracion = false;
      screenNiveles = true;
    } else if (key == 'i' || key == 'I'){
      nivel = 1;
      intervalo = 1000;
      tetrominoColor[0] = #1EE1D4; tetrominoColor[1] = #EE9709; tetrominoColor[2] =#35C067;
      tetrominoColor[3] = #B81A16; tetrominoColor[4] = #26339A; tetrominoColor[5] = #F7F619;
      tetrominoColor[6] =#B056E7;
    }
  }
  
  else if (screenGameOver){
    if (key == 'r' || key == 'R') {
      screenGameOver = false;
      screenRestart = true;
    } else if(key == 'i' || key == 'I'){
      screenGameOver = false;
      screenInicial = true;
      restart();
    }
  }
}



//Funciones para cada pantalla

// Pantalla de inicio

void tetrisInicialScreen() {

  //int pasox = 130;
  //int pasoy = 70;
  background(backColor);
  
  
  push();
  fill(bColor);
  rect(buttonX, playButtonY, buttonW, buttonH, redondeo);
  rect(buttonX, howButtonY, buttonW, buttonH, redondeo);
  rect(buttonX, confButtonY, buttonW, buttonH, redondeo);
  pop();


  image(tetrisImagen,20,20,940,330);
//fill(255,0,0);
//  rect(100, 50,780,300);


  push();
  textFont(fuente);
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
  textFont(fuente);
  textAlign(CENTER, CENTER);
  fill(240);

  //Titulo
  textSize(80);
  text("¿CÓMO JUGAR?", width/2, 80);

  //Cuerpo
  textSize(40);
  text("Para mover el tetromino puedes", width/2, 200);
  text("utilizar las letras A, S, D", width/2, 260);
  text("O las flechas de tu teclado.", width/2, 320);
  text("Si deseas rotar tu tetromino", width/2, 380);
  text("utiliza la tecla W o la tecla O", width/2, 440);
  text("Si deseas pausar el juego", width/2, 500);
  text("oprime la tecla P", width/2, 560);
  pop();

  push();
  fill(bColor);
  rect(playButton2X, buttonY2, buttonW2, buttonH, redondeo);
  rect(backButtonX, buttonY2, buttonW2, buttonH, redondeo);
  pop();

  push();
  textFont(fuente);
  textSize(60);
  textAlign(CENTER, CENTER);
  fill(backColor);
  text("JUGAR", playButton2X + buttonW2/2, buttonY2 + buttonH/2);
  text("ATRAS", backButtonX + buttonW2/2, buttonY2 + buttonH/2);
  pop();
}


// Pantalla de configuracion

void configuracionScreen() {
  background(backColor);

  push();
  fill(bColor);

  rect(configButtonX,configButtonY,200,buttonH, redondeo);
  rect(configButtonX,(configButtonY + buttonH + 50),200,buttonH, redondeo);
  rect(playButton2X, buttonY2, buttonW2, buttonH, redondeo);
  rect(backButtonX, buttonY2, buttonW2, buttonH, redondeo);
  rect(originalButtonX,originalButtonY, 580, buttonH, redondeo);
  

  pop();
  
  

  push();
  textFont(fuente);
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

void nivelesScreen(){
  background(backColor);
  
  push();
  fill(bColor);
  strokeWeight(2);
  for(int i = 0; i < 5; i++){
    for (int j = 0; j < 2; j++){
      rect(levelButtonX1 + i*130, levelButtonY1 + j*130, dimLevelButton, dimLevelButton, redondeo);
    }
  }
  
  rect(playButton2X, buttonY2, buttonW2, buttonH, redondeo);
  rect(backButtonX, buttonY2, buttonW2, buttonH, redondeo);
  
  pop();
  
  push();
  
  textFont(fuente);
  textAlign(CENTER, CENTER);
  fill(backColor);
  textSize(80);
  
  int numeroNivel;
  
  for(int i = 0; i < 5; i++){
    for (int j = 0; j < 2; j++){
      numeroNivel = (i+1)+5*j;
      text(numeroNivel, levelButtonX1 + i*130 + dimLevelButton/2, levelButtonY1 + j*130 + dimLevelButton/2);
    }
  }
  
  text("JUGAR", playButton2X + buttonW2/2, buttonY2 + buttonH/2);
  text("ATRAS", backButtonX + buttonW2/2, buttonY2 + buttonH/2);
  
  pop();
}

//Funcion para seleccionar el nivel

void nivelSeleccionado(){
  for (int i = 0; i<5; i++){
    for (int j=0; j<2; j++){
      if((mouseX>180 + i*130) && (mouseX<(180 + i*130+dimLevelButton)) && (mouseY>150+ j*130) && (mouseY<(150+ j*130 + dimLevelButton))){
        nivel = (i+1) + (5*j);
        intervalo = 1000-((nivel-1)*cambioIntervalo);
      }
    }
  }
}

//Pantalla de colores

void coloresScreen(){
  background(220);
  for (int i=0; i<=4;i++){
    for (int j=0; j<=6; j++){
      push();
      strokeWeight(2);
      fill(matrizColores[i][j]);
      posicionXCuadroColor = 490 + i*80;
      posicionYCuadroColor = dimCuadro + 3*j*dimCuadro;
      square(posicionXCuadroColor,posicionYCuadroColor,dimCuadro);
      pop();
    }
  }

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

void llenarRandomColors(){
  for (int i=0; i<=4;i++){
    for (int j=0; j<=6; j++){
      int r = (int)random(256);
      int g = (int)random(256);
      int b = (int)random(256);
      matrizColores[i][j] = color(r,g,b);      
    }
  }
}

void colorSeleccionado(){
  for (int i = 0; i<5; i++){
    for (int j=0; j<7; j++){
      if((mouseX>490 + i*80) && (mouseX<(490 + i*80+dimCuadro)) && (mouseY>dimCuadro + 3*j*dimCuadro) && (mouseY<(dimCuadro + 3*j*dimCuadro + dimCuadro))){
        tetrominoColor[j] = matrizColores[i][j];
      }
    }
  }
}

//Pantalla de Juego

void gameScreen() {

  background(backColor);
  drawTablero();
  levelScore();
  rectPiezaSig();
  drawTetromino(numFiguraSig, 0);
  drawTetromino(numFigura, 1);

  if (millis() - timer >= intervalo) {
    yMovement();
    timer = millis();
    deleteCompleteRows();
  }

  gameOver();
  pauseBotton();
  nivelActual();
}


//Pantalla de Pausa

void pauseScreen() {

  background(backColor);
  push();
  fill(bColor);
  rect(buttonX, continueButtonY, buttonW, buttonH, redondeo);
  rect(buttonX, restartButtonY, buttonW, buttonH, redondeo);
  rect(buttonX, howButtonY2, buttonW, buttonH, redondeo);
  rect(buttonX, inicioButtonY, buttonW, buttonH, redondeo);
  pop();

  push();
  textFont(fuente);
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

  push();
  fill(bColor);
  rect(buttonX, restartButtonY2, buttonW, buttonH, redondeo); //Boton de restart, reutilizamos la variable de altura de How2
  rect(buttonX, inicioButtonY, buttonW, buttonH, redondeo);
  pop();
  
  image(gameOverImagen,20,20,940,330);
  //fill(255,0,0);
  //rect(100, 50,780,300);



  push();
  textFont(fuente);
  textSize(80);
  textAlign(CENTER, CENTER);
  fill(backColor);
  text("RESTART", buttonX + buttonW/2, howButtonY2+buttonH/2);
  text("INICIO", buttonX + buttonW/2, inicioButtonY+buttonH/2);
  pop();
}

//Pantalla de Restart

void screenRestartGame() {
  background(backColor);

  push();
  fill(bColor);
  rect(buttonX, inicioButtonY, buttonW, buttonH, redondeo);
  rect(yesButtonX, yesNoButtonY, dimYesNoButtonX, buttonH, redondeo);
  rect(noButtonX, yesNoButtonY, dimYesNoButtonX, buttonH, redondeo);
  pop();

  push();
  textFont(fuente);
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


//Funciones auxiliares para la jugabilidad

//Funcion para dibujar los tetrominos en pantalla

void drawTetromino(int numero, int siMovimiento) {

  //Definimos el color aqui, para no tener que definirlo posteriormente a la hora de guardar
  colorTetromino =tetrominoColor[numero]; 
  
  if (siMovimiento ==1) {
    push();
    //translate(0, -40); //Arranca a dibujar los tetrominos un poco arriba
    strokeWeight(2);
    fill(colorTetromino);
    for (int i = 0; i <= 15; i++) {
      if ((arrayTetrominos[numero][tRotation] & (1 << 15 - i)) != 0) {
        posX = (i%4)*dimCuadro + desplazamientoX*dimCuadro + 250;
        posY = ((i/4)|0) * dimCuadro + desplazamientoY*dimCuadro;
        square(posX, posY, dimCuadro);
      }
    }
    pop();
  } else {
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


//Funcion para dibujar el rectangulo gris en el que se muestra el siguiente tetromino a dibujar

void rectPiezaSig() {

  push();
  fill(bColor);
  stroke(backColor);
  strokeWeight(5);
  rect(5, 7*dimCuadro, 6*dimCuadro, 4*dimCuadro);
  pop();

  push();
  fill(backColor);
  stroke(backColor);
  strokeWeight(5);
  rect(45, 8*dimCuadro, 4*dimCuadro, 2*dimCuadro);
  pop();

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
        tablero.get(i)[j] = bColor;
      } else {
        tablero.get(i)[j] = 0;
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
      if (j == 0 || j == columns - 1 || i == rows - 1) {
        push();
        stroke(0);
        strokeWeight(2);
        fill(bColor);
        square(j*dimCuadro+250, i*dimCuadro, dimCuadro);
        pop();
      } else if (tablero.get(i)[j] != 0) {
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



//Choques

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


//Choque a la abajo

boolean downKnock(int numero) {

  for (int i = 0; i < 16; i ++) {
    if ((arrayTetrominos[numero][tRotation] & (1 << i)) != 0) {
      posColisionX = ((15-i)%4) + desplazamientoX;
      posColisionY = (((15-i)/4)|0) + desplazamientoY;
      if (tablero.get(posColisionY+1)[posColisionX] != 0) {
        if (!screenGameOver) {
          nextTetromino(numFigura);
        }
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
  //int posColisionX;
  //int posColisionY;
  for (int i = 0; i <= 15; i++) {
    if ((arrayTetrominos[numero][tRotation] & (1 << 15 - i)) != 0) {
      posColisionX = (i%4) + desplazamientoX;
      posColisionY = ((i/4)|0) + desplazamientoY;
      tablero.get(posColisionY)[posColisionX] = colorTetromino;
    }
  }

  numFigura = numFiguraSig;
  numFiguraSig = (int) random (7);
  tRotation = 0;
  desplazamientoX = 4;
  desplazamientoY = 0;
}

//Funcion para el movimiento en la vertical

void yMovement() {
  if (!downKnock(numFigura)) { 
    desplazamientoY++;
  }
}


//Funcion para eliminar filas que se encuentran completas

void deleteCompleteRows() {

  for (int i = rows - 2; i >= 0; i--) {
    int j = 0;
    for (j = 1; j < 11 && tablero.get(i)[j] != 0; j++) {
    }
    if (j == 11) {
      tablero.remove(i);
      tablero.add(0, new color[columns]);
      tablero.get(0)[0] = backColor;
      tablero.get(0)[columns-1] = backColor;
      puntaje = puntaje + (100*nivel);
      eliminatedRows +=1;
    }
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

  numFigura = (int) random (7);
  numFiguraSig = (int) random (7);
  tRotation = 0;
  desplazamientoX = 4;
  desplazamientoY = 0;
  puntaje = 0;
  eliminatedRows = 0;
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
  if ((puntaje!=0) && (eliminatedRows == 5) && (nivel < 10)) {
    nivel += 1;
    intervalo -= 70;
    eliminatedRows = 0;
  }
}

//Funcion para mostrar nivel y resultado

void levelScore() {


  push();
  fill(bColor);
  stroke(backColor);
  strokeWeight(5);
  rect(735, 5*dimCuadro, 6*dimCuadro, 8*dimCuadro);
  pop();

  push();
  fill(backColor);
  stroke(backColor);
  strokeWeight(5);
  rect(775, 6*dimCuadro, 4*dimCuadro, 6*dimCuadro);
  pop();


  push();
  textFont(fuente);
  textSize(40);
  textAlign(CENTER, CENTER);
  fill(bColor);
  text("LEVEL", 775 + 2*dimCuadro, 6*dimCuadro + 30);
  text(nivel, 775 + 2*dimCuadro, 6*dimCuadro + 80);
  text("SCORE", 775 + 2*dimCuadro, 9*dimCuadro + 30);
  text(puntaje, 775 + 2*dimCuadro, 9*dimCuadro + 80);
  pop();

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
