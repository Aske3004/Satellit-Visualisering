class Satellite {
  PVector rAxis, position1, position2;
  float speed, rotateAngle, radius, angleB, arcLength;
  String satLink;

  Satellite(String satLink) {
    //JSON api
    JSONObject j = loadJSONObject(satLink);
    JSONArray positionsJson = j.getJSONArray("positions");

    //get positions of satellite
    JSONObject pos1 = positionsJson.getJSONObject(0);
    JSONObject pos2 = positionsJson.getJSONObject(1);

    float sat1Lon = pos1.getFloat("satlongitude");
    float sat1Lat = pos1.getFloat("satlatitude");
    float sat1Alt = pos1.getFloat("sataltitude");

    float sat2Lon = pos2.getFloat("satlongitude");
    float sat2Lat = pos2.getFloat("satlatitude");

    //radius of satellites orbit from center of earth
    radius = earth.r + sat1Alt *0.031;

    //spheric to cartesian coordinates
    float theta1 = radians(sat1Lat);
    float phi1 = radians(sat1Lon)+PI;
    float theta2 = radians(sat2Lat);
    float phi2 = radians(sat2Lon)+PI; //<>//

    float x1 = radius * cos(theta1) * cos(phi1);
    float y1 = -radius * sin(theta1);
    float z1 = -radius * cos(theta1) * sin(phi1);
    float x2 = radius * cos(theta2) * cos(phi2);
    float y2 = -radius * sin(theta2);
    float z2 = -radius * cos(theta2) * sin(phi2);
    PVector position1 = new PVector(x1, y1, z1);
    PVector position2 = new PVector(x2, y2, z2);

    //axis satellite rotates around
    rAxis = position1.cross(position2);

    //calculate speed of satellite //<>//
    angleB = PVector.angleBetween(position1, position2);
    speed = earth.ratio*angleB/60;
}

  void update() {
    //rotate satellite around earth
    rotateAngle += speed;
    pushMatrix();
    translate(width/2,height/2);
    rotateY(earth.rotationSpeed);
    rotate(rotateAngle, rAxis.x, rAxis.y, rAxis.z);
    translate(radius, 0, 0);
    box(5);
    popMatrix();
  }
}
