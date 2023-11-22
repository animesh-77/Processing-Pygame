Circle[][] circles = new Circle[40][40];

color color_from = color(204, 102, 0);
color color_to = color(0, 102, 153);



float startHue = 50; // Initial hue value
float saturation = 50; // Saturation value (0 to 100)
float brightness = 75; // Brightness value (0 to 100)

color cyclicHSVColor(float value) {
  float hue = startHue + degrees(value) % 360; // Map the angle to the hue value in the range [0, 360)
  return color(hue, saturation, brightness);
}



void setup() {
  size(800, 800, P3D);
  colorMode(HSB, 360, 100, 100); // Set color mode to HSB
  
  
  for (int i = 0; i < circles.length; i++) {
    
    for (int j = 0; j < circles[i].length; j++) {
      
      float x = i * 30 + 15;        // Adjust the spacing between circles along the X-axis
      float y = j * 30 + 15;        // Adjust the spacing between circles along the Y-axis
      float ax = 0;    // Random initial angleX
      float ay = 0;    // Random initial angleY
      float az = 0;    // Random initial angleZ
      float size = 20;  // Random size
      
      float change_angleX= map(i, 0, 40, radians(60), radians(90));
      float change_angleY= map(j, 0, 40, radians(60), radians(90));
      
      circles[i][j] = new Circle(x, y, ax, ay, az, size, change_angleX, change_angleY, 0);
    }
  }
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
  //myCircle1.display();
  //}

  
  //myCircle3.display();
  
  for (int i = 0; i < circles.length; i++) {
    
    for (int j = 0; j < circles[i].length; j++) {
      
     
      
      circles[i][j].display(false);
    }
  }


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
  void display(boolean print_val) {
    
    color interA;
    
    
    float total_rotation = angleX+ angleY;
     
    //if (angleX <= 2*PI)
    //{
    //  interA = lerpColor(color_from, color_to, total_rotation/(2*PI));
    //}
    //else
    //{
    //  interA= lerpColor(color_to, color_from, (total_rotation-2*PI)/(2*PI));
    //}
    
    interA = cyclicHSVColor(total_rotation);
    
    
    
    
    
    //float green = map(angleX, 0, 2*PI, 30, 230);
    //float blue = map(angleX+ angleY, 0, 4*PI, 30, 230);

    
    pushMatrix();
    translate(centerX, centerY, -10);
    rotateX(angleX);  // Rotate around the X-axis
    rotateY(angleY);  // Rotate around the Y-axis
    //rotateZ(angleZ);  // Rotate around the Z-axis
  
    
    
    
    fill(0);
    //stroke(red, 0, 0);
    //stroke(255, 255, 255);
    stroke(interA);
    strokeWeight(3);
    ellipse(0, 0, circleSize, circleSize);
    
    angleX += radians(change_angleX);
    
    angleX = angleX % (2*PI);
    
    
    
    angleY += radians(change_angleY);
    
    angleY = angleY % (2*PI);
    
    //angleZ += radians(change_angleZ);
    popMatrix();
    
  }
}
