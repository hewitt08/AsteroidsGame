class SpeedBar extends Bar{
   SpeedBar(int x, int y, int r, int g, int b){
     myX = x;
     myY = y;
     myR = r;
     myG = g;
     myB = b;
     myMeasure = 0;
   }
   
   public void overheat(){
     if(myMeasure>100){
       control = false;
     }
   }
   
   public void setSpeedBar(){
     if(enterprise.getXspeed()>enterprise.getYspeed()){
       myMeasure = abs((float)enterprise.getXspeed());
     }else{
       myMeasure = abs((float)enterprise.getYspeed());
     }
     
     myR = (int)myMeasure*5;
     myG = 800/(int)(myMeasure+1);
     
     System.out.println(myMeasure);
   }
}
