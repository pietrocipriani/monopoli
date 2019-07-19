enum ProbChance {
  PROBABILITY, CHANCE
}

class ProbChanceBox extends InfoBox {
  final ProbChance type;
  private Player last;
  
  private ProbChanceCard card;
  
  public ProbChanceBox (ProbChance type){
    this.type = type;
  }
  
  void drawBox(int l){
    rect (0, 0, l/12f, l/8f+l/200);
    imageMode (CORNER);
    text(type == ProbChance.PROBABILITY ? "PROBABILITA'" : "IMPREVISTI", 0, 0, l/12f, l/32);
    image(type == ProbChance.PROBABILITY ? probability : chance, 0, l/32f, l/12f, l*3/32f);
  }
  
  void onClick (){
    //show = Show.NO;
  }
  void drawInfo(){}
  void drawOver(){
    card.draw();
  }
  
  void over(Player p){
    setShow(Show.OVER);
    
    card = type == ProbChance.PROBABILITY ? probabilities[probIndex++] : chances[chanceIndex++];
    probIndex %= probabilities.length;
    chanceIndex %= chances.length;
    
    if (card instanceof JailProbChanceCard && !((JailProbChanceCard) card).inList){
      card = type == ProbChance.PROBABILITY ? probabilities[probIndex++] : chances[chanceIndex++];
      probIndex %= probabilities.length;
      chanceIndex %= chances.length;
    }
    
    last = p;
  }
  
  @Override
  public void mouseClickedDelegate (MouseEvent e){
    if (e.getX() < width/2-lastL*3/10f || e.getX() > width/2+lastL*3/10f || e.getY() < height/2-lastL*3/20f || e.getY() > height/2+lastL*3/20f){
      setShow(Show.NO);
      card.trigger(last);
    }
  }
}
