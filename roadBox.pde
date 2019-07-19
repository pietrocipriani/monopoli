class RoadBox extends BuyableBox {
  final String name;
  final color group;
  final String price;
  final HashMap m;
  
  int houses = 0;
  
  public RoadBox(String name) {
    this.name = name;
    m = (HashMap) roadsData.get(name);
    this.group = (color) m.get("group");
    this.value = (int) m.get("price");
    this.price = intToStringWithDots(this.value);
  }
  
  void drawBox(int l){
    textFont(fontSmall);
    rect (0, 0, l/12f, l/8f+l/200);
    
    fill (houses != 5 ? group : 0xFFFF0000);
    rect (0, 0, l/12f, l/32f);
    
    if (houses < 5){
      fill (0xFF00FF00);
      rect(0, 0, l*houses/48f, l/32f);
    }
    
    
    fill (0);
    text (name+"\n£. "+price, 0, l/32f, l/12f, l*3/64f);
    
    pushMatrix();
    translate(l/12f, l/8f);
    rotate(PI);
    text (name+"\n£ "+price, 0, 0, l/12f, l*3/64f);
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
    fill (group);
    rect (0, -lastL*9/40f, lastL/2f, lastL/15f);
    
    fill (0);
    textFont (fontMediumBold);
    textAlign (RIGHT, TOP);
    
    text (price, lastL/4f, -lastL*3/10f);
    text (getPrice("rent")+"\n"+getPrice("rent_1house")+"\n"+getPrice("rent_2house")+"\n"+getPrice("rent_3house")+"\n"+getPrice("rent_4house")+"\n"+getPrice("rent_hotel"), lastL/4f, -lastL*7/40f);
    text (getPrice("price_house")+"\n"+getPrice("price_hotel")+"\n\n"+intToStringWithDots((int) m.get("price")/2), lastL/4f, lastL/7f);
    
    textAlign (LEFT, TOP);
    text ("Rendita\nRendita\nRendita\nRendita\nRendita\nRendita", -lastL/4f, -lastL*7/40f);
    text ("Costo\nCosto\n\nValore ipotecario", -lastL/4f, lastL/7f);
    
    fill (255);
    textAlign (CENTER, CENTER);
    
    text (name, 0, -lastL*9/40f, lastL/2f, lastL/15f);
    
    float rentWidth = textWidth("Rendita ");
    float costWidth = textWidth("Costo ");
    
    fill (100);
    textFont (fontMedium);
    textAlign (LEFT, TOP);
    text ("Questo contratto vale £ ", -lastL/4f, -lastL*3/10f);
    text ("Solo terreno   £\nCon 1 Casa     £\nCon 2 Case     £\nCon 3 Case     £\nCon 4 Case     £\nCon Albergo    £", -lastL/4f+rentWidth, -lastL*7/40f);
    text ("di ogni Casa     £\ndi un Albergo    £\n   più 4 Case\n                 £", -lastL/4f+costWidth, lastL/7f);
    
    textSize (lastL/45f);
    textLeading (lastL/50f);
    text ("Se un giocatore possiede tutti i terreni d'uno stesso Gruppo (colore), la rendita del solo terreno viene raddoppiata.", 0, lastL/9f, lastL/2f, lastL/10f);
    
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
    text(bought?'H':'+', -lastL*13/50f, -lastL*31/100f);
  }
  
  public int getRent (){
    if (houses == 0) return (int) m.get("rent");
    if (houses == 5) return (int) m.get("rent_hotel");
    return (int) m.get("rent_"+houses+"house");
  }
  
  void over(Player p){
    if (bought && p != owner) {
      p.pay(getRent());
      owner.pay(-getRent());
      return; 
    } else if (houses >= 5) return;
    setShow(Show.OVER);
    owner = p;
  }
  
  String getPrice(String key){
    return intToStringWithDots((int) m.get(key)); 
  }
  
  @Override
  public void mouseClickedDelegate (MouseEvent e){
    PVector p = new PVector(e.getX()-width/2f, e.getY()-height/2f);
    if (PVector.sub(p, new PVector(13*lastL/50f, -31*lastL/100f)).magSq() < lastL*lastL/1600f){
      setShow(Show.NO);
      return;
    } else if (show == Show.OVER && PVector.sub(p, new PVector(-13*lastL/50f, -31*lastL/100f)).magSq() < lastL*lastL/1600f){
      if (bought) owner.buyHouse(this);
      else owner.buyProperty(this);
      setShow(Show.NO);
    }
  }
}
