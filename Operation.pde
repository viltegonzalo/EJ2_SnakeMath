class Operation {
  private float value1;
  private float value2;
  private int idOper;
  private String[] oper;
  private float result;
  private ArrayList<Apple> apples;
  private Message msg;

  public Operation() {
    this.msg=new Message(new PVector(100,height-20));
    this.value1=(int)random(1, 9);
    this.value2=(int)random(1, 9);
    this.idOper=(int)random(0, 3);
    this.oper=new String[]{"+", "-", "*", "/"};

    this.generarOperacion();
    this.apples=new ArrayList<Apple>();
    this.apples.add(new Apple(this.result));
    for (int i=1; i<3; i++) {
      this.apples.add(new Apple((int)random(0, 81)));
    }
  }
  public void display(){
    msg.display(this.value1+this.oper[this.idOper]+this.value2,20);
  }
  public void deleteDisplay(){
    this.msg=new Message(new PVector(-100,-100));
  }
  public void generarOperacion() {
    switch(this.idOper) {
    case 0://SUMA 
      this.result=this.value1+this.value2;
      break;
    case 1: //RESTA
      this.result=this.value1-this.value2;
      break;
    case 2://MULTIPLICACION 
      this.result=this.value1*this.value2;
      break;
    case 3: 
      this.result=this.value1/this.value2;
      break;//DIVICION
    }
  }
  public ArrayList<Apple> getApples() {
    return this.apples;
  }
  public void deleteApples() {
    for (int i=0; i<this.apples.size(); i++) {
      apples.get(i).deleteApple();
    }
  }
  public float getResult(){
    return this.result;
  }
  ////
  public void displayApples(){
    for(int i=0;i<this.apples.size();i++){
      this.apples.get(i).display();
      println(this.apples.get(i).getResult());
    }
  }

}
