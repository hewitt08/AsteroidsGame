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
       controlCount = 0;
       enterprise.hyperspace();
       enterprise.setXspeed((int)(Math.random()*2));
       enterprise.setYspeed((int)(Math.random()*2));
     }
   }
   
   public void setSpeedBar(){
     if(enterprise.getXspeed()>enterprise.getYspeed()){
       myMeasure = Math.abs((float)enterprise.getXspeed());
     }else{
       myMeasure = Math.abs((float)enterprise.getYspeed());
     }
     
     myR = (int)myMeasure*5;
     myG = 800/(int)(myMeasure+1);
   }
}
