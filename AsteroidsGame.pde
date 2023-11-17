Spaceship enterprise;
Star[] stars;
SpeedBar speed;

boolean accelerate = false;
boolean dTurn = false;
boolean aTurn = false;
boolean game = true;
boolean control = true;

public void setup(){
  enterprise = new Spaceship();
  speed = new SpeedBar(20, 20, 0,100,30);
  size(500,500);
  stars = new Star[80];
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star((int)(Math.random()*500), (int)(Math.random()*500));
  }
}

public void draw(){
  background(0,0,0);
  if(game==true){
  
  for(int i = 0; i < stars.length; i++){
    stars[i].show();
  }
  
  speed.setSpeedBar();
  speed.show();
  speed.overheat();
  
  enterprise.show();
  enterprise.move();
  
  if(control==true){
  if(accelerate == true){
    enterprise.accelerate(0.5);
  }
  if(aTurn == true){
    enterprise.turn(10);
  }
  if(dTurn == true){
    enterprise.turn(-10);
  }
  }else{//control check end
  
  }//no control end
  }//game over check end
}

public void keyPressed(){
  if(key=='e'){
    enterprise.hyperspace();
  }
  if(key=='w'){
    accelerate = true;
  }
  if(key=='a'){
    aTurn = true;
  }
  if(key=='d'){
    dTurn = true;
  }
}

public void keyReleased(){
  if(key=='w'){
    accelerate = false;
  }
  if(key=='a'){
    aTurn = false;
  }
  if(key=='d'){
    dTurn = false;
  }
}

public void gameOver(){
  game = false;
}
