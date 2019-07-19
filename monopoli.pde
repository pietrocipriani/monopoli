PImage train;
PImage probability;
PImage chance;
PImage jail;
PImage toJail;

int lastL = 0;
PFont fontSmall;
PFont fontMedium;
PFont fontMediumBold;
PFont fontBig;
PFont fontBigBig;

Player[] players = new Player[]{new Player("Io", 0xFF0000FF), new Player("Tu", 0xFFFF0000)};
int playerTurn = 0;

Player currentPlayer;

void setup (){
  size (500, 500, P2D);
  surface.setResizable(true);
  frameRate = 30;
  textAlign(CENTER, CENTER);
  
  train = loadImage("train.png");
  probability = loadImage("probability.png");
  chance = loadImage("chance.png");
  jail = loadImage("jail.png");
  toJail = loadImage("toJail.png");
  
  ((PGraphicsOpenGL)g).textureSampling(3);
  //smooth (4);
  //for (String s : PFont.list()) if (s.contains("Mono")) println(s);
  
  shuffle(probabilities);
  shuffle(chances);
}

void draw (){
  rectMode(CENTER);
  //clear();
  background (0, 0, 0);
  int l = min(height, width);
  if (lastL != l) {
     lastL = l;
     fontSmall = createFont("Ubuntu Mono", l/100f);
     fontMedium = createFont("Ubuntu Mono", l/35f);
     fontMediumBold = createFont("Ubuntu Mono Bold", l/35f);
     fontBig = createFont("Ubuntu Mono Bold", l/20f);
     fontBigBig = createFont("Ubuntu Mono Bold", l/10);
  }
   
  translate(width/2.0, height/2.0);
  drawBoard (l);
  drawPlayers (l);
  
  if (boardOverlayed){  
    rectMode(CENTER);
  
    noStroke();
    fill(0x90000000);
    rect(0, 0, width, height);
    
    for (int i=0; i<40; i++)
      if (boxes[i/10][i%10] instanceof InfoBox){
        InfoBox b = (InfoBox)boxes[i/10][i%10];
        if (b.show == Show.INFO) b.drawInfo();
        else if (b.show == Show.OVER) b.drawOver();
      }
  }
}

void drawPlayers (int l){
  ellipseMode(CORNER);
  for (Player p : players){
    pushMatrix();
    rotate(PI/2*(p.pos/10));
    translate(l*(9-2*(p.pos%10))/24f, l*3/8f);
    stroke(0);
    fill(p.c);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }
}

String intToStringWithDots (int num){
  String str = "";
  if (num < 0) return "-"+intToStringWithDots(-num);
  if (num < 1000) return String.valueOf(num);
  int n = 0;
  while (num > 0){
    str = num%10 + (n%3==0 && n!=0 ? ".":"") + str;
    num /= 10;
    n++;
  }
  return str;
}

void mouseClicked (MouseEvent e){
  
  mouseClickedBoardDelegate(e);
}

void keyPressed (){ //<>//
  if (keyCode == ENTER && !boardOverlayed){ //<>//
    Player p = players[playerTurn++];
    p.goAhead();
    
    playerTurn %= players.length;
  }
}
