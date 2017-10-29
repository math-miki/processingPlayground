void setup() {
  size(800, 400);
  background(0);
}

void draw() {
  colorMode(HSB,width,height,100);
  noStroke();
  for (int y=0; y<40; y++) {
    for (int x=0; x<40; x++) {
      fill(x*20,height-y*20,100);
      rect(x*20,y*20,20,20);
    }
  }
}