float x;
float xstart;
float ynoise;
void setup() {
  size (1000, 1000, P3D);
  
  stroke(255);
  colorMode(HSB, 360, 100, 100);
  fill (112, 59, 93);
 
}

void draw() {
  //rotateY(mouseY);
   xstart = random(10);
  ynoise = random(10);
  background (0);
  translate (width/2, height/2, 0);
  for (float y= -(height/8); y <=(height/8); y+=3) {
    ynoise+=0.02;
    float xnoise= xstart;
    for (float x=-(width/8); x <=(width/8); x+=1) {
      xnoise +=0.02;
      drawPoint (x, y, noise(xnoise, ynoise));
    }
  }
  //for (float y= -(height/8); y <=(height/8); y+=3) {
  //  ynoise+=0.02;
  //  float xnoise= xstart;
  //  for (float x=-(width/8); x <=(width/8); x+=1) {
  //    xnoise +=0.02;
  //    drawPoint (x, y, noise(xnoise, ynoise));
  //  }
  //}
  //for (float y= -(height/8); y <=(height/8); y+=3) {
  //  ynoise+=0.02;
  //  float xnoise= xstart;
  //  for (float x=-(width/8); x <=(width/8); x+=1) {
  //    xnoise +=0.02;
  //    drawPoint (x, y, noise(xnoise, ynoise));
  //  }
  //}
}

void drawPoint (float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x*noiseFactor*6, y*noiseFactor*4, -y);
  float edgeSize= noiseFactor*2;
  ellipse(0, 0, edgeSize, edgeSize);
  popMatrix();
}