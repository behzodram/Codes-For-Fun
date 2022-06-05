// Example Written by Casey Reas and Ben Fry

int numBalls = 32;
float spring = 0.5;
float gravity = 0.03;

Ball[] balls = new Ball[numBalls];


void setup() 
{
  size(displayWidth, displayHeight);
  noStroke();
  smooth();

  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), 1.5*random(displayWidth/20, displayWidth/6), i, balls);
  }
}


void draw() 
{
  background(0);

  for (int i = 0; i < numBalls; i++) 
  {
    balls[i].collide();

    balls[i].move();

    balls[i].display();  
  }
}
