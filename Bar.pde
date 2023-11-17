class Bar{
  protected int myX, myY, myR, myG, myB;
  protected double myMeasure;
   
   public void show(){
     noStroke();
     fill(0,0,0);
     rect(myX, myY, 80, 20);
     fill(myR, myG, myB);
     rect(myX, myY, (int)myMeasure, 20);
   }
}
