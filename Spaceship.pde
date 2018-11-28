class Spaceship extends Floater
{
    //spaceship constructor:   
  public Spaceship() {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -10;
    yCorners[0] = 10;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -10;
    yCorners[2] = -10;
    xCorners[3] = -3;
    yCorners[3] = 0;
    myColor = color(255,255,255);
    myCenterX = myCenterY = 375;
    myDirectionX = myDirectionY = 0;
    myPointDirection = 0;
  }

    //accessors/mutators:
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY (int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX (double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY (double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection (int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public void accelerate (double accAmount)
  {
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX += ((accAmount)*Math.cos(dRadians));
    myDirectionY += ((accAmount)*Math.sin(dRadians));
  }
  public void show ()  //Copied from floater class to add rockets onto spaceship
    {             
      fill(myColor);   
      stroke(myColor);    
      
      //translate the (x,y) center of the ship to the correct position
      translate((float)myCenterX, (float)myCenterY);

      //convert degrees to radians for rotate()     
      float dRadians = (float)(myPointDirection*(Math.PI/180));
      
      //rotate so that the polygon will be drawn in the correct direction
      rotate(dRadians);
      
      //draw the polygon
      beginShape();
      for (int nI = 0; nI < corners; nI++)
      {
        vertex(xCorners[nI], yCorners[nI]);
      }
      endShape(CLOSE);

      if (key == 'w' || key == 's')
      {
        stroke(204,136,0);
        strokeWeight(3);
        line(-18,-4,-10,-4);
        line(-18,4,-10,4);
        strokeWeight(0);
      }
      //"unrotate" and "untranslate" in reverse order
      rotate(-1*dRadians);
      translate(-1*(float)myCenterX, -1*(float)myCenterY);
    }
}
