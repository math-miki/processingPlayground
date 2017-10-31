class Character {
  float vx;
  float vy;
  boolean jumping;
  boolean falling;
  float x;
  float y;
  int[][] field;
  Character(float init_x, float init_y, int[][] fieldData) {
    this.vx = 0;
    this.vy = 0;
    this.jumping = false;
    this.x = init_x;
    this.y = init_y;
    this.field = fieldData;
  }
  void move(int dx) {
    calcVx(dx);
    calcVy();
    this.x += this.vx;
    this.y -= this.vy;
    if(field[int(this.y/50)+1][int(this.x/50)] == 0) {
      if(!(jumping)) {
        falling = true;
      }
    }
    if(this.x<0) {
      this.x = 2;
      this.vx = 0;
    }
    // calcV(x);
  }
  void jump() {
    if(!(jumping)) {
      this.vy = 35;
      this.jumping = true;
    }
  }
  protected void calcVx(int x) {
    this.vx += x*0.02;
  }
  protected void calcVy() {
    if (jumping) {
      this.vy -= 2;
      if(isFootGround() && this.vy<0) {
        this.vy = 0;
        this.jumping = false;
      }
    } else if (falling) {
      this.vy -= 2;
      if(isFootGround() && this.vy<0) {
        this.vy = 0;
        this.falling = false;
      }
    }
  }
  void display() {
    fill(255,0,0);
    rect(this.x-25,this.y-25,50,50);
  }
  boolean isFootGround() {
    int indexOfX = int(this.x/50);
    int indexOfY = int(this.y/50);
    if(field[indexOfY + 1][indexOfX] != 0) {
      this.y = indexOfY*50+25;
      return true;
    }
    return false;
  }
}
