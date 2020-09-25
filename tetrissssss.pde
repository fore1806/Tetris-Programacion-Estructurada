//Booleanos pantallas

boolean screenInicial = true;
boolean screenHowToPlay= false;
boolean screenGame = false;



//Pantalla de inicio 

int yText = 100;
int anchoText = 120;
int alturaText = anchoText/2-10;
int redondeo = 7;
int backColor = 20;

//Botones pantalla de inicio

int buttonW = 570;
int buttonH = 120;
int buttonX = 125;

//Boton jugar

int playButtonY = 360;

//Boton como jugar

int howButtonY = 520;

//Fuente Botones

PFont fuente;

//Pantalla de como jugar

//Botones

int buttonW2 = 250;
int buttonY2 = 620;

int playButton2X = 510;

int backButtonX = 60;


//Colores

color bColor = #E4E0E0;





void setup() {
  //Pantalla de 620x480 pixeles, se tendran 200 pixeles libres a lado y lado del tetris
  size(820, 840);

  //Fuente para los botones
  fuente = loadFont("Cambria-Bold-80.vlw");
}


void draw() {
  
  if (screenInicial) {
    tetrisInicialScreen();
  }

  if (screenGame) {
    background(255, 0, 0);
  }

  if (screenHowToPlay) {
    howToPlay();
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
      //Cambiamos el estado del boton
      screenInicial = false;
      screenGame = true;
    }
    if ((mouseX > buttonX) && (mouseX < buttonX + buttonW) && 
      (mouseY > howButtonY) && (mouseY < howButtonY + buttonH)) {
      //Cambiamos el estado del boton
      screenInicial = false;
      screenHowToPlay= true;
    }
  }
  
  if(screenHowToPlay){
    if ((mouseX > playButton2X) && (mouseX < playButton2X + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {
      //Cambiamos el estado del boton
      screenGame = true;
      screenHowToPlay= false;
    }
    
    if ((mouseX > backButtonX) && (mouseX < backButtonX + buttonW2) && 
      (mouseY > buttonY2) && (mouseY < buttonY2 + buttonH)) {
      //Cambiamos el estado de la pantalla
      screenInicial = true;
      screenHowToPlay= false;
      
    }
  
  }
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
