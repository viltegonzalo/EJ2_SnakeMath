class Message{
  private String text;
  private PVector posicion;
  private int sizeText;

  public Message(PVector pos) {
    this.text="";
    this.posicion=new PVector(pos.x,pos.y);
  }
  public void display(String txt,int sizeText) {
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(sizeText);
    text(txt, this.posicion.x, this.posicion.y);
  }
}
