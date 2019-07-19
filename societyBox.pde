enum Society {
  ELECTRICITY, WATER
}

class SocietyBox extends BuyableBox {
  final Society type;
  
  public SocietyBox (Society type){
    this.type = type;
    this.value = 15000;
  }
  void drawBox(int l){
    rect (0, 0, l/12f, l/8f+l/200);
    imageMode (CENTER);
    image(type == Society.WATER ? waterSociety : electricSociety, l/24f, l/16f, l/14f, l/14f);
    
    fill (0);
    text ("SOCIETA' "+ (type == Society.WATER ? "ACQUA POTABILE" : "ELETTRICA"), 0, 0, l/12f, l/37f);
    text ("£ 15.000", 0, l/10f, l/12f, l/37f);
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
    
    text ("15.000", lastL/4f, -lastL*3/10f);
    textAlign (RIGHT, BOTTOM);
    text ("2.000\n\n10.000\n7.500", lastL/4f, lastL*3/10f);
    
    textAlign (LEFT, BOTTOM);
    text ("Rendita\n\n\nValore ipotecario", -lastL/4f, lastL*3/10f);
    
    fill (0);
    textAlign (CENTER, CENTER);
    
    text ("SOCIETA' "+(type == Society.WATER ? "ACQUA POTABILE" : "ELETTRICA"), 0, -lastL*9/40f, lastL/2f, -lastL/15f);
    
    imageMode (CENTER);
    image(type == Society.WATER ? waterSociety : electricSociety, 0, -lastL/40f, lastL/4f, lastL/4f);
    
    fill (100);
    textFont (fontMedium);
    textAlign (LEFT, TOP);
    text ("Valore                 £ ", -lastL/4f, -lastL*3/10f);
    textAlign (LEFT, BOTTOM);
    text ("         . . . . . .  £\nSe si possiede anche\n"+(type == Society.WATER ? "la Società Elettrica" : "    l'Acqua Potabile")+"  £\n                      £", -lastL/4f, lastL*3/10f);
    
    
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
     return owner.countSocieties() == 2 ? 10000 : 2000;
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
