import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class aylana extends PApplet {


int numSec = 36;
int ht = 1000;
public void show(int D, int sec, Ball[] b) {
  float ase = 2 * PI / sec; 
  float f = 0;
  float s = ase;
  
  for(int i=0; i < sec; i++)
    {
       if(b[0].yPos <= (ht/2+3*sec) && b[0].yPos >= ht/2)
       {
       arc( b[i].xPos, b[i].yPos, D, D, f, s, PIE);
       b[i].xPos += b[i].xDir * cos( (f+s)/2 );
       b[i].yPos += b[i].xDir * sin( (f+s)/2 );
       f = s;
       s += ase;
       println(b[0].xPos + " " + b[0].yPos);
       }
       else 
       {
       arc( b[i].xPos, b[i].yPos, D, D, f, s, PIE);
       b[i].xPos -= b[i].xDir * cos( (f+s)/2 );
       b[i].yPos -= b[i].xDir * sin( (f+s)/2 );
       f = s;
       s += ase;
       println(b[0].xPos + " " + b[0].yPos);
       }
    }
  
}

Ball[] d = new Ball[numSec];
Ball[] c = new Ball[numSec];
public void setup()
{
  
  
  background(0);
  noStroke();
  fill(255, 100, 0, 200);
  
  for(int i=0; i < numSec; i++)
 {
  c[i] = new Ball();
  d[i] = new Ball();
 }
    
}

int keyNum;

public void draw() {

  background(0);
  show(ht/2, keyNum, c);
  
   if (keyPressed) {
     if(key != '1')
    keyNum = key - 48;
    for(int i=0; i < numSec; i++)
    {
    c[i].xPos = ht/2;
    c[i].yPos = ht/2;
    }
  }
  
  /// kasr yoziladigan joy
  //show(diameter, surat, maxraj, d);
  
  
}


class Ball
{
    
float xPos = ht/2;
float yPos = ht/2;

float xDir=0.25f;
float yDir=0.25f;
   
}
  public void settings() {  size (1000, 1000);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "aylana" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
