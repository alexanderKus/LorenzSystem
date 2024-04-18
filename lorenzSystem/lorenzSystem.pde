import peasy.*;

float sigma = 10.0;
float b = 8.0/3.0;
float r = 28.0;
float dt = 0.01;

float x = 2;
float y = 1;
float z = 1;

ArrayList<PVector> points = new ArrayList<PVector>();
PeasyCam jCam;

void setup() {
  size(800, 600, P3D);
  jCam = new PeasyCam(this, 100);  
}

void draw() {
  background(0);
  
  float dx = sigma * y - sigma * x;
  float dy = -x * z + r * x - y;
  float dz = x * y - b * z;
  x = x + dx * dt;
  y = y + dy * dt;
  z = z + dz * dt;  
 points.add(new PVector(x, y, z));

  translate(0,0, -80);
  stroke(255);
  noFill();

  beginShape();
  for(var v: points) {
    vertex(v.x, v.y, v.z);
      //println(x, y, z);
  }
  endShape();
}
