int [][] field;
void setup() {
  size(1300, 800); // one cell is 50*50. so 26 * 16 cells.
  field = new int[16][26]; // [y][x]
  String[] fieldStrings = loadStrings("field.txt");
  int[] fieldData =  int(split(fieldStrings[0], ','));
  for (int i=0; i<fieldData.length; i++) {
    field[int(i/26)][i%26] = fieldData[i];
  }
  noLoop();
  noStroke();
}

void draw() {
  for (int y=0; y<16; y++) {
    for (int x=0; x<26; x++) {
      if(field[y][x] == 1) {
        fill(255,0,0);
      } else {
        fill(0,255,0);
      }
      rect(x*50,y*50,50,50);
    }
  }
}


/*
 0: space
 1: normal ground
 2: normal block
 */