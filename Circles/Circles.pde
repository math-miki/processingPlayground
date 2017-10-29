Cell[][] cells = new Cell[13][8];
void setup() {
  size(1300, 800);
  for (int i=0; i<13; i++) {
    for (int j=0; j<8; j++) {
      cells[i][j] = new Cell(i*100+50,j*100+50);
    }
  }
}

void draw() {
  background(255);
  for (int x=0; x<13; x++) {
    for (int y=0; y<8; y++) {
      if((int(mouseX/100) == x)&&(int(mouseY/100) == y)){
        cells[x][y].display(mouseX,mouseY);
      } else {
        cells[x][y].displayWithAngle();
  
      }
    }
  }
}