class Apple{
  private PVector posicion;
  private int baseCuadrado;
  private float value;
  private Message msg;
  
  public Apple(){
    this.baseCuadrado=40;
    this.posicion=new PVector(int(random(0,20)),int(random(0,20)));
    this.value=0;
  }
  public Apple(float v){
    this.baseCuadrado=40;
    this.posicion=new PVector(int(random(1,18)),int(random(1,18)));
    this.value=v;
    this.msg=new Message(new PVector(this.posicion.x*this.baseCuadrado,this.posicion.y*this.baseCuadrado-15));
  }
  public void display(){
    fill(215,0,75);
    msg.display(str(this.value),20);
    rect(this.posicion.x*this.baseCuadrado,this.posicion.y*this.baseCuadrado,this.baseCuadrado,this.baseCuadrado);
  }
  public void deleteApple(){
    this.posicion.x=-100;
    this.posicion.y=-100;
    this.msg=new Message(new PVector(-100,-100));
  }
  public PVector getPos(){
    return this.posicion;
  }
  public float getResult(){
    return this.value;
  }
}
