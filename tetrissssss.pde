//Booleanos pantallas

boolean screenInicial = true;
boolean screenHowToPlay= false;
boolean screenGame = false;
boolean screenPause = false;

//Pantalla de inicio 

int yText = 100; //altura desde arriba para el mensaje tetris
int anchoText = 120; //ancho de cada letra de la palabra tetris
int alturaText = anchoText/2-10; //altura de cada subparte de Tetros
int redondeo = 7; //redondeo de cada letra
int backColor = 20; //Color de fondo del juego en RGB

// Botones

int buttonW = 570;  //Ancho botones de pantalla de inicio
int buttonH = 120;  //Alto de botones de pantalla de inicio
int buttonX = 125;  //Coordenada en x de botones de pantalla de inicio

//Boton jugar

int playButtonY = 360;  //Coordenada en y del boton jugar de la pantalla de inicio

//Boton como jugar

int howButtonY = 520;  //Coordenada en y del boton como jugar de la pantalla de inicio

//Fuente Textos

PFont fuente;  //Creamos una variable para almacenar una fuenta que introducimos en el proyecto mas adelante

//Pantalla de como jugar

//Botones

int buttonW2 = 250; //Ancho de los botones de la pantalla de como jugar
int buttonY2 = 620;  //Coordenada en y de los botones de la pantalla de como jugar

int playButton2X = 510;  //Coordenada en x del boton de jugar en la pantalla de como jugar

int backButtonX = 60;  //Coordenad en x del boton volver en la pantalla de como jugar

//Pantalla de juego

//Representacion del tablero en forma de una matriz 21X12

int rows = 21;  //Filas de la matriz del tablero
int columns = 12;  //Columnas de la matriz del tablero

//Utilizamos un ArrayList para facilitar la eliminacion y la adicionde filas
ArrayList<int[]> tablero = new ArrayList<int[]>();

//Definimos el ancho de cada cuadrado
int dimCuadro = 40;

//Representacion en numero binario de cada tetromino junto con sus rotaciones
int [] I = {3840, 17476, 61440, 17476};  //Figura I
int [] L = {59392, 50240, 11776, 35008};  //Figura L
int [] S = {27648, 35904, 27648, 35904};  //Figura S
int [] Z = {50688, 19584, 50688, 19584};  //Figura Z
int [] J = {57856, 17600, 36352, 51328};  //Figura J
int [] O = {52224, 52224, 52224, 52224};  //Figura O
int [] T = {58368, 19520, 19968, 35968};  //Figura T

//Valores importantes para la representacion

int [] array;  //Esta variable determinara que tetromino representar mas adelante
color colorTetromino;  //Esta variable nos determinara el color del tetromino a dibujar
int numFiguraA = (int)random (7);  //Esta varianle nos dira cual tetromino pintar despues
int numFiguraS = (int)random (7);  //Esta varianle nos dira cual tetromino pintar antes

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
int posMX;
int posMY;

//Colores en codigos hexadecimales

color bColor = #E4E0E0;  //Color gris del tablero
color IColor = #1EE1D4;  //Color de la figura I
color LColor = #EE9709;  //Color de la figura L
color SColor = #35C067;  //Color de la figura S
color ZColor = #B81A16;  //Color de la figura Z
color JColor = #26339A;  //Color de la figura J
color OColor = #F7F619;  //Color de la figura O
color TColor = #B056E7;  //Color de la figura T

//Parametro posicionX funcion draw Tetromino
//int tableroX = 170;
//int figuraProx = 825;

//Tiempo
int timer;  //Tiempo 
int intervalo = 1000;  //Nos dice la velocidad con la que baja la pieza, la utilizamos dependiendo de los niveles

//Boton de pausa

int pauseBottonX = 735;
int pauseBottonY = 100;
int radioPauseButton = 50;

//Pantalla de pausa

//Boton Continuar

