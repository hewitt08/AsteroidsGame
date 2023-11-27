class Bar{
  protected int myX, myY, myR, myG, myB;
  protected double myMeasure;
   
  public void show(){
     stroke(255);
     fill(0,0,0);
     rect(myX-1, myY-1, 100, 21);
     noStroke();
     fill(myR, myG, myB);
     rect(myX, myY, (int)myMeasure, 20);
   }
}
