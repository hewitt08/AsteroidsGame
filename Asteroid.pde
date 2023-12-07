class Asteroid extends Floater{
  private int rotSpeed;
  private boolean alive;
  
  
  public Asteroid(){
    rotSpeed = 3;
    alive = true;
    
    corners = 8;
    
    xCorners = new int[corners];
    xCorners[0] = 14;
    xCorners[1] = 9;
    xCorners[2] = 0;
    xCorners[3] = -9;
    xCorners[4] = -14;
    xCorners[5] = -9;
    xCorners[6] = 0;
    xCorners[7] = 9;
      
    yCorners = new int[corners];
    yCorners[0] = 0;
    yCorners[1] = 9;
    yCorners[2] = 6;
    yCorners[3] = 9;
    yCorners[4] = 0;
    yCorners[5] = -8;
    yCorners[6] = -12;
    yCorners[7] = -8;
    
    myColor = color(100,100,100);
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*height;
    myXspeed = Math.random()*2-1;
    myYspeed = Math.random()*2-1;
    myPointDirection = 0; //holds current direction the ship is pointing in degrees    
  }
  
  public void move(){
    turn(rotSpeed);
    
    super.move();
  }
  
  public double getCenterX(){
    return myCenterX;
  }
  
  public double getCenterY(){
    return myCenterY;
  }
}