int continueButtonY = 60;  //Coordenada en y del boton continuar de la pantalla de pausa

//Boton restart

int restartButtonY = 260;  //Coordenada en y del boton restart de la pantalla de pausa

//Boton how

int howButtonY2 = 460;  //Coordenada en y del boton como jugar de la pantalla de pausa

//Boton inicio

int inicioButtonY = 660;  //Coordenada en y del boton inicio de la pantalla de pausa





void setup() {
  //Pantalla de 820x480 pixeles, se tendran 200 pixeles libres a lado y lado del tetris
  size(820, 840);

  //Fuente para los textos
  fuente = loadFont("Cambria-Bold-80.vlw");

  // Creamos ArrayList de arreglos de ceros como elementos
  for (int k = 0; k < rows; k++) {
    tablero.add(new int[columns]);
  }

  //Asignamos el valor de 1 para las bordes del tablero
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      if (j == 0 || j == columns - 1 || i == rows - 1)
        tablero.get(i)[j] = 1;
    }
  }
}


void draw() {

  //Cuando se debe mostrar la pantalla inicial
  if (screenInicial) {
    tetrisInicialScreen();
  }

  //Cuando se debe mostrar la pantalla de juego
  if (screenGame) {
    background(backColor);
    drawTablero();
    drawTetromino(numFiguraS/*, desplazamientoX, desplazamientoY, tableroX*/);
    //drawTetromino(numFiguraA, 0, 0, figuraProx);
    if (millis() - timer >= intervalo) {
      darPaso();
      timer = millis();
      filasCompletas();
    }
    
    pauseBotton();
  }

  //Cuando se debe mostrar la pantalla de como jugar
  if (screenHowToPlay) {
    howToPlay();
  }
  
  //Cuando se deba mostrar la pantalla de pausa
  if(screenPause){
    background(backColor);
    pause();
    
  }
}


