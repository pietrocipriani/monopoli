abstract class ProbChanceCard {
   private final String text;
   private final ProbChance probChance;
   public ProbChanceCard(String text, ProbChance probChance){
     this.text = text;
     this.probChance = probChance;
   }
   
   public void draw (){
     rectMode(CENTER);
     fill (probChance == ProbChance.PROBABILITY ? 0xFFC4BE8A : 0xFFDE792B);
     rect (0, 0, lastL*3/5f, lastL*3/10f, lastL/50f);
     
     textAlign(CENTER, CENTER);
     textFont(fontMedium);
     fill(0);
     text (text, 0, lastL/15f, lastL*3/5f, lastL*3/10f);
   }
   
   abstract public void trigger(Player p);
}

class JailProbChanceCard extends ProbChanceCard {
  public boolean inList = true;
  public JailProbChanceCard (String text, ProbChance probChance){
    super(text, probChance);
  }
  
  public void trigger(Player p){
    inList = !inList;
    p.jailCard = this;
  }
}
class PayProbChanceCard extends ProbChanceCard {
  private final int money;
  private final Player[] players;
  
  public PayProbChanceCard (String text, ProbChance probChance, int money, Player... players){
    super(text, probChance);
    
    this.money = money;
    this.players = players;
  }
  
  public void trigger(Player p){
    p.pay(-money);
    for (Player p2 : players) p2.pay(money);
  }
}
class MoveProbChanceCard extends ProbChanceCard {
  private final int where;
  private final boolean passFromStart;
  public MoveProbChanceCard (String text, ProbChance probChance, int where, boolean passFromStart){
    super(text, probChance);
    this.where = where;
    this.passFromStart = passFromStart;
  }
  
  public void trigger(Player p){
    p.move(where, passFromStart);
  }
}
class HousesTaxProbChanceCard extends ProbChanceCard {
  private final int house;
  private final int hotel;
  public HousesTaxProbChanceCard (String text, ProbChance probChance, int house, int hotel){
    super(text, probChance);
    this.house = house;
    this.hotel = hotel;
  }
  
  public void trigger(Player p){
    p.pay(p.countHouses()*house + p.countHotel()*hotel);
  }
}

int probIndex = 0;
int chanceIndex = 0;

ProbChanceCard[] probabilities = new ProbChanceCard[]{
  new JailProbChanceCard ("Uscite gratis di prigione, se ci siete: potete conservare questo cartoncino sino al momento di servirvene (non si sa mai) oppure venderlo", ProbChance.PROBABILITY),
  new PayProbChanceCard ("Avete vinto un premio di consolazione alla Lotteria di Merano: ritirate 10.000 lire", ProbChance.PROBABILITY, 10000),
  new PayProbChanceCard ("Avete vinto il secondo premio in un concorso di bellezza: ritirate 1.000 lire", ProbChance.PROBABILITY, 1000),
  new PayProbChanceCard ("Avete perso una causa: pagate £. 10.000", ProbChance.PROBABILITY, -10000),
  new PayProbChanceCard ("Scade il Vostro premio di assicurazione: pagate 5.000 lire", ProbChance.PROBABILITY, -5000),
  new PayProbChanceCard ("Ereditate da un lontano parente 10.000 lire", ProbChance.PROBABILITY, 10000),
  new PayProbChanceCard ("Siete creditore verso la Banca di 20.000 lire: ritiratele", ProbChance.PROBABILITY, 20000),
  new PayProbChanceCard ("Avete venduto delle azioni: ricavate 5.000 lire", ProbChance.PROBABILITY, 5000),
  new PayProbChanceCard ("Pagate il conto del Dottore: 5.000 lire", ProbChance.PROBABILITY, -5000),
  new PayProbChanceCard ("Rimborso tassa sul reddito: ritirate 2.000 lire dalla Banca", ProbChance.PROBABILITY, 2000),
  new PayProbChanceCard ("E' il vostro compleanno: ogni giocatore vi regala 1.000 lire", ProbChance.PROBABILITY, 1000, players),
  new PayProbChanceCard ("pagate una multa di 1.000 lire", ProbChance.PROBABILITY, -1000),
  
  new MoveProbChanceCard ("Ritornate al Vicolo Corto", ProbChance.PROBABILITY, 1, false),
  new MoveProbChanceCard ("Andate fino al \" VIA! \"", ProbChance.PROBABILITY, 0, true),
  new MoveProbChanceCard ("Andate in prigione direttamente e senza passare dal \" VIA! \"", ProbChance.PROBABILITY, 30, false),
};
ProbChanceCard[] chances = new ProbChanceCard[]{
  new JailProbChanceCard ("Uscite gratis di prigione, se ci siete: potete conservare questo cartoncino sino al momento di servirvene (non si sa mai) oppure venderlo", ProbChance.CHANCE),
  new PayProbChanceCard ("Versate 2.000 lire per beneficenza", ProbChance.CHANCE, -2000),
  new PayProbChanceCard ("Maturano le cedole delle vostre cartelle di rendita, ritirate 15.000 lire", ProbChance.CHANCE, 15000),
  new PayProbChanceCard ("Multa di 1.500 lire per aver guidato senza patente", ProbChance.CHANCE, -1500),
  new PayProbChanceCard ("Avete vinto un terno al lotto: ritirate 10.000 lire", ProbChance.CHANCE, 10000),
  new PayProbChanceCard ("Matrimonio in famiglia: spese impreviste 15.000", ProbChance.CHANCE, -15000),
  
  new MoveProbChanceCard ("Andate sino al Largo Colombo: se passate dal \" Via! \" ritirate 20.000 lire", ProbChance.CHANCE, 24, true),
  new MoveProbChanceCard ("Andate fino al Parco della Vittoria", ProbChance.CHANCE, 39, true),
  new MoveProbChanceCard ("Andate sino a Via Accademia: se passate dal \" Via! \" ritirate le 20.000 lire", ProbChance.CHANCE, 11, true),
  new MoveProbChanceCard ("Andate avanti sino al \" Via! \"", ProbChance.CHANCE, 0, true),
  new MoveProbChanceCard ("Andate alla Stazione NORD; se passate dal \" Via! \" ritirate le 20.000 lire", ProbChance.CHANCE, 25, true),
  new MoveProbChanceCard ("Andate in prigione direttamente e senza passare dal \" VIA! \"", ProbChance.CHANCE, 30, false),
  
  new HousesTaxProbChanceCard ("Dovete pagare per contributo di miglioria stradale, 4.000 lire per ogni casa, 10.000 lire per ogni albergo che possedete", ProbChance.CHANCE, 4000, 10000),
  new HousesTaxProbChanceCard ("Avete tutti i vostri stabili da riparare: pagare 2.500 lire per ogni casa e 10.000 lire per ogni albergo", ProbChance.CHANCE, 2500, 10000),
};

void shuffle (Object[] list){
  for (int i=0; i<list.length; i++){
    int i1 = (int) random(list.length);
    int i2 = (int) random(list.length);
    Object temp = list[i1];
    list[i1] = list[i2];
    list[i2] = temp;
  }
}
