int segmentCount;
void setup() {
  size(500,500);
  colorMode(HSB,360,width,height);
  background (360);
  segmentCount = 360;
  noStroke();
}
void draw() {
  float angleStep =360.0/segmentCount;
  beginShape(TRIANGLE_FAN);
  vertex(width/2,height/2);
  for(float angle=0;angle<=360;angle+=angleStep) {
    float x = width/2 + cos(radians(angle))*250;
    float y = height/2 + sin(radians(angle))*250;
    vertex(x,y);
    fill(angle,mouseX,mouseY);
  }
  endShape();
}
