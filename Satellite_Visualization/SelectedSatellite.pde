int value = 0;
int currentSatellite = 1;
String satelliteName;

void changeSatellite() {
  if (value==0) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        currentSatellite--;
      } else if (keyCode == RIGHT) {
        currentSatellite++;
      }
    }
    value=255;
  }
  if(currentSatellite>5){
    currentSatellite=1;
  }
  else if (currentSatellite<1){
    currentSatellite=5;
  }
  if(currentSatellite==1)satelliteName=sat1.satName;
  else if(currentSatellite==2)satelliteName=sat2.satName;
  else if(currentSatellite==3)satelliteName=sat3.satName;
  else if(currentSatellite==4)satelliteName=sat4.satName;
  else if(currentSatellite==5)satelliteName=sat5.satName;
  
  fill(255);
  textSize(20);
  text("The current satellite is: "+satelliteName,10,height-15);
}

void keyReleased() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}
