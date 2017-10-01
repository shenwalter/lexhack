// The Battle Room

Ball ball;
int numAsteroids = 10;
Asteroid asteroids[] = new Asteroid[numAsteroids];
float dt = 1;
int bulletCap = 10;
Bullet[] bullets = new Bullet[bulletCap];
char[] moveChars = {'a', 'w', 's', 'd'};

boolean buttonPressed;
int buttonX, buttonY, buttonW, buttonH;

boolean dead;

void setup() {
  size(1400, 1000);
  ball = new Ball();
  for (int i = 0; i < numAsteroids; i++) {
    asteroids[i] = new Asteroid();
    asteroids[i].generateDisplacements();
  }
  for (int i = 0; i < bulletCap; i++) {
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
  if (buttonPressed && !dead) {
    background(255);
    ball.update(dt);
    ball.show();
    for (int i = 0; i < asteroids.length; i++) {
      asteroids[i].show();
      asteroids[i].update(dt);
      if (asteroids[i].collide(ball.pos)) {
        dead = true;
      }
      for (int j = 0; j < bulletCap; j++) {
        if (asteroids[i].collide(bullets[j].pos)) {
          println("asdf");
          asteroids[i] = new Asteroid();
          asteroids[i].generateDisplacements();
          asteroids[i].pos.x = -width*10;
          asteroids[i].vel.y = 0;
          asteroids[i].vel.x = 10;
        }
      }
    }
    for (int i = 0; i < bulletCap; i++) {
      bullets[i].update(dt);
      bullets[i].show();
    }
  }
  else if (!buttonPressed && !dead){
    // Show the button
    fill(255);
    rect(buttonX, buttonY, buttonW, buttonH);
    fill(0);
    text("START", buttonX+10, buttonY+buttonH-10);
  }
  
  else if (dead) {
    // Show the button
    fill(255);
    rect(buttonX, buttonY, buttonW, buttonH);
    fill(0);
    text("DEAD", buttonX+10, buttonY+buttonH-10);
  }
}

void mousePressed() {
  if (mouseX > buttonX && mouseX < buttonX+buttonW && mouseY > buttonY && mouseY < buttonY+buttonH) {
    buttonPressed = true;
  }
}

void keyTyped() {
  ball.keyReaction(dt);
}

void keyReleased() {
  if (key==' ') {
      shoot();
  }
  
  else if (key=='r') {
    restart();
  }
  
  else if (key == 'e') {
    exit();
  }
  
  else {
  
    boolean moveKeyReleased = false;
    
    char lowerKey = java.lang.Character.toLowerCase(key);
    for (int i = 0; i < moveChars.length; i++) {
      if (lowerKey == moveChars[i]) {
        moveKeyReleased = true;
      }
    }
    if (moveKeyReleased) {
      ball.vel.mult(0);
    }
  }
}

void shoot() {
  for (int i = 0; i< bulletCap; i++){
    if (bullets[i].vel.x == 0) {
      bullets[i].pos.x = (int)(ball.pos.x);
      bullets[i].pos.y = (int)(ball.pos.y);
      PVector m = new PVector(mouseX, mouseY);
      bullets[i].vel = PVector.sub(m, bullets[i].pos).setMag(15);
      break;
    }
  }
}

void restart() {
  ball = new Ball();
  for (int i = 0; i < numAsteroids; i++) {
    asteroids[i] = new Asteroid();
    asteroids[i].generateDisplacements();
  }
  for (int i = 0; i< bulletCap; i++) {
    bullets[i] = new Bullet();
  } 
  dead = false;
}