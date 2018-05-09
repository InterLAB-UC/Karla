import ddf.minim.*;

Minim minim;
AudioInput mic;

float circleSize ;
float radius ;
int period = 5; //speed
float x = 0;
float particleY;
float amplitude;
float sineEl;
float r = 0.;

int randomPart[] = new int[100];
int partSize[] = new int[100];


void setup() {
  size(600, 600);
  minim = new Minim(this);


  mic = minim.getLineIn();
  for (int i = 0; i < randomPart.length; i++) {
    randomPart[i] = int(random(100, 500));
    partSize[i] = int(random(2, 11));
  }
  rectMode(CENTER);
}

void draw() {
  background(0);
  //noStroke();
  //fill(0,20);
  //rect(0,0,width,height);
  println(mic.left.level()*10000);
  circleSize = mic.left.level()*1000;
  radius = circleSize/2;
  x += 0.01;

  for (int yRand = 0; yRand < randomPart.length; yRand++) {

    particleY = randomPart[yRand];

    float sine = sin((2*PI*x)/period + randomPart[yRand]);
    amplitude = sqrt(sq(radius) - sq(abs(height/2 - particleY)));
    sineEl = width/2 + sine * amplitude;

    float particleSize = partSize[yRand];

    //rotation
    pushMatrix();
    translate(width/2, height/2);
    r += 0.005;
    rotate(radians(r));
    translate(-width/2, -height/2);

    stroke(255);
    //line(width/2, 0, width/2, height); //uncomment to see the axis
    //noStroke();
    fill(255);
    
    ellipse(sineEl, particleY, particleSize, particleSize);
    rect(width/2,height/2,7,7);
    line(width/2,height/2,sineEl,particleY);
    popMatrix();
  }

  noFill();
  stroke(255);
  //ellipse(width/2, height/2, circleSize, circleSize);
}