class Satellite{
  PVector rAxis;
  float speed;
  float rotateAngle;
  PVector position1;
  PVector position2;
  float distance = 210;
  String satLink;
  float angleB;
  float arcLength;
  
   Satellite(String satLink){
    JSONObject j = loadJSONObject(satLink);
    JSONArray positionsJson = j.getJSONArray("positions");
    
    JSONObject pos1 = positionsJson.getJSONObject(0);
    JSONObject pos2 = positionsJson.getJSONObject(1);
    
    float sat1Lon = pos1.getFloat("satlongitude");
    float sat1Lat = pos1.getFloat("satlatitude");
    float sat2Lon = pos2.getFloat("satlongitude");
    float sat2Lat = pos2.getFloat("satlatitude");
    
    float theta1 = radians(sat1Lat);
    float phi1 = radians(sat1Lon)+PI;
    float theta2 = radians(sat2Lat);
    float phi2 = radians(sat2Lon)+PI;
    
    float x1 = distance * cos(theta1) * cos(phi1);
    float y1 = -distance * sin(theta1);
    float z1 = -distance * cos(theta1) * sin(phi1);
    float x2 = distance * cos(theta2) * cos(phi2);
    float y2 = -distance * sin(theta2);
    float z2 = -distance * cos(theta2) * sin(phi2);
    PVector position1 = new PVector(x1,y1,z1);
    PVector position2 = new PVector(x2,y2,z2);
    
    rAxis = position1.cross(position2);
    println(rAxis);
    
    angleB = PVector.angleBetween(position1,position2);
    arcLength = angleB*distance;
    speed = arcLength/60;
    println(speed);
    
    
    //speed=0.01;
  }
  
  void update(){
    rotateAngle += speed;
    pushMatrix();
    rotate(rotateAngle,rAxis.x,rAxis.y,rAxis.z);
    translate(distance,0,0);
    box(10);
    popMatrix();
  }
}
