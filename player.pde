class Player {
  private final String name;
  private final color c;
  
  private int money = 250000+100000+15000+2000;
  private int pos = 0;
  public JailProbChanceCard jailCard;
  private final ArrayList<BuyableBox> properties = new ArrayList<BuyableBox>();
  
  private int jail = 0;
  
  public Player(String name, color c){
    this.name = name;
    this.c = c;
  }
  
  public void jail (){
    setPos(10);
    if (jailCard == null) {
      jail = 2;
      return;
    }
    
    jailCard.inList = true;
    jailCard = null;
  }
  
  public boolean pay(int m){
    if (money < m) return false;
    money -= m;
    
    println (name+"\n£: "+money);
    return true;
  }
  
  public void setPos(int pos){
    this.pos = pos; 
  }
  public int getPos(){
    return pos;
  }
  public void goAhead(){
    if (jail > 0){
      jail--;
      return; 
    }
    
    int increment = int(random(1, 6.1))+int(random(1, 6.1));
    pos += increment;
    if (pos >= 40){
      pay(-20000); 
      pos -= 40;
    }
    boxes[pos/10][pos%10].over(this);
  }
  public void move(int where, boolean passFromStart){
    if (where < pos && passFromStart) pay(-20000);
    pos = where;
    boxes[pos/10][pos%10].over(this);
  }
  
  public void buyProperty(BuyableBox property){
    if (!pay(property.getValue())) return;
    properties.add(property);
    property.buy();
  }
  public void buyHouse(RoadBox property){
    if (!properties.contains(property)) return;
    if (property.houses >= 5) return;
    if (pay((int) property.m.get("price_house"))) property.houses++;
  }
  
  public int countHouses(){
    int count = 0;
    for (BuyableBox prop : properties){
      if (!(prop instanceof RoadBox)) continue;
      if (((RoadBox) prop).houses > 4) continue;
      count += ((RoadBox) prop).houses;
    }
    return count;
  }
  public int countHotel(){
    int count = 0;
    for (BuyableBox prop : properties){
      if (!(prop instanceof RoadBox)) continue;
      if (((RoadBox) prop).houses == 5) count++;
    }
    return count;
  }
  public int countStations(){
    int count = 0;
    for (BuyableBox prop : properties) if (prop instanceof StationBox) count++;
    return count;
  }
}
