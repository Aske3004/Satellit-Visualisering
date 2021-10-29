class Earth {
  float angle;
  Table table;
  
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
  }

  void update() {
    translate(width*0.5, height*0.5);
    rotateY(angle);
    angle += 0.003;
    fill(200);
    noStroke();
    shape(globe);
  }
}
