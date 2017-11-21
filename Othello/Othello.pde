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
    if (judge(x, y, turn%2==0 ? 1 : 2))
      board[y][x] = turn%2==0 ? 1 : 2;
    turn++;
    reverse(x, y, board[y][x]);
  } else {
    board[y][x] = (board[y][x] ) % 2 + 1;
  }
}

boolean judge(int x, int y, int n) {
  return CanPutOthello(x, y, n, -1, -1, 0)
    || CanPutOthello(x, y, n, 0, -1, 0)
    || CanPutOthello(x, y, n, 1, -1, 0)
    || CanPutOthello(x, y, n, -1, 0, 0)
    || CanPutOthello(x, y, n, 1, 0, 0)
    || CanPutOthello(x, y, n, -1, 1, 0)
    || CanPutOthello(x, y, n, 0, 1, 0)
    || CanPutOthello(x, y, n, 1, 1, 0);
}

boolean CanPutOthello(int x, int y, int n, int dx, int dy, int count) {
  if (x+dx<0 || x+dx>7 || y+dy<0 || y+dy>7) {
    return false;
  }
  int nextOthello = board[y+dy][x+dx];
  if (nextOthello == n) {
    if (count == 0) {
      return false;
    } else { 
      return true;
    }
  } else if (nextOthello == n%2 + 1) {
    return CanPutOthello(x+dx, y+dy, n, dx, dy, ++count);
  } else {
    return false;
  }
}

void reverse(int x, int y, int n) {
  if (CanPutOthello(x, y, n, -1, -1, 0)) {
    re(x, y, n, -1, -1);
  }
  if (CanPutOthello(x, y, n, 0, -1, 0)) {
    re(x, y, n, 0, -1);
  }
  if (CanPutOthello(x, y, n, 1, -1, 0)) {
    re(x, y, n, 1, -1);
  }
  if (CanPutOthello(x, y, n, -1, 0, 0)) {
    re(x, y, n, -1, 0);
  }
  if (CanPutOthello(x, y, n, 1, 0, 0)) {
    re(x, y, n, 1, 0);
  }
  if (CanPutOthello(x, y, n, -1, 1, 0)) {
    re(x, y, n, -1, 1);
  }
  if (CanPutOthello(x, y, n, 0, 1, 0)) {
    re(x, y, n, 0, 1);
  }
  if (CanPutOthello(x, y, n, 1, 1, 0)) {
    re(x, y, n, 1, 1);
  }
}

void re(int x,int y,int n,int dx,int dy) {
  if (x+dx<0 || x+dx>7 || y+dy<0 || y+dy>7) {
    return;
  }
  if (board[y+dy][x+dx] != n) {
    board[y+dy][x+dx] = n;
    // 再帰
    re(x+dx, y+dy, n, dx, dy);
  } else {
    return;
  }
}