
float pts_x[]= new float[10000];
float pts_y[]= new float[10000];
float pts[][]= new float[10000][2];

void setup() {
  size(800, 800);
  background(255);
  
  for (int i = 0; i < pts_x.length; i++)
  {
    pts_x[i]= get_normal_pt(width/2, 100);
  }
  for (int i = 0; i < pts_y.length; i++)
  {
    pts_y[i]= get_normal_pt(height/2, 10);
  }
  
  for (int i = 0; i < pts.length; i++)
  {
    pts[i][0] = pts_x[i];
    pts[i][1] = pts_y[i];
  }

}


float get_normal_pt(float mean, float std)
{
  float pt = mean + randomGaussian() * std;
  return pt;
}

void draw() {
  // Generate a point from a normal distribution
  for (int i = 1; i < pts_x.length; i++)
    {
  
      pts_x[i-1]= pts_x[i];
      pts_y[i-1]= pts_y[i];
      pts[i-1]= pts[i];
    }
    
  pts_x[pts_x.length- 1]= get_normal_pt(width/2, 100);
  pts_y[pts_y.length- 1]= get_normal_pt(height/2, 10);
  pts[pts.length- 1][0]= pts_x[pts_x.length- 1];
  pts[pts.length- 1][1]= pts_y[pts_y.length- 1];
  
  background(255);
  
  for (int i = 0; i < pts_x.length; i++)
    {
      // Plot the points
      
      
      stroke(0);  // Set stroke color to black
      fill(255,0,0);  // Set fill color to light gray
      ellipse(pts_x[i], 20, 10, 10);  // Draw an ellipse at the generated x-coordinate
      
      fill(0,255,0);
      ellipse(10, pts_y[i], 10, 10);
      
      fill(0,0,255);
      ellipse(pts_x[i], pts_y[i], 10, 10);
  
    }
    
//delay(1000);
}
