abstract class SpecialBox extends Box {}

class NullBox extends SpecialBox {
  void drawBox (int l){}
  void onClick (){}
  void drawInfo(){}
  void drawOver(){}
  void over(Player p){}
}

class StartBox extends SpecialBox {
  void drawBox(int l){
    rect (0, 0, l/8f+l/200f, l/8f+l/200f);
    
    textMode (MODEL);
    textFont (fontBig);
    
    fill (255, 0, 0);
    pushMatrix();
    textSize(l/20f);
    translate (l/16f, l/16f);
    rotate (-PI/4);
    
    text ("VIA!", 0, -l*sqrt(2)/192);
    
    popMatrix();
    
    textSize(l/100f);
    textLeading(l/80f);
    textFont(fontSmall);
  }
  
  void onClick(){}
  
  void over(Player p){}
}

class JailBox extends SpecialBox {
  void drawBox(int l){
    rect (0, 0, l/8f+l/200f, l/8f+l/200f);
    textFont (fontMediumBold);
    fill (255, 0, 0);
    rect (0, 0, l/10f, l/10f);
    
    pushMatrix();
    textSize(l/20f);
    translate (l/20f, l/20f);
    rotate (-PI/4);
    imageMode (CENTER);
    image(jail, 0, 0, l/sqrt(2)/10, l/sqrt(2)/10);
    
    //text ("VIA!", 0, -l*sqrt(2)/192);
    
    popMatrix();
    
    /*textSize(l/100f);
    textLeading(l/80f);
    textFont(fontSmall);*/
  }
  
  void onClick(){}
  
  void over(Player p){}
}

class ToJailBox extends SpecialBox {
  void drawBox(int l){
    rect (0, 0, l/8f+l/200f, l/8f+l/200f);
    textFont (fontMediumBold);
    
    pushMatrix();
    textSize(l/20f);
    translate (l/16f, l/16f);
    rotate (-PI/4);
    imageMode (CENTER);
    image(toJail, 0, 0, l/10f, l/10f);
    
    //text ("VIA!", 0, -l*sqrt(2)/192);
    
    popMatrix();
    
    /*textSize(l/100f);
    textLeading(l/80f);
    textFont(fontSmall);*/
  }
  
  void onClick(){}
  
  void over(Player p){
    p.jail();
  }
}
