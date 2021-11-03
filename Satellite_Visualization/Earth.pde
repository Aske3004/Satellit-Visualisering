class Earth {
  float rotationSpeed, earthRotate;

  //ratio. One second in program ten minutes in real life.
  float ratio = 10*60;

  //real rotation speed of earth in radians
  float radiansPerSecond = ratio*(0.00007/60);

  //multiply radius of earth by 0.031 to get r
  float r = 198;
  PImage earth;
  PShape globe;

  Earth() {
  }

  void create() {
    globe = createShape(SPHERE, r);
    earth = loadImage("earth.jpg");
    globe.setTexture(earth);
    earthRotate = radiansPerSecond;
  }

  void update() {
    pushMatrix();
    translate(width/2, height/2);
    rotateY(rotationSpeed);
    shape(globe);
    popMatrix();
    rotationSpeed += earthRotate;
    fill(200);
    noStroke();
  }
}
