//Aske, Christoffer og Iben

//Nogle gange vil satelliten følge den 100% rigtige bane og andre gange er den lidt off. Kommer an på, hvor satelliten er i virkeligheden.
//Vi snakkede om det sammen og blev enige om at vi ikke forstod, hvad fejlen var eller om det overhovedet var vores fejl.

import java.util.Date;
Earth earth;
Satellite sat1;
Satellite sat2;
Satellite sat3;
Satellite sat4;
Satellite sat5;
long time, timeStart;

void setup() {
  frameRate(60);
  size(900, 900, P3D);
  noStroke();
  earth = new Earth();
  earth.create();
  createSatellites();
  time = sat1.time;
  timeStart = sat1.time;
}

void draw() {
  clear();
  noStroke();
  background(51);
  changeSatellite();
  earth.update();
  drawSatellites();
  time += 10;
  Date date = new Date(time*1000);
  Date startDate = new Date(timeStart*1000);
  fill(255);
  textSize(20);
  text(date.toString(), 10, 70);
  textSize(17);
  text("Estimation started at: " + startDate.toString(), 10, 30);
}
