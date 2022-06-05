// example Written by Casel Reas and Ben Fry 

int numBalls = 12;
float spring = 0.05;
float gravity = 0.03;

Ball[]  balls = new Ball[numBalls];

void setup(){
   size(displayWidth, displayHeight);;
   noStroke();
   smooth();
   
   for(int i=0; i<numBalls; i++)
     {
       balls[0] = new Ball(random(width), random(height), 
       random(displayWidth/20, displayWidth/6), i, balls);
     }
}

void draw(){
     background(0);
     for(int i=0; i < numBalls; i++)
     {
       balls[i].collide();
       
       balls[i].move();
       
       balls[i].display();
     }
}
