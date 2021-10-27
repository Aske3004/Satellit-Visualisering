float angle;

Table table;
float r = 200;

PImage earth;
PShape globe;

void setup() {
  size(600, 600, P3D);
  //earth = loadImage("earth.jpg");

  noStroke();
  globe = createShape(SPHERE, r);
  //globe.setTexture(earth);
}

void draw() {
  background(51);
  translate(width*0.5, height*0.5);
  rotateY(angle);
  angle += 0.05;

  lights();
  fill(200);
  noStroke();
  //sphere(r);
  shape(globe);
}
