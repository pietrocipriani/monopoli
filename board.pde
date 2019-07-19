final static color FUCSIA_GROUP = 0xFFE70670;
final static color CYAN_GROUP = 0xFF0E95FF;
final static color ORANGE_GROUP = 0xFFFF4526;
final static color BROWN_GROUP = 0xFF8C2A29;
final static color RED_GROUP = 0xFFFF1A16;
final static color YELLOW_GROUP = 0xFFECF246;
final static color GREEN_GROUP = 0xFF24B155;
final static color PURPLE_GROUP = 0xFF9A3EA9;

final static color bg = 0xFFCDD7BE;

boolean boardOverlayed = false;

void drawBoard (int l){
  noStroke();
  fill (bg);
  rect (0, 0, l ,l);
  
  fill (0);
  textFont (fontBigBig);
  textAlign (CENTER, CENTER);
  text ("MONOPOLI", 0, 0);
  textFont (fontSmall);
  
  for (int i=0; i<4; i++){
    pushMatrix();
    rotate(PI/2*i);
    
    noFill();
    strokeWeight(l/400f);
    stroke (0, 0, 0);
    rectMode (CORNER);
    pushMatrix();
    translate(l*3/8f, l*3/8f);
    boxes[i][0].drawBox(l);
    popMatrix();
    
    for (int j=1; j<10; j++){
      noFill();
      strokeWeight(l/400f);
      stroke (0, 0, 0);
      rectMode (CORNER);
      pushMatrix();
      translate(l*(9-2*j)/24f, l*3/8f);
      boxes[i][j].drawBox(l);
      popMatrix();
    }
    popMatrix();
  }
}

void mouseClickedBoardDelegate (MouseEvent e){
  if (boardOverlayed){
    boolean called = false;
    for (int i=0; i<40; i++) if (boxes[i/10][i%10] instanceof InfoBox && ((InfoBox) boxes[i/10][i%10]).show != Show.NO) {
      ((InfoBox) boxes[i/10][i%10]).mouseClickedDelegate(e);
      called = true;
    }
    if (called) return;
    boardOverlayed = false;
  }
  
  if (e.getX() < (width-lastL)/2 || e.getX() > (width+lastL)/2 || e.getY() < (height-lastL)/2 || e.getY() > (height+lastL)/2) return;
  
  if (e.getX() > (4*width-3*lastL)/8f && e.getY() > (4*height+3*lastL)/8f) {
    int index;
    if (e.getX() > (4*width+3*lastL)/8f) index = 0;
    else index = (int) ( 3f * ( 2*width - 4*e.getX() ) / lastL + 5.5f );
    boxes[0][index].onClick();
  } else if (e.getX() < (4*width-3*lastL)/8f && e.getY() > (4*height-3*lastL)/8f) {
    int index;
    if (e.getY() > (4*height+3*lastL)/8f) index = 0;
    else index = (int) ( 3f * ( 2*height - 4*e.getY() ) / lastL + 5.5f );
    boxes[1][index].onClick();
  } else if (e.getX() < (4*width+3*lastL)/8f && e.getY() < (4*height-3*lastL)/8f) {
    int index;
    if (e.getX() < (4*width-3*lastL)/8f) index = 0;
    else index = (int) ( 3f * ( 4*e.getX() - 2*width ) / lastL + 5.5f );
    boxes[2][index].onClick();
  } else if (e.getX() > (4*width+3*lastL)/8f && e.getY() < (4*height+3*lastL)/8f) {
    int index;
    if (e.getY() < (4*height-3*lastL)/8f) index = 0;
    else index = (int) ( 3f * ( 4*e.getY() - 2*height ) / lastL + 5.5f );
    boxes[3][index].onClick();
  }
}
