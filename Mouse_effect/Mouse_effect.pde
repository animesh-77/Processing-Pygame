Circle[][] circles = new Circle[40][40];


float startHue = 50; // Initial hue value
float saturation = 50; // Saturation value (0 to 100)
float brightness = 75; // Brightness value (0 to 100)


color cyclicHSVColor(float value) {
  float hue = startHue + degrees(value) % 360; // Map the angle to the hue value in the range [0, 360)
  return color(hue, saturation, brightness);
}

float[] displace_from_center(float centerX, float centerY)
{
  float r= sqrt(pow((centerX- mouseX), 2)+ pow((centerY- mouseY), 2));
  
  
  float displace=  5*exp(-0.5 * pow(r / 100, 2));
  float theta= atan((centerY- mouseY)/(centerX- mouseX));
  
  float displace_x= cos(theta)* displace;
  float displace_y= sin(theta)* displace;
  
  if (theta >= 0)
  {
    float displaces[]= {displace_x, displace_y, theta};
  
    return displaces;
  }
  else
  {
    float displaces[]= {-1*displace_x, -1*displace_y, theta};
  
    return displaces;
  }
  
  
  
}


void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100); // Set color mode to HSB
  
  
  for (int i = 0; i < circles.length; i++) {
    
    for (int j = 0; j < circles[i].length; j++) {
      
      float x = i * 30 + 15;        // Adjust the spacing between circles along the X-axis
      float y = j * 30 + 15;        // Adjust the spacing between circles along the Y-axis
      
      float size = 20;  // Random size

      
      circles[i][j] = new Circle(x, y, size);
    }
  }
}

void draw() {
  background(0);

  
  for (int i = 0; i < circles.length; i++) {
    
    for (int j = 0; j < circles[i].length; j++) {
      circles[i][j].display(false);
    }
  }


}

class Circle {
  float centerX;
  float centerY;
  float circleSize;

  Circle(float x, float y, float size) {
    centerX = x;
    centerY = y;    
    circleSize = size;
  }

  void display(boolean print_val) {
    
    color interA;
    
    
    interA = cyclicHSVColor(0);
   
    
    fill(0);
    stroke(interA);
    strokeWeight(3);
    
    float[] displaces= displace_from_center(centerX, centerY);
    
    
    
    float theta= displaces[2];
    float new_centerX = centerX+ displaces[0];
    float new_centerY = centerY+ displaces[1];
  
    
    
    ellipse(new_centerX, new_centerY, circleSize, circleSize);
    
    
  }
}
