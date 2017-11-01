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
  int[][] temp = new int[50][200];
  for(int y=0; y<50; y++) {
    for(int x=0; x<200; x++) {
      int count = 0;
      if(y == 0 && x == 0) {
        count += field[y][x+1] + field[y+1][x] + field[y+1][x+1];
      } else if (y == 0 && x == 49) {
        count += field[y][x-1] + field[y+1][x] + field[y+1][x-1];
      } else if (y == 49 && x == 0) {
        count += field[y][x+1] + field[y-1][x] + field[y-1][x+1];
      } else if (y == 49 && x == 49) {
        count += field[y][x-1] + field[y-1][x] + field[y-1][x-1];
      } else if (y == 0) {
        count += field[y][x-1] + field[y][x+1] + field[y+1][x] + field[y+1][x-1] + field[y+1][x+1];
      } else if (y == 49) {
        count += field[y][x-1] + field[y][x+1] + field[y-1][x] + field[y-1][x-1] + field[y-1][x+1];
      } else if (x == 0) {
        count += field[y-1][x] + field[y-1][x+1] + field[y][x+1] + field[y+1][x] + field[y+1][x+1];
      } else if (x == 49) {
        count += field[y-1][x] + field[y-1][x-1] + field[y][x-1] + field[y+1][x] + field[y+1][x-1];
      } else {
        count += field[y-1][x-1] + field[y-1][x] + field[y-1][x+1] + field[y][x-1] + field[y][x+1] + field[y+1][x-1] + field[y+1][x] + field[y+1][x+1];
      }
      int result = 0;
      if(field[y][x] == 0 && count == 3) {
        temp[y][x] = 1;
      } else if(field[y][x] == 1 && count == 2 || count == 2) {
        temp[y][x] = 1;
      } else {
        temp[y][x] = 0;
      }
    }
  }
  for(int y=0; y<50; y++) {
    for(int x=0; x<200; x++) {
      field[y][x] = temp[y][x];
    }
  }
}
