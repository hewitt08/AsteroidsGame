class Bullet extends Floater{
  protected double myX, myY, myDir;
  protected int mySpeed;
  
  public Bullet(Spaceship ship){
    myX = ship.getCenterX();
    myY = ship.getCenterY();
    myDir = ship.getDir();
    accelerate(2);
    mySpeed = 20;
  }//constructor end
  
  public Bullet(){
    
  }
  
  public void show(){
    noStroke();
    fill(0,255,0);
    ellipse((float)myX,(float)myY,8,8);
  }//show end
  
  public void fire(){//I'm not using the floater's "move" to avoid having the bullets wrap around the screen
    double mRadians = myDir*(Math.PI/180);
    myX += Math.cos(mRadians)*mySpeed;
    myY += Math.sin(mRadians)*mySpeed;
  }//fire end
  
}//class end