// Pantalla de inicio
void tetrisInicialScreen() {


  int pasox = 130;
  int pasoy = 70;
  background(backColor);


  //T
  push();
  noStroke();
  fill(#B40D0D);
  rect(10, yText, anchoText, alturaText, redondeo);//Palo horizontal
  rect(45, yText+alturaText, alturaText, anchoText+20, 0, 0, redondeo, redondeo);//Palo vertical
  pop();

  //E
  push();
  noStroke();
  fill(#172582);
  rect(10+pasox, yText, alturaText, anchoText + 60, redondeo);//Palo vertical
  rect(10+pasox, yText, anchoText, alturaText, redondeo);//Primer palo horizontal
  rect(10+pasox, yText+pasoy, anchoText, alturaText, redondeo);//Segundo palo horizontal
  rect(10+pasox, yText+(2*pasoy), anchoText, alturaText, redondeo);//Tercer palo horizontal
  pop();

  //T
  push();
  noStroke();
  fill(#F2A023);
  rect(10+(pasox*2), yText, anchoText, alturaText, redondeo);//Palo horizontal
  rect(45+(pasox*2), yText+alturaText, alturaText, anchoText+20, 0, 0, redondeo, redondeo);//Palo vertical
  pop();

  //R
  push();
  noStroke();
  fill(#089846);
  circle(10+(pasox*3)+60, yText+60, 120);//Parte redondeada
  rect(10+(pasox*3), yText+120, anchoText, 80, 0, redondeo, redondeo, redondeo);//Rectangulo inferior
  rect(10+(pasox*3), yText, alturaText+10, 120, redondeo, redondeo, redondeo, 0);//Parte superior del palo Complemento
  pop();

  push();
  noStroke();
  fill(backColor);
  circle(10+(pasox*3)+75, yText+60, 50);
  rect(10+(pasox*3)+alturaText-10, yText+35, 35, 50, redondeo);
  triangle(10+(pasox*3)+alturaText+20, yText+120, 10+(pasox*3)+anchoText, yText+200, 10+(pasox*3)+anchoText, yText+120);
  triangle(10+(pasox*3)+alturaText -10, yText+120, 10+(pasox*3)+alturaText -10, yText+200, 10+(pasox*3)+anchoText-40, yText+200);
  pop();

  //i
  push();
  noStroke();
  fill(#9024BE);
  rect(10+(pasox*4), yText, anchoText, alturaText, redondeo);//Palo horizontal
  rect(45+(pasox*4), yText+alturaText, alturaText, anchoText+20, 0, 0, redondeo, redondeo);//Palo vertical
  rect(10+(pasox*4), yText + 200 - alturaText, anchoText, alturaText, redondeo);//Palo horizontal
  pop();

  //S
  push();
  noStroke();
  fill(#0BBBAA);
  //rect(10+(pasox*5),yText,anchoText,alturaText,redondeo,redondeo,redondeo,redondeo);//Palo horizontal
  rect(10+(pasox*5), yText, anchoText, anchoText+80, redondeo);//rectangulo
  //rect(10+(pasox*5),yText + 200 - alturaText,anchoText,alturaText,redondeo, redondeo,redondeo,redondeo);//Palo horizontal
  pop();

  push();
  noStroke();
  fill(backColor);
  triangle(10+(pasox*5), yText+alturaText, 10+(pasox*5), yText+200-alturaText, 10+(pasox*5) + 70, yText+200-alturaText );
  triangle(pasox*6, yText+alturaText, pasox*6, yText+200-alturaText, 10+(pasox*5) + 50, yText+alturaText );  
  pop();


  push();
  fill(bColor);
  rect(buttonX, playButtonY, buttonW, buttonH);
  rect(buttonX, howButtonY, buttonW, buttonH);
  pop();

  push();
  textFont(fuente);
  textSize(80);
  textAlign(CENTER, CENTER);
  fill(backColor);
  text("JUGAR", buttonX + buttonW/2, playButtonY+buttonH/2);
  text("¿COMO JUGAR?", buttonX + buttonW/2, howButtonY+buttonH/2);
  pop();
}

void mousePressed() {

  if (screenInicial) {
    if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > playButtonY) && (mouseY < playButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenInicial = false;
      screenGame = true;
    }
    else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > howButtonY) && (mouseY < howButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenInicial = false;
      screenHowToPlay= true;
    }
  }

  if (screenHowToPlay) {
    if ((mouseX > playButton2X) && (mouseX < playButton2X + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenGame = true;
      screenHowToPlay= false;
    }

    else if ((mouseX > backButtonX) && (mouseX < backButtonX + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {
      //Cambiamos el estado de la pantalla
      screenInicial = true;
      screenHowToPlay= false;
    }
  }
  
  if(screenGame){
    float d = dist(mouseX, mouseY, pauseBottonX, pauseBottonY);
    if(d<radioPauseButton){
      screenGame = false;
      screenPause= true;
    }
  }
  
  if(screenPause){
    if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > continueButtonY) && (mouseY < continueButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenPause = false;
      screenGame = true;
    }
    else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > restartButtonY) && (mouseY < restartButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenPause = false;
      screenGame= true;
      restart();
    }
    else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > howButtonY2) && (mouseY < howButtonY2 + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenPause = false;
      screenHowToPlay= true;
      restart();
    }
    else if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > inicioButtonY) && (mouseY < inicioButtonY + buttonH)) {
      //Cambiamos el estado de las pantallas
      screenPause = false;
      screenInicial = true;
    }
  }
}


void keyPressed() {

  if (screenGame) {
    if (keyCode == 65 || keyCode == 37) {
      if (!colisionIzquierda()) desplazamientoX--;
    } else if (keyCode == 68 || keyCode == 39) {
      if (!colisionDerecha()) desplazamientoX++;
    } else if (keyCode == 83 || keyCode == 40) {
      if (!colisionAbajo()) desplazamientoY++;
    }else if (key == 'p' || key == 'P') {
        screenPause = true;
        screenGame = false;        
    } else if (key == 'W' || key == 'w' || key == 'O' || key == 'o') {
      pRotation = tRotation;
      tRotation = (tRotation + 1)%4;
      // Agregada esta condición para evitar bugs en las rotaciones cerca de un borde.
      if (colisionRotacion()) {
        tRotation = pRotation;
      };
    }
  }

  if (screenInicial) {
    if (key == CODED) {
      if (keyCode == ENTER) {//PREGUNTARLE A SEBASSSSSSSSSS
        //Cambiamos el estado de las pantallas
        screenInicial = false;
        screenGame = true;
      }
    }
  }
  
  
  if (screenHowToPlay) {
    if (key == CODED) {
      if (keyCode == ENTER) {//PREGUNTARLE A SEBASSSSSSSSSS
        //Cambiamos el estado de las pantallas
        screenHowToPlay = false;
        screenGame = true;
      }
    }
  }
  
  /*if(screenPause){
    if (key == 'p' || key == 'P') {
        screenPause = false;
        screenGame = true; 
    }
  }*/
  
}


// Pantalla de instrucciones
void howToPlay() {
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
  rect(playButton2X, buttonY2, buttonW2, buttonH);
  rect(backButtonX, buttonY2, buttonW2, buttonH);
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

void drawTetromino(int numero/*, int desplazamientoX, int desplazamientoY, int posicionX*/) {
  switch (numero) {
  case 0:
    array = I;
    colorTetromino = IColor;
    break;
  case 1:
    array = L;
    colorTetromino = LColor;
    break;
  case 2:
    array = S;
    colorTetromino = SColor;
    break;
  case 3:
    array = Z;
    colorTetromino = ZColor;
    break;
  case 4:
    array = J;
    colorTetromino = JColor;
    break;
  case 5:
    array = O;
    colorTetromino = OColor;
    break;
  case 6:
    array = T;
    colorTetromino = TColor;
    break;
  }

  push();
  strokeWeight(2);
  fill(colorTetromino);
  for (int i = 0; i <= 15; i++) {
    if ((array[tRotation] & (1 << 15 - i)) != 0) {
      posX = (i%4)*dimCuadro + desplazamientoX*dimCuadro + 170 /*posicionX*/;
      posY = ((i/4)|0) * dimCuadro + desplazamientoY*dimCuadro;
      square(posX, posY, dimCuadro);
    }
  }
  pop();
}


void drawTablero() {
  for (int i=0; i < rows; i++) {
    push();
    stroke(125);
    line(170, i*dimCuadro, width - 170, i*dimCuadro);
    pop();
    for (int j=0; j < columns; j++) {
      push();
      stroke(125);
      line(j*dimCuadro+170, 0, j*dimCuadro+170, height);
      pop();
      if (j == 0 || j == columns - 1 || i == rows - 1) {
        push();
        stroke(0);
        strokeWeight(2);
        fill(bColor);
        square(j*dimCuadro+170, i*dimCuadro, dimCuadro);
        pop();
      } else if (tablero.get(i)[j] == 1) {
        push();
        stroke(0);
        strokeWeight(2);
        fill(TColor);
        square(j*dimCuadro+170, i*dimCuadro, dimCuadro);
        pop();
      }
    }
  }
}



boolean colisionIzquierda() {

  for (int j = 0; j < 4; j++)
  {
    for (int i = j; i < 16; i += 4) {
      if ((array[tRotation] & (1 << 15 - i)) != 0) {
        posMX = (i%4) + desplazamientoX;
        posMY = ((i/4)|0) + desplazamientoY;
        if (tablero.get(posMY)[posMX-1] != 0)
        return true;
      }
    }
  }
  return false;
}

boolean colisionDerecha() {

  for (int j = 0; j < 4; j++)
  {
    for (int i = j; i < 16; i += 4) {
      if ((array[tRotation] & (1 << i)) != 0) {
        posMX = ((15-i)%4) + desplazamientoX;
        posMY = (((15-i)/4)|0) + desplazamientoY;
        if (tablero.get(posMY)[posMX+1] != 0)
        return true;
      }
    }
  }
  return false;
}

boolean colisionAbajo() {

  for (int i = 0; i < 16; i ++) {
    if ((array[tRotation] & (1 << i)) != 0) {
      posMX = ((15-i)%4) + desplazamientoX;
      posMY = (((15-i)/4)|0) + desplazamientoY;
      if (tablero.get(posMY+1)[posMX] != 0) {
        siguienteFigura();
        return true;
      }
    }
  }
  return false;
}

boolean colisionRotacion() {

  for (int i = 0; i <= 15; i++) {
    if ((array[tRotation] & (1 << 15 - i)) != 0) {
      posMX = (i%4) + desplazamientoX;
      posMY = ((i/4)|0) + desplazamientoY;
      if (tablero.get(posMY)[posMX] == 1) return true;
    }
  }
  return false;
}

void siguienteFigura() {
  //int posMX;
  //int posMY;
  for (int i = 0; i <= 15; i++) {
    if ((array[tRotation] & (1 << 15 - i)) != 0) {
      posMX = (i%4) + desplazamientoX;
      posMY = ((i/4)|0) + desplazamientoY;
      tablero.get(posMY)[posMX] = 1;
    }
  }

  numFiguraS = numFiguraA;
  numFiguraA = (int) random (7);
  tRotation = 0;
  desplazamientoX = 4;
  desplazamientoY = 0;
}

void darPaso() {
  if (!colisionAbajo()) desplazamientoY++;
}

void filasCompletas() {
  int suma = 0;
  for (int i = rows - 2; i >= 0; i--) {
    for (int j = 1; j < 11; j++) {
      suma += tablero.get(i)[j];
    }
    if (suma == 10) {
      tablero.remove(i);
      tablero.add(0, new int[columns]);
      tablero.get(0)[0] = 1;
      tablero.get(0)[columns-1] = 1;
    }
    suma = 0;
  }
}

void pauseBotton(){
  push();
  ellipseMode(RADIUS);
  fill(bColor);
  ellipse(pauseBottonX, pauseBottonY,radioPauseButton,radioPauseButton);
  fill(backColor);
  rect(pauseBottonX-30, pauseBottonY-30, 20, 60);
  rect(pauseBottonX+10, pauseBottonY-30, 20, 60);
  pop();
}

void pause(){
  push();
  fill(bColor);
  rect(buttonX, continueButtonY, buttonW, buttonH);
  rect(buttonX, restartButtonY, buttonW, buttonH);
    rect(buttonX, howButtonY2, buttonW, buttonH);
  rect(buttonX, inicioButtonY, buttonW, buttonH);
  pop();
  
  

  push();
  textFont(fuente);
  textSize(80);
  textAlign(CENTER, CENTER);
  fill(backColor);
  text("CONTINUAR", buttonX + buttonW/2, continueButtonY+buttonH/2);
  text("RESTART", buttonX + buttonW/2, restartButtonY+buttonH/2);
  text("¿COMOJUGAR?", buttonX + buttonW/2, howButtonY2+buttonH/2);
  text("INICIO", buttonX + buttonW/2, inicioButtonY+buttonH/2);
  pop();
  
}



void restart(){
  //Asignamos el valor de 1 para las bordes del tablero
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      if (j == 0 || j == columns - 1 || i == rows - 1){
        tablero.get(i)[j] = 1;
      }else{
      tablero.get(i)[j] = 0;
    }
    }
  }
  
  numFiguraS = numFiguraA;
  numFiguraA = (int) random (7);
  tRotation = 0;
  desplazamientoX = 4;
  desplazamientoY = 0;
  
}
