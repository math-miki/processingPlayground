void setup() {
  size(800,800);
  background(0);
  fill(0);
  noLoop();
}

void draw() {
  drawGasket(400,95.5,50,700,750,700,7);
}

void drawGasket(float x1, float y1, float x2, float y2, float x3, float y3, int n) {
  fill(255);
  triangle(x1,y1,x2,y2,x3,y3);
  fill(0);
  triangle((x2+x3)/2,(y2+y3)/2,(x1+x2)/2,(y1+y2)/2,(x1+x3)/2,(y1+y3)/2);
  if(n>1) {
    drawGasket(x1,y1,(x1+x2)/2,(y1+y2)/2,(x1+x3)/2,(y1+y3)/2,n-1);
    drawGasket(x2,y2,(x1+x2)/2,(y1+y2)/2,(x2+x3)/2,(y2+y3)/2,n-1);
    drawGasket(x3,y3,(x3+x2)/2,(y3+y2)/2,(x1+x3)/2,(y1+y3)/2,n-1);
  }
}
