class Earth {
  float angle;
  Table table;
  float r = 200;
  PImage earth;
  PShape globe;

  Earth() {
  }

  void create() {
    globe = createShape(SPHERE, r);
    //earth = loadImage("earth.jpg");
    //globe.setTexture(earth);
  }

  void update() {
    translate(width*0.5, height*0.5);
    rotateY(angle);
    angle += 0.03;
    lights();
    fill(200);
    noStroke();
    //sphere(r);
    shape(globe);
  }
}
