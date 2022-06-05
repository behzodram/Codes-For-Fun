
int numSec = 36;
int ht = 1000;
void show(int D, int sec, Ball[] b) {
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
void setup()
{
  size (1000, 1000);
  smooth();
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

void draw() {

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
