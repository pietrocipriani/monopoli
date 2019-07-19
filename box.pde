abstract class Box {
  abstract void drawBox(int l);
  
  abstract void onClick();
  
  abstract void over(Player p);
}

enum Show {
  OVER, INFO, NO
}

abstract class InfoBox extends Box{
  Show show = Show.NO;
  public void mouseClickedDelegate (MouseEvent e){}
  
  protected void setShow (Show show){
    this.show = show;
    boardOverlayed = show != Show.NO;
  }
  
  abstract void drawInfo();
  abstract void drawOver();
}

abstract class BuyableBox extends InfoBox{
  protected int value;
  protected boolean bought = false;
  protected Player owner;
  
  public int getValue(){
    return value;
  }
  public void buy(){
    this.bought = true;
  }
  
  public abstract int getRent();
}
