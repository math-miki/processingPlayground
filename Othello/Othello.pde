int[][] board;
int turn = 0;
void setup() {
  size(400, 400);
  board = new int[8][8];
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      board[i][j] = 0;
    }
  }
  board[3][3] = 1;
  board[3][4] = 2;
  board[4][3] = 2;
  board[4][4] = 1;
}

void draw() {
  background(0, 100, 0);
  for (int i=1; i<8; i++) {
    stroke(255);
    line(i*50, 0, i*50, 400);
    line(0, i*50, 400, i*50);
  }
  noStroke();
  for (int y=0; y<8; y++) {
    for (int x=0; x<8; x++) {
      if (board[y][x] == 0) {
      } else {
        if (board[y][x] == 1) {
          fill(255);
        } else {
          fill(0);
        }
        ellipse(x*50+25, y*50+25, 40, 40);
      }
    }
  }
}

void mousePressed() {
  int x = mouseX/50;
  int y = mouseY/50;
  if (board[y][x] == 0) {
    turn++;
    board[y][x] = turn%2==0 ? 1 : 2;
  } else {
    board[y][x] = (board[y][x] ) % 2 + 1;
  }
}