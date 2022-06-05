
class Ball 
{
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;

  Ball(float xin, float yin, float din, int idin, Ball[] oin) 
  {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 

  void collide() 
  {

    for (int i = id + 1; i < numBalls; i++) 
    {

      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;

      if (distance < minDist) 
      { 

        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;

        vx -= ax;
        vy -= ay;

        others[i].vx += ax;
        others[i].vy += ay;
      }
    }   
  }

  

  void move()
  {
    vy += gravity;
    x += vx;
    y += vy;

    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= -0.9; 
    }

    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= -0.9;
    }

    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= -0.9; 
    } 

    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= -0.9;
    }

  }

  void aylana(int a, int b, int r, int arg1, int arg2){
    for(float i=(float)arg1*PI/180; i<=(float)arg2*PI/180; i+=0.01){
      int si = a + (int)(r*sin(i));
      int co = b + (int)(r*cos(i));
      point(si, co);
    }
     int si1 = a + (int)(r*sin((float)arg1*PI/180));
     int co1 = b + (int)(r*cos((float)arg1*PI/180));
     int si2 = a + (int)(r*sin((float)arg2*PI/180));
     int co2 = b + (int)(r*cos((float)arg2*PI/180));
    line(a, b,  si1, co1 );
    line(a, b, si2, co2);
              
}
  void display() 
  {
    stroke(0, 204, 200, 60);
    for(int i=-6; i<=6; i++)
    aylana((int)x, (int)y, (int)diameter/2, -6, i);
  }

}
