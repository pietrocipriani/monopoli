enum Direction {
  NORD, EST, SUD, OVEST
}

class StationBox extends BuyableBox {
  final Direction dir;
  
  public StationBox (Direction dir){
    this.dir = dir;
    this.value = 20000;
  }
  void drawBox(int l){
    rect (0, 0, l/12f, l/8f+l/200);
    imageMode (CORNER);
    image(train, 0, l/32f, l/12f, l/16f);
    
    fill (0, 0, 0);
    text ("STAZIONE "+dir+"\n£ 20.000", 0, 0, l/12f, l/32f);
    
    pushMatrix();
    translate (l/12f, l/8f);
    rotate(PI);
    text ("STAZIONE "+dir+"\n£ 20.000", 0, 0, l/12f, l/32f);
    popMatrix();
  }
  
  void onClick(){
    setShow(Show.INFO);
  }
  void drawInfo(){    
    fill (255);
    strokeWeight (bought ? 5 : 0);
    stroke (bought ? owner.c : 255);
    rect (0, 0, lastL*13/25f, lastL*31/50f);
    
    noStroke();
    fill (0);
    textFont (fontMediumBold);
    textAlign (RIGHT, TOP);
    
    text ("20.000", lastL/4f, -lastL*3/10f);
    textAlign (RIGHT, BOTTOM);
    text ("2.500\n\n5.000\n\n10.000\n\n20.000\n10.000", lastL/4f, lastL*3/10f);
    
    textAlign (LEFT, BOTTOM);
    text ("Rendita\n\n\n\n\n\n\nValore ipotecario", -lastL/4f, lastL*3/10f);
    
    fill (0);
    textAlign (CENTER, CENTER);
    
    text ("STAZIONE "+dir, 0, -lastL*9/40f, lastL/2f, -lastL/15f);
    
    imageMode (CORNER);
    image(train, -lastL/12f, -lastL/7f, lastL/6f, lastL/8f);
    
    fill (100);
    textFont (fontMedium);
    textAlign (LEFT, TOP);
    text ("Valore                 £ ", -lastL/4f, -lastL*3/10f);
    textAlign (LEFT, BOTTOM);
    text ("                    £\nSe si possiedono 2\n  Stazioni . . . .  £\nSe si possiedono 3\n  Stazioni . . . .  £\nSe si possiedono 4\n  Stazioni . . . .  £\n                    £", -lastL/4f, lastL*3/10f);
    
    
    fill(0xFFFF0000);
    noStroke();
    ellipseMode(CENTER);
    ellipse(lastL*13/50f, -lastL*31/100f, lastL/20f, lastL/20f);
    fill(255);
    textFont(fontMediumBold);
    textAlign(CENTER, CENTER);
    text("X", lastL*13/50f, -lastL*31/100f);
  }
  void drawOver(){
    drawInfo();
    
    fill(0xFF00FF00);
    ellipse(-lastL*13/50f, -lastL*31/100f, lastL/20f, lastL/20f);
    fill(255);
    text('+', -lastL*13/50f, -lastL*31/100f);
  }
  
  public int getRent (){
     return owner.countStations()*2500;
  }
  
  void over(Player p){
    if (bought) {
      if (p != owner){
        p.pay(getRent());
        owner.pay(-getRent());
      }
      return;
    };
    
    setShow(Show.OVER);
    
    owner = p;
  }
  
  @Override
  public void mouseClickedDelegate (MouseEvent e){
    PVector p = new PVector(e.getX()-width/2f, e.getY()-height/2f);
    if (PVector.sub(p, new PVector(13*lastL/50f, -31*lastL/100f)).magSq() < lastL*lastL/1600f){
      setShow(Show.NO);
      return;
    } else if (show == Show.OVER && PVector.sub(p, new PVector(-13*lastL/50f, -31*lastL/100f)).magSq() < lastL*lastL/1600f){
      owner.buyProperty(this);
      setShow(Show.NO);
    }
  }
}
