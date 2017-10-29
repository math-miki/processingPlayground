class Cell {
  int x;
  int y;
  Cell(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void dis() {
    ellipse(this.x, this.y, 100, 100);
    ellipse(this.x, this.y, 80, 80);
    ellipse(this.x, this.y, 60, 60);
    ellipse(this.x, this.y, 40, 40);
    ellipse(this.x, this.y, 20, 20);
  }
  void display(float cx, float cy) {
    ellipse(this.x, this.y, 100, 100);
    float dist = dist(cx, cy, this.x, this.y);
    float theta = atan2( mouseY-this.y, mouseX-this.x );
    if (dist > 10) {
      ellipse(this.x + 10*cos(theta), this.y + 10*sin(theta), 80, 80);
    } else {
      ellipse(cx, cy, 80, 80);
    }
    if (dist > 20) {
      ellipse(this.x + 20*cos(theta), this.y + 20*sin(theta), 60, 60);
    } else {
      ellipse(cx, cy, 60, 60);
    }
    if (dist > 30) {
      ellipse(this.x + 30*cos(theta), this.y + 30*sin(theta), 40, 40);
    } else {
      ellipse(cx, cy, 40, 40);
    }
    if (dist > 40) {
      ellipse(this.x + 40*cos(theta), this.y + 40*sin(theta), 20, 20);
    } else {
      ellipse(cx, cy, 20, 20);
    }
  }
  void displayWithAngle() {
    float theta = atan2( mouseY-this.y, mouseX-this.x );
    ellipse(this.x, this.y, 100, 100);
    ellipse(this.x + 10*cos(theta), this.y + 10*sin(theta), 80, 80);
    ellipse(this.x + 20*cos(theta), this.y + 20*sin(theta), 60, 60);
    ellipse(this.x + 30*cos(theta), this.y + 30*sin(theta), 40, 40);
    ellipse(this.x + 40*cos(theta), this.y + 40*sin(theta), 20, 20);
  }
}