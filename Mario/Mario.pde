int [][] field;
boolean goLeft;
boolean goRight;
Character mario;
/*
 0: space
 1: normal ground
 2: normal block
 10: space && starting position of mario. it will be treated 0
 */

void setup() {
  size(1300, 800); // one cell is 50*50. so 26 * 16 cells.
  field = new int[16][26]; // [y][x]
  String[] fieldStrings = loadStrings("field.txt");
  //int[] fieldData =  int(split(fieldStrings[0], ','));
  for (int i= 0; i<16; i++) {
    int[] fieldLineData = int(split(fieldStrings[i], ','));
    for (int j=0; j<26; j++) {
      field[i][j] = fieldLineData[j];
    }
  }
  setupMario();
  noStroke();
}

void draw() {
  drawField();
//  moveEnemies();
  moveMario();
  drawMario();
}

void drawField() {
  background(0);
  for (int y=0; y<16; y++) {
    for (int x=0; x<26; x++) {
      switch(field[y][x]) {
        case 0:
          noStroke();
          fill(127,127,255);
          break;
        case 1:
          noStroke();
          fill(180,63,31);
          break;
        case 2:
          stroke(180,63,31);
          fill(255,127,63);
          break;
        default:
          break;
      }
      rect(x*50,y*50,50,50);
    }
  }
}

void moveMario() {
  if(goLeft) {
    // go forward
    mario.move(1);
  }
  if(goRight) {
    // go backward
    mario.move(-1);
  } else {
    mario.move(0);
  }
}

void drawMario() {
  mario.display();
}

void setupMario() {
  int marioX = 0;
  int marioY = 0;
  for(int y=0; y<16; y++) {
    for(int x=0; x<26; x++) {
      if(field[y][x] == 10) {
        marioX = x*50+25;
        marioY = y*50+25;
        field[y][x] = 0;
      }
    }
  }
  mario = new Character(marioX,marioY,field);
}

void keyPressed() {
  if(keyCode == 39 ) {
    goRight = false;
    goLeft = true;
  } else if(keyCode == 37) {
    goRight = false;
    goRight = true;
  } else if(keyCode == 38) {
    mario.jump();
  }
}
void keyReleased() {
  if(keyCode == 39) {
    goLeft = false;
  } else if(keyCode == 37) {
    goRight = false;
  }
}
