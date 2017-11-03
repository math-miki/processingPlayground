class Circles {
  float x;
  float y;
  float r;
  int n;
  Circles(float _x, float _y, float _r, int _n) {
    this.x = _x;
    this.y = _y;
    this.r = _r;
    this.n = _n;
  }
  void updateFrames(float _x, float _y, float _r, int _n) {
    this.x = _x;
    this.y = _y;
    this.r = _r;
    this.n = _n;
  }
  void display() {
    drawFractalOfCircles(x,y,r,n);
  }
  void drawFractalOfCircles(float _x,float _y, float _r, int _n) {
    println(_n);
    ellipse(_x,_y,_r*2,_r*2);
    if(_n>1) {
      drawFractalOfCircles(_x-_r/2,_y,_r/2,_n-1);
      drawFractalOfCircles(_x+_r/2,_y,_r/2,_n-1);
    }
  }
}
