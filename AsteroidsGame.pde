Spaceship enterprise;
Star[] stars;
SpeedBar speed;
HealthBar health;
ArrayList <Asteroid> roids;
ArrayList <Bullet> bullets;
ArrayList <Rocket> rockets;

public boolean accelerateB = false;
public boolean dTurn = false;
public boolean aTurn = false;
public boolean game = true;
public boolean control = true;
public boolean fired = false;
public int controlCount = 0;
public int startingRoids = 20;
public int waveSize = startingRoids;
public int wave = 1;
public int ammoB = 200;
public int ammoR = 3;
public boolean firedR = false;
public int rechargeR = 0;

public void setup(){
  size(100,100);
    
  enterprise = new Spaceship();
  
  roids = new ArrayList <Asteroid>();
  for(int i = 0; i < startingRoids; i++){roids.add(new Asteroid());}//adds asteroids
    
  bullets = new ArrayList <Bullet>();
  rockets = new ArrayList <Rocket>();
  
  stars = new Star[80];
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star((int)(Math.random()*width), (int)(Math.random()*height));
  }//stars loop end
  
  speed = new SpeedBar(20, 20, 0,100,30);
  health = new HealthBar(20, 50, 0,100,0);
}//setup end

public void draw(){
  background(0,0,0);
  if(game==true){
  
  for(int i = 0; i < stars.length; i++){
    stars[i].show();
  }//stars show loop end
  
  if(control==true){
  if(accelerateB == true){
    enterprise.accelerate(0.5);
  }
  if(aTurn == true){
    enterprise.turn(-10);
  }
  if(dTurn == true){
    enterprise.turn(10);
  }
  }else{//control check end
    enterprise.turn(-2);
    controlCount++;
  }//no control end
  
  if(controlCount>200){
    control=true;
  }//controlCount check end
  
  if(fired==true){
    if(control==true){
      if(ammoB>0){
        bullets.add(new Bullet(enterprise));
        ammoB--;
      }//ammo check end
    }//firing bullets end and subtract ammo
  }else{//fired check end
    if(ammoB<200){ammoB++;}
  }//fire/recharge end
  
  for(int i = 0; i < roids.size(); i++){
    roids.get(i).show();
    roids.get(i).move();
  }//roids for loop end move and show
  
  for(int i = 0; i < bullets.size(); i++){
    if(control==true){
      bullets.get(i).show();
      bullets.get(i).fire();
    }//control check end
  }//bullets for loop end fire and show
  
  for(int i = 0; i < rockets.size(); i++){
    if(control==true){
      rockets.get(i).show();
      rockets.get(i).fire();
      rockets.get(i).incrementCount();
      if(rockets.get(i).myCounter>140){
        rockets.remove(i);
        i--;
      }
    }//control check end
  }//rockets for loop end fire and show
  
  for(int i = 0; i < bullets.size(); i++){
    if(bullets.get(i).myX > width){
      bullets.remove(i);
      break;
      }
      else if (bullets.get(i).myX < 0){
        bullets.remove(i);
        break;
      }
      if (bullets.get(i).myY > height){
        bullets.remove(i);
        break;
      }
      else if (bullets.get(i).myX < 0){
        bullets.remove(i);
        break;
      }
  }//bullets for loop end fire and show
  
  for(int i = 0; i < roids.size(); i++){
    if(dist((float)roids.get(i).myCenterX, (float)roids.get(i).myCenterY, (float)enterprise.myCenterX, (float)enterprise.myCenterY)<20){
      roids.remove(i);
      health.setHealth(health.getHealth()-8);
      i--;
    }//distance check end
  }//roids for loop end distance check
  
  for(int i = 0; i < bullets.size(); i++){
    for(int j = 0; j < roids.size(); j++){
      if(dist((float)bullets.get(i).myX, (float)bullets.get(i).myY, (float)roids.get(j).myCenterX, (float)roids.get(j).myCenterY)<20){
        roids.remove(j);
        bullets.remove(i);
        break;
      }//distance check end
    }//roids for loop end
  }//bullets for loop end
  
  for(int i = 0; i < rockets.size(); i++){
    for(int j = 0; j < roids.size(); j++){
      if(dist((float)rockets.get(i).myX, (float)rockets.get(i).myY, (float)roids.get(j).myCenterX, (float)roids.get(j).myCenterY)<rockets.get(i).mySize-80){
        roids.remove(j);
        break;
      }//distance check end
    }//roids for loop end
  }//rockets for loop end
  
  enterprise.show();
  enterprise.move();
  
  speed.setSpeedBar();
  speed.show();
  speed.overheat();
  
  health.gameOver();
  health.show();
  
  newWave();
  
  rechargeR++;
  if(rechargeR>300){
    ammoR++;
    rechargeR = 0;
  }//recharge end
  
  }else{//game on end
    fill(255,255,255);
    textSize(80);
    text("GAME OVER", width/2-230,height/2-80);
  }//game over else end
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
    if(key==' '){
      fired = true;
    }
    if(key == 'r'){
      fireRocket();
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
  if(key==' '){
    fired = false;
  }
}

public void gameOver(){
  game = false;
}

public void newWave(){
  if(roids.size()==0){
    wave++;
    waveSize = waveSize*2;
    for(int i = 0; i < waveSize; i++){roids.add(new Asteroid());}
  }
}//new wave end

public void fireRocket(){
  if(control==true){
      if(ammoR>0){
        rockets.add(new Rocket(enterprise));
        ammoR--;
      }
  }
}//fireRocket end
