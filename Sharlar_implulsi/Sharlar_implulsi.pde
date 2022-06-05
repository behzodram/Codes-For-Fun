
  int stol_height = 450;
  
float v1 = 0.5;
float v2 = 7.7;
float tempV;

float d1 = 170;
float d2 = 70;


Shar m1 = new Shar(d1, v1, 0, d1/2);
Shar m2 = new Shar(d2, v2, 0, 1600-d2/2);

void setup(){
   
   size(1600, 600);
   noStroke();
   smooth();
   textSize(96);
}

void draw(){
  
  background(0);
  fill(200, 30, 20);
  m1.draw();
 
  fill(30, 200, 70);
  m2.draw();
  
  text("C++", m1.xPos - 100, stol_height-m1.D-20);
  text("Python", m2.xPos - 200, stol_height-m2.D-20);
  if(abs((int)(m1.xPos + m1.D/2) - (int)(m2.xPos - m2.D/2)) <= 3)
  {
     tempV = m1.vx;
     m1.vx = m2.vx;
     m2.vx = tempV; //-m2.vx;
     println("m1v " + m1.vx + "  m2v " + m2.vx);
  }
}
