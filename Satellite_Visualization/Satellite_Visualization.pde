//Switch between the selected satellite with RIGHTARROW and LEFTARROW
//1 second run in our program is equivalent to 10 minutes in real life

import java.util.Date;
Earth earth;
Satellite sat1;
Satellite sat2;
Satellite sat3;
Satellite sat4;
Satellite sat5;
long time;

void setup() {
  frameRate(60);
  size(600, 600, P3D);
  noStroke();
  earth = new Earth();
  earth.create();
  
  sat1 = new Satellite("https://api.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=A3H9WM-AYYDBG-RRDS8C-4SPM",1);
  sat2 = new Satellite("https://api.n2yo.com/rest/v1/satellite/positions/5/41.702/-76.014/0/2/&apiKey=A3H9WM-AYYDBG-RRDS8C-4SPM",2);
  sat3 = new Satellite("https://api.n2yo.com/rest/v1/satellite/positions/22/41.702/-76.014/0/2/&apiKey=A3H9WM-AYYDBG-RRDS8C-4SPM",3);
  sat4 = new Satellite("https://api.n2yo.com/rest/v1/satellite/positions/29/41.702/-76.014/0/2/&apiKey=A3H9WM-AYYDBG-RRDS8C-4SPM",4);
  sat5 = new Satellite("https://api.n2yo.com/rest/v1/satellite/positions/58/41.702/-76.014/0/2/&apiKey=A3H9WM-AYYDBG-RRDS8C-4SPM",5);
  time = sat1.time;
}

void draw() {
  clear();
  noStroke();
  background(51);
  changeSatellite();
  earth.update();
  sat1.update();
  //sat2.update();
  //sat3.update();
  //sat4.update();
  //sat5.update();
  time += 10;
  Date date = new Date(time*1000);
  fill(255);
  textSize(20);
  text(date.toString(),10,20);
}
