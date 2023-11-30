Spaceship enterprise;
Star[] stars;
SpeedBar speed;
ArrayList <Asteroid> roids;

boolean accelerateB = false;
boolean dTurn = false;
boolean aTurn = false;
boolean game = true;
boolean control = true;
int controlCount = 0;

public void setup(){
  enterprise = new Spaceship();
  speed = new SpeedBar(20, 20, 0,100,30);
  
  roids = new ArrayList <Asteroid> ();
  for(int i = 0; i < 10; i++)
    roids.add(new Asteroid());
  
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
  if(accelerateB == true){
    enterprise.accelerate(0.5);
  }
  if(aTurn == true){
    enterprise.turn(10);
  }
  if(dTurn == true){
    enterprise.turn(-10);
  }
  }else{//control check end
    enterprise.turn(-2);
    controlCount++;
  }//no control end
  
  if(controlCount>200){
    control=true;
  }//controlCount check end
  
  for(int i = 0; i < roids.size(); i++){
    roids.get(i).show();
    roids.get(i).move();
    
  }//roids for loop end move and show
  
  for(int i = 0; i < roids.size(); i++){
    if(dist((float)roids.get(i).myCenterX, (float)roids.get(i).myCenterY, (float)enterprise.myCenterX, (float)enterprise.myCenterY)<10){
      roids.remove(i);
    }//distance check end
  }//roids for loop end distance check
  
  }//game over check end
}

public void keyPressed(){
  if(control==true){
    if(key=='e'){
      enterprise.hyperspace();
    }
    if(key=='w'){
      accelerateB = true;
    }
    if(key=='a'){
      aTurn = true;
    }
    if(key=='d'){
      dTurn = true;
    }
  }//control check end
}

public void keyReleased(){
  if(key=='w'){
    accelerateB = false;
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
