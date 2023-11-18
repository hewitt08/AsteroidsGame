class Star //note that this class does NOT extend Floater
{
  private int myX;
  private int myY;
  private int size;
  
  Star(int x, int y){
    myX = x;
    myY = y;
    size = (int)(Math.random()*5)+1;
  }
  
  public void show(){
    fill(255,255,255);
    noStroke();
    rect(myX-(size/2), myY-(size/2),size,size);//center
    triangle(myX-(size/2), myY-(size/2), myX, myY-(size+size/3), myX+(size/2), myY-(size/2));//top triangle
    triangle(myX+(size/2), myY-(size/2), myX+size+size/3, myY, myX+(size/2), myY+(size/2));//right triangle
    triangle(myX-(size/2), myY+(size/2), myX, myY+size+size/3, myX+(size/2), myY+(size/2));//bottom triangle
    triangle(myX-(size/2), myY-(size/2), myX-(size+size/3), myY, myX-(size/2), myY+(size/2));//left triangle
  }
}

