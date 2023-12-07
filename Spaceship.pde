class Spaceship extends Floater  
{   
    public Spaceship(){
      corners = 4;  //the number of corners, a triangular floater has 3
      
      xCorners = new int[corners];
      xCorners[0] = 10;
      xCorners[1] = -10;
      xCorners[2] = -5;
      xCorners[3] = -10;
      
      yCorners = new int[corners];
      yCorners[0] = 0;
      yCorners[1] = -10;
      yCorners[2] = 0;
      yCorners[3] = 10;
      
      myColor = color(255,0,0);
      myCenterX = width/2;
      myCenterY = height/2;
      myXspeed = myYspeed = 0; //holds the speed of travel in the x and y directions   
      myPointDirection = 0; //holds current direction the ship is pointing in degrees    
    }
    
    public void hyperspace(){
      myCenterX = (int)(Math.random()*width);
      myCenterY = (int)(Math.random()*height);
      myPointDirection = (int)(Math.random()*360);
      myXspeed = myYspeed = 0;
    }
    
    public double getXspeed(){
      return myXspeed;
    }
    
    public double getYspeed(){
      return myYspeed;
    }
    
    public double getCenterY(){
      return myCenterY;
    }
    
    public double getCenterX(){
      return myCenterX;
    }
    
    public void setXspeed(int x){
      myXspeed = x;
    }
    
    public void setYspeed(int y){
      myYspeed = y;
    }
    
    public double getDir(){
      return myPointDirection;
    }
}
