// The Battle Room

Ball ball;
Asteroid Asteroids[] = new Asteroid[10];
float dt = 1;
int bulletCap = 10;
Bullet[] bullets = new Bullet[bulletCap];

boolean buttonPressed;
int buttonX, buttonY, buttonW, buttonH;

void setup() {
  size(640, 360);
  ball = new Ball();
  for (int i = 0; i < 10; i++) {
    Asteroids[i] = new Asteroid();
    Asteroids[i].generateDisplacements();
  }
  for (int i = 0; i< bulletCap; i++) {
    bullets[i] = new Bullet();
  }
  
  // Assume the button has not been pressed
  buttonPressed = false;
 
  // Some basic parameters for a button
  buttonW = 335;
  buttonH = 100;
  textSize(buttonH);
  buttonX = (width-buttonW)/2;
  buttonY = (height-buttonH)/2;
  
}

void draw() {
  background(255);  
  if (buttonPressed) {
      ball.update(dt);
      ball.show();
     for (int i = 0; i < Asteroids.length; i++) {
    Asteroids[i].show();
  }
  for (int i = 0; i < bulletCap; i++) {
    bullets[i].update(dt);
    bullets[i].show();
  }
    println("The button has been pressed");
  } else {
    // Show the button
    fill(255);
    rect(buttonX, buttonY, buttonW, buttonH);
    fill(0);
    text("START", buttonX+10, buttonY+buttonH-10);
  }
}

void mousePressed() {
  if (mouseX > buttonX && mouseX < buttonX+buttonW && mouseY > buttonY && mouseY < buttonY+buttonH)
    buttonPressed = true;
}

void keyTyped() {
  ball.keyReaction(dt);
}

void keyReleased() {
  if (key == ' ') {
      shoot();
  }
  if (key=='a' || key=='w' || key=='s' || key=='d') {
    ball.vel.x = 0;
    ball.vel.y = 0;
  }
}

void shoot() {
  for (int i = 0; i<10; i++){
    if (bullets[i].vel.x == 0) {
      bullets[i].pos.x = (int)ball.pos.x;
      bullets[i].pos.y = (int)ball.pos.y;
      PVector m = new PVector(mouseX, mouseY);
      bullets[i].vel = PVector.sub(m, bullets[i].pos).setMag(ball.speed/2);
      break;
    }
  }
}

class Asteroid {
  PVector pos = new PVector((int)(Math.random()*width), (int)(Math.random()*height));
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0); 
  int numSpikes = (int)(10*(0.3+Math.random()));
  PVector displacements[] = new PVector[numSpikes];
  int avgRadius = (int)(4*(1+Math.random()));
  
  void generateDisplacements() {
    for (int i = 0; i < numSpikes; i++) {
      float th = (float)(2*Math.PI*i/numSpikes);
      int cr = (int)(avgRadius + 2*(10.3+Math.random()));
      int cx = (int)(cr*Math.cos(th));
      int cy = (int)(cr*Math.sin(th));
      displacements[i] = new PVector(cx, cy);
    }
  }
  
  void update(float dt) {
    pos.add(PVector.mult(vel, dt));
    vel.add(PVector.mult(acc, dt));
  }

  void show() {
    println(displacements.length);
    beginShape();
      for (int i = 0; i < numSpikes;  i++) {
        vertex(pos.x + displacements[i].x, pos.y + displacements[i].y);
      }
    endShape(CLOSE);
  }

}

class Ball {
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  int r = 10;
  int speed = 3;
  
  void show() {
    ellipse(pos.x, pos.y, 2*r, 2*r);
  }
  
  void keyReaction(float dt) {
    if (key=='a') {
      vel.x = -1;
      if (pos.x - r < -speed*dt) {
        vel.x = 0;
      }
    }
    if (key=='d') {
      vel.x = 1;
      if (pos.x + r + dt*speed > width) {
        vel.x = 0;
      } 
    }
    if (key=='w') {
      ball.vel.y = -1;
      if (pos.y - r  - speed*dt < 0) {
        vel.y = 0;
      }
    }
    if (key=='s') {
      ball.vel.y = 1;
      if (pos.y + r > height + speed*dt) {
         vel.y = 0;
      }
    }
    if (key=='e') {
      exit();
    }
    if (key=='f') {
      speed = 10;
    }
    if (key=='l') {
      speed = 3;
    }
  }
  
  void update(float dt) {
    pos.add(PVector.mult(vel, dt*speed));
  }
  
}

class Bullet {
  PVector pos = new PVector(-200, -100);
  PVector vel = new PVector(0, 0);
  int r = 10;
  int speed = 3;
  
  void show() {
    ellipse(pos.x, pos.y, r, r);
  }
 
   void offScreenHandler() {
      if (pos.x + r < 0) {
        vel.x = 0;
      }
 
  
      if (pos.x - r > width) {
        vel.x = 0;
      } 
    
      if (pos.y + r < 0) {
        ball.vel.y = 0;
      
    }
      if (pos.y - r > height) {
        ball.vel.y = 0;
      }
    
   }
 
  void update(float dt) {
    offScreenHandler();
    pos.add(PVector.mult(vel, dt*speed));
  }
  
}
