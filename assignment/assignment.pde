
Circle myCircle1;
Circle myCircle2;
Circle myCircle3;

void setup() {
  size(800, 800, P3D);
  myCircle1 = new Circle(100.0, 100.0, 0.0, 0.0, 0.0, 50.0, 10, 0, 0);
  myCircle2 = new Circle(200.0, 200.0, 0.0, 0.0, 0.0, 50.0, 0, 1, 0);
  //myCircle2 = new Circle(300.0, 300.0, 0.0, 0.0, 0.0, 50.0, 10, 10, 0);
  //myCircle3 = new Circle(300, 300, 0, 0, 0, 50, 0, 0, 1);
}

void draw() {
  background(0);

    // Move the origin to the center of the canvas
  //rotateX(myCircle1.angleX);  // Rotate around the X-axis
  //rotateY(myCircle1.angleY);  // Rotate around the Y-axis
  //rotateZ(myCircle1.angleZ);  // Rotate around the Z-axis
  //for (int i = 0; i <= 1000; i++) {
  myCircle1.display();
  //}
  myCircle2.display();
  //myCircle3.display();


}

class Circle {
  float centerX;
  float centerY;
  float angleX;
  float angleY;
  float angleZ;
  float circleSize;
  float change_angleX;
  float change_angleY;
  float change_angleZ;

  Circle(float x, float y, float ax, float ay, float az, float size, float d_ax, float d_ay, float d_az) {
    centerX = x;
    centerY = y;
    angleX = ax;
    angleY = ay;
    angleZ = az;
    change_angleX = d_ax;
    change_angleY = d_ay;
    change_angleZ = d_az;
    
    circleSize = size;
  }

  //void display(float d_ax, float d_ay, float d_az) {
  void display() {
    pushMatrix();
    translate(centerX, centerY, -2000);
    rotateX(angleX);  // Rotate around the X-axis
    rotateY(angleY);  // Rotate around the Y-axis
    //rotateZ(angleZ);  // Rotate around the Z-axis
  
  
    fill(0);
    stroke(255);
    strokeWeight(2);
    ellipse(0, 0, circleSize, circleSize);
    
    angleX += radians(change_angleX);
    angleY += radians(change_angleY);
    //angleZ += radians(change_angleZ);
    popMatrix();
    
  }
}
