//Musica
import ddf.minim.*;

Minim minim;
AudioPlayer player;
//
boolean gameOver=false;
Board tablero;
Apple manzana;
Snake serpiente;
Message finJuego;
Operation operacion;
ArrayList<Apple> manzanas;
void setup(){
  size(800,800);
  frameRate(7);
  minim = new Minim(this);
  player = minim.loadFile("../Music/Training.mp3");
  player.play();
  tablero=new Board(width,height,40);
  manzana=new Apple();
  serpiente=new Snake();
  finJuego=new Message(new PVector(width/2,height/2));
  operacion=new Operation();
  manzanas=new ArrayList<Apple>();
  manzanas=operacion.getApples();
}
void draw(){
  background(25);
  if(gameOver){
    operacion.deleteApples();
    operacion.deleteDisplay();
    serpiente.matarSerpiente();
    finJuego.display("FIN DEL JUEGO",100);
    player.pause();
    
  }else{
    tablero.display(); 
  }  
  operacion.display();
  operacion.displayApples();
  serpiente.display();  
  //serpiente.keyPressed();
  serpiente.mover();
  serpiente.setApples(manzanas);
  serpiente.setOperation(operacion);
  serpiente.setBoard(tablero);
  if(serpiente.detectarTablero()) gameOver=true;
  if(serpiente.detectarSerpiente()) gameOver=true;
  if(serpiente.comerMzasCorrectas()){
    operacion=new Operation();
    manzanas=new ArrayList<Apple>();
    manzanas=operacion.getApples();
  }else if(serpiente.comerMzasIncorrectas()) gameOver=true;
}
