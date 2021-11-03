void drawSatellites() {
  sat1.update();
  sat2.update();
  sat3.update();
  sat4.update();
  sat5.update();
}

void createSatellites() {
  sat1 = new Satellite(25544, 1);
  sat2 = new Satellite(5, 2);
  sat3 = new Satellite(22, 3);
  sat4 = new Satellite(29, 4);
  sat5 = new Satellite(58, 5);
}
