class Earth {
  float rotationSpeed, earthRotate;

  //real rotation speed of earth in radians
  float radiansPerSecond = 0.00007/60;

  //ratio. One second in program ten minutes in real life.
  float ratio = 10*60;


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

    earthRotate = radiansPerSecond * ratio ;
    
  }

  void update() {
    translate(width*0.5, height*0.5);
    rotateY(rotationSpeed);
    rotationSpeed += earthRotate;

    fill(200);
    noStroke();
    shape(globe);
  }
}
