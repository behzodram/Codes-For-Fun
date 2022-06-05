


class Shar {
  float D;
  float xPos;
  float vx;
  float ax;
  
  //float m;
  Shar( float d, float vx, float a, float pos)
  {
     //this.m = m;
     this.D = d;
     this.vx = vx;
     this.ax = a;
     this.xPos = pos;
  }

  void draw()
  {
    ellipse(xPos, stol_height - D/2, D, D);
    fill(40, 100, 255);
    rect(0, stol_height, width, stol_height);

    xPos += vx;
    vx += ax;
    if (xPos>width-D/2 || xPos<D/2)
    //if(xPos == xbang || xPos<D/2 || xPos>width-D/2)
    {
      vx =- vx;
    }
  }
}
