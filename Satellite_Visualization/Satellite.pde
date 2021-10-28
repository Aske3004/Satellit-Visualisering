class Satellite {
  float rotation;
  float radius = 0;
  String link;
  float angleBetween;
  float theta;
  float phi;
  PVector pos = new PVector();
  PVector rotateAxis = new PVector(0,0,0);
  
  Satellite(String link) {
    this.link=link;
  }

  PVector create() {
    JSONObject j = loadJSONObject(link);
    JSONArray positionsJson = j.getJSONArray("positions");

    JSONObject pos1 = positionsJson.getJSONObject(0);
    JSONObject pos2 = positionsJson.getJSONObject(1);

    float sat1Lon = pos1.getFloat("satlongitude");
    float sat1Lat = pos1.getFloat("satlatitude");

    float theta = radians(sat1Lat);
    float phi = radians(sat1Lon)+PI;

    float x = radius * cos(theta)*cos(phi);
    float y = -radius * sin(theta);
    float z = -radius * cos(theta)*sin(phi);

    println(sat1Lon, sat1Lat);
    

    PVector pos = new PVector(x, y, z);
    println(pos);
    return pos;
  }
  
  void rotation(PVector pos){
    PVector xaxis = new PVector(1,0,0);
    angleBetween = PVector.angleBetween(xaxis,pos);
    rotateAxis = xaxis.cross(pos);
  }

  void update() {
    rotation+=0.1;
    pushMatrix();
    translate(width/2, height/2);
    rotate(rotation, rotateAxis.x, rotateAxis.y, rotateAxis.z);
    translate(radius, theta, phi);
    box(20);
    popMatrix();
  }
}
