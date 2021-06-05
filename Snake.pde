class Snake{
  private ArrayList<PVector> pos;
  private int[] dx;
  private int[] dy;
  private int dir;
  private int baseCuadrado;
  ////
  private ArrayList<Apple> apples;
  private Operation operation;
  private Board board;
  
  public Snake(){
    this.dx=new int[]{0,0,-1,1};
    this.dy=new int[]{-1,1,0,0};
    this.pos=new ArrayList<PVector>();
    this.pos.add(new PVector(10,10));
    this.dir=1;
    this.baseCuadrado=40;
    ///
    this.apples=new ArrayList<Apple>();
    this.operation=new Operation();
    this.board=new Board(width,height,this.baseCuadrado);
  }
  public void display(){
    fill(40,50,230);
    for(int i=0;i<this.pos.size();i++){
      rect(pos.get(i).x*this.baseCuadrado,pos.get(i).y*this.baseCuadrado,this.baseCuadrado,this.baseCuadrado);
    }
  }
  
  private void mover(){
    PVector aux=new PVector(this.pos.get(0).x+dx[dir],this.pos.get(0).y+dy[dir]);
    this.pos.add(0,aux);
    this.pos.remove(this.pos.size()-1);
    this.keyPressed();
  }
  
  public void keyPressed(){
    if(key=='w'||key=='W'||keyCode==UP) this.dir=0;
    if(key=='s'||key=='S'||keyCode==DOWN) this.dir=1;
    if(key=='a'||key=='A'||keyCode==LEFT) this.dir=2;
    if(key=='d'||key=='D'||keyCode==RIGHT) this.dir=3;
    //if(keyCode==ENTER) reiniciar();
    if(keyCode==' ') setup();
    //this.mover();
  }
  

  public boolean detectarSerpiente(){
    boolean aux=false;
      for(int i=2;i<this.pos.size();i++){
        for(int j=2;j<this.pos.size();j++){
          if((this.pos.get(0).x==this.pos.get(i).x)&&(this.pos.get(0).y==this.pos.get(i).y)){
            aux=true;
          }
        }
      }
    return aux; 
  }
  public boolean detectarTablero(){
    return (this.pos.get(0).x<0)||(this.pos.get(0).x>this.board.getColumna()-1)||
    (this.pos.get(0).y<0)||(this.pos.get(0).y>this.board.getFila()-1);
  }
  /*
  public boolean detectarTablero(Board tab){
    return (this.pos.get(0).x<0)||(this.pos.get(0).x>tab.getColumna()-1)||
    (this.pos.get(0).y<0)||(this.pos.get(0).y>tab.getFila()-1);
  }
  
  public boolean comerMzasCorrectas(ArrayList<Apple> mzas,Operation op){
    boolean aux=false;
    for(int i=0;i<mzas.size();i++){      
      if((this.pos.get(0).x==mzas.get(i).getPos().x)&&(this.pos.get(0).y==mzas.get(i).getPos().y)&&(mzas.get(i).getResult()==op.getResult())){
        this.crecer();
        aux=true;
      }
    }
    return aux;
  }
  public boolean comerMzasIncorrectas(ArrayList<Apple> mzas,Operation op){
    boolean aux=false;
    for(int i=0;i<mzas.size();i++){      
      if((this.pos.get(0).x==mzas.get(i).getPos().x)&&(this.pos.get(0).y==mzas.get(i).getPos().y)&&(mzas.get(i).getResult()!=op.getResult())){        
        aux=true;
      }
    }
    return aux;
  }
  */
  private void crecer(){
    PVector aux=new PVector(this.pos.get(this.pos.size()-1).x,this.pos.get(this.pos.size()-1).y);
    this.pos.add(aux);
  }
  public boolean comerManzana(Apple mza){
    if((this.pos.get(0).x==mza.getPos().x)&&(this.pos.get(0).y==mza.getPos().y)){
      this.crecer();
      return true;
    }else{
      return false;
    }
  }
  public boolean comerMzasCorrectas(){
    boolean aux=false;
    for(int i=0;i<this.apples.size();i++){      
      if((this.pos.get(0).x==this.apples.get(i).getPos().x)&&(this.pos.get(0).y==this.apples.get(i).getPos().y)&&(this.apples.get(i).getResult()==this.operation.getResult())){
        this.crecer();
        aux=true;
      }
    }
    return aux;
  }
  public boolean comerMzasIncorrectas(){
    boolean aux=false;
    for(int i=0;i<this.apples.size();i++){      
      if((this.pos.get(0).x==this.apples.get(i).getPos().x)&&(this.pos.get(0).y==this.apples.get(i).getPos().y)&&(this.apples.get(i).getResult()!=this.operation.getResult())){        
        aux=true;
      }
    }
    return aux;
  }
  
  public void matarSerpiente(){
    this.pos.clear();
    this.pos.add(new PVector(-10,-10));
  }
  ////
  public ArrayList<Apple> getApples(){
    return this.apples;
  }
  public Operation getOperation(){
    return this.operation;
  }
  public Board getBoard(){
    return this.board;
  }
  public void setApples(ArrayList<Apple> a){
    this.apples=a;
  }
  public void setOperation(Operation o){
    this.operation=o;
  }
  public void setBoard(Board b){
    this.board=b;
  }
}
