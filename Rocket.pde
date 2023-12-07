class Rocket extends Bullet{
  
  private int myCounter;
  private int mySize;
  private int myOpacity;
  
  public Rocket(Spaceship ship1){
    myX = ship1.getCenterX();
    myY = ship1.getCenterY();
    myDir = ship1.getDir();
    accelerate(8);
    myCounter = 0;
    mySize = 10;
    mySpeed = 3;
    myOpacity = 255;
  }//constructor end
  
  public void show(){
    if(myCounter<100){
      noStroke();
      fill(255,0,0);
      ellipse((float)myX,(float)myY,11,11);
    }else{
      noStroke();
      mySpeed = 0;
      fill(255,0,0, myOpacity);
      ellipse((float)myX, (float)myY, mySize, mySize);
      mySize += 5;
      myOpacity-=6;
    }
  }//show end
  
  public void incrementCount(){myCounter++;}
  
  public int getCount(){return myCounter;}
  public int getSize(){return mySize;}
  
}//class end
