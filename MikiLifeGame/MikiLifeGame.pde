int[][] field;

void setup() {
  size(800,200);
  field = new int[50][200];
  String[] fieldStrings = loadStrings("defaultMap.txt");
  for (int i= 0; i<50; i++) {
    int[] fieldLineData = int(split(fieldStrings[i], ','));
    for (int j=0; j<200; j++) {
      field[i][j] = fieldLineData[j];
    }
  }
  noLoop();
}

void draw() {
  background(255);
  fill(124,65,89);
  for(int y=0; y<50; y++) {
    for(int x=0; x<200; x++) {
      rect(x*4,y*4,4,4);
    }
  }
}

void drawField() {

}

void createNewGeneration() {

}
