import ddf.minim.*;
Minim minim;
AudioInput mic;

float x;
float xstart;
float ynoise;
float resultadoMic = 1024;

void setup() {
  //size (1920, 1080, P3D);
  size (1920, 1080,P3D);
  minim = new Minim(this);
  mic = minim.getLineIn();

  //stroke(255);
  colorMode(HSB, 360, 100, 100);
  //fill (112, 59, 93);
  background (0);
}

void draw() {
  
  resultadoMic = 1 / abs(mic.left.level());
  //resultadoMic = mic.left.level();
  println(resultadoMic);
  float lvl = map(resultadoMic, 1024, 4, height, 0);
  

  if (resultadoMic > 100) {
    resultadoMic = 100;
  }

  if (resultadoMic < 4) {
    resultadoMic = 40;
  }


  
  xstart = random(10);
  ynoise = random(10);
  background (0);
  strokeWeight(1);
  stroke (random(360), random(100), random(100));
  fill (360);
  translate (width/2, height/2, 0);
  for (float y= -(height / resultadoMic); y <=(height / resultadoMic); y+=3) {
    ynoise+=0.02;
    float xnoise= xstart;
    for (float x=-(width / resultadoMic); x <=(width / resultadoMic); x+=1) {
      xnoise +=0.02;
      drawPoint (x, y, noise(xnoise, ynoise));
    }
  }


  strokeWeight(20);
  stroke(255, 100, 100);
  line(200, height/2, 200, lvl);
}

void drawPoint (float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x*noiseFactor*6, y*noiseFactor*4, -y);
  float edgeSize= noiseFactor*4;
  ellipse(0, 0, edgeSize, edgeSize);
  popMatrix();
}