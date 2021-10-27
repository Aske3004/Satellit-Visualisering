Earth earth;

void setup() {
  size(600, 600, P3D);
  noStroke();
  earth = new Earth();
  earth.create();
}

void draw() {
  background(51);
  earth.update();
}
