Circles circles = new Circles(400.0,400.0,300.0,5 );
int count = 1;
float x = 200.0;
float r = 400.0;
void setup() {
  size(800,800);
  circles.updateFrames(200.0,400.0,400.0,count);
}

void draw() {
  background(255);
  circles.updateFrames(x++,400.0,r -= 1,count);
  circles.display();
  if(x == 400) {
    x = 200.0;
    r = 400.0;
    count++;
  }
}
