class Satellite { //<>// //<>//
  PVector rAxis, position1, position2;
  float speed, rotateAngle, radius, angleB, arcLength;
  String satLink, satName;
  int satId;
  long time;

  Satellite(int NORAD, int satId) {
    this.satId=satId;
    //JSON api
    JSONObject j = loadJSONObject("https://api.n2yo.com/rest/v1/satellite/positions/"+ NORAD +"/41.702/-76.014/0/2/&apiKey=A3H9WM-AYYDBG-RRDS8C-4SPM");
    JSONArray positionsJson = j.getJSONArray("positions");
    JSONObject info = j.getJSONObject("info");
    satName = info.getString("satname");

    //get positions of satellite
    JSONObject pos1 = positionsJson.getJSONObject(0);
    JSONObject pos2 = positionsJson.getJSONObject(1);

    float sat1Lon = pos1.getFloat("satlongitude");
    float sat1Lat = pos1.getFloat("satlatitude");
    float sat1Alt = pos1.getFloat("sataltitude");
    time = pos1.getLong("timestamp");

    float sat2Lon = pos2.getFloat("satlongitude");
    float sat2Lat = pos2.getFloat("satlatitude");

    //radius of satellites orbit from center of earth
    radius = earth.r + (sat1Alt *0.031);

    //spheric to cartesian coordinates
    float theta1 = radians(sat1Lat);
    float phi1 = radians(sat1Lon)+PI;
    float theta2 = radians(sat2Lat);
    float phi2 = radians(sat2Lon)+PI;

    float x1 = radius * cos(theta1) * cos(phi1);
    float y1 = -radius * sin(theta1);
    float z1 = -radius * cos(theta1) * sin(phi1);
    float x2 = radius * cos(theta2) * cos(phi2);
    float y2 = -radius * sin(theta2);
    float z2 = -radius * cos(theta2) * sin(phi2);
    position1 = new PVector(x1, y1, z1);
    position2 = new PVector(x2, y2, z2);

    //axis satellite rotates around
    rAxis = position1.cross(position2);

    //calculate speed of satellite
    angleB = PVector.angleBetween(position1, position2);
    speed = earth.ratio*(angleB/60);
  }

  void update() {
    //rotate satellite around earth
    rotateAngle += speed;
    pushMatrix();
    translate(width/2, height/2);
    rotateY(earth.rotationSpeed);
    rotate(rotateAngle, rAxis.x, rAxis.y, rAxis.z);
    translate(radius, 0, 0);
    if (currentSatellite==satId) fill(255, 255, 0);
    else fill(255);
    box(5);
    popMatrix();
  }
}
