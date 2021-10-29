Earth earth;
Satellite iss;

void setup() {
  frameRate(60);
  size(600, 600, P3D);
  noStroke();
  earth = new Earth();
  earth.create();
  
  iss = new Satellite("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=A3H9WM-AYYDBG-RRDS8C-4SPM");
  
}

void draw() {
  clear();
  noStroke();
  background(51);
  earth.update();
  iss.update();
}
