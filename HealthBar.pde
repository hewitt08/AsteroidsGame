class HealthBar extends Bar{
  public HealthBar(int x, int y, int r, int g, int b){
     myX = x;
     myY = y;
     myR = r;
     myG = g;
     myB = b;
     myMeasure = 99;
   }
   
   public void gameOver(){
     if(myMeasure<0){
       game = false;
     }
     myG = (int)(100-(100-myMeasure));
     myR = (int)(100-myMeasure)*2;
   }
   
   public void setHealth(double m){
     myMeasure = m;
   }
   
   public double getHealth(){
     return myMeasure;
   }
}
