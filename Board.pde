class Board{
  private int ancho;
  private int alto;
  private int fila;
  private int columna;
  private int baseCuadrado;
  
  public Board(int w,int h,int bc){
    this.ancho=w;
    this.alto=h;
    this.baseCuadrado=bc;
    this.fila=bc/2;
    this.columna=bc/2;
  }
  public void display(){
    stroke(50);
    for(int i=0;i<this.fila;i++){
      line(0,i*this.baseCuadrado,width,i*this.baseCuadrado);
    }
    for(int j=0;j<columna;j++){
      line(j*this.baseCuadrado,0,j*this.baseCuadrado,height);
    }
  }
  
  public int getAlto(){
    return this.alto;
  }
  public int getAncho(){
    return this.ancho;
  }
  public int getFila(){
    return this.fila;
  }
  public int getColumna(){
    return this.columna;
  }
}
