class Character {
  float v;
  boolean jumping;
  float x;
  float y;
  Character(float init_x, float init_y) {
    this.v = 0;
    this.jumping = false;
    this.x = init_x;
    this.y = init_y;
  }
  void move(int x) {
    calcV(x);
  }
  protected void calcV(int x) {

  }
  void display() {
    
  }
}
