// The Battle Room
Ball ball;
Bot bot;
int numAsteroids = 20;
Asteroid asteroids[] = new Asteroid[numAsteroids];
float dt = 1.0;
int bulletCap = 10;
Bullet[] bullets = new Bullet[bulletCap];
Bullet[] enemyBullets = new Bullet[bulletCap];
char[] moveChars = {'a', 'w', 's', 'd'};

boolean buttonPressed;
int buttonX, buttonY, buttonW, buttonH;

boolean dead;
boolean win;
boolean invincible;

void setup() {
  size(1400, 1000);
  ball = new Ball();
  bot = new Bot();
  for (int i = 0; i < numAsteroids; i++) {
    asteroids[i] = new Asteroid();
    asteroids[i].generateDisplacements();
  }
  for (int i = 0; i < bulletCap; i++) {
    bullets[i] = new Bullet();
    enemyBullets[i] = new Bullet();
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
  if (buttonPressed && !dead && !win) {
    background(255);
    ball.update(dt);
    ball.show();
    
    PVector[] astPosses = new PVector[asteroids.length];
    for (int i = 0; i < asteroids.length; i++) {
      astPosses[i] = asteroids[i].pos;
    }
    bot.repelAsteroids(astPosses);
    
    bot.show();
    bot.update(dt);
    bot.shot();
    
    for (int i = 0; i < asteroids.length; i++) {
      asteroids[i].show();
      asteroids[i].update(dt);
      if (asteroids[i].collide(ball.pos) && !invincible) {
        dead = true;
      }
      if (asteroids[i].collide(bot.pos)) {
        win = true;
      }
      for (int j = 0; j < bulletCap; j++) {
        if (asteroids[i].collide(bullets[j].pos) || asteroids[i].collide(enemyBullets[j].pos)) {
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
      bullets[i].show(color(255, 0, 0));
      enemyBullets[i].update(dt);
      enemyBullets[i].show(color(0, 25, 25));
    }
  }
  else if (!buttonPressed && !dead && !win){
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
  
  else if (win) {
    // Show the button
    fill(255);
    rect(buttonX, buttonY, buttonW, buttonH);
    fill(0);
    text("WIN", buttonX+10, buttonY+buttonH-10);
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
      shoot(ball.pos);
  }
  
  else if (key=='r') {
    restart();
  }
  
  else if (key == 'e') {
    exit();
  }
  
  else if (key == 'i') {
    invincible = true;
  }
  
  else if (key == 'v') {
    invincible = false;
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

void shoot(PVector pPos) {
  for (int i = 0; i< bulletCap; i++){
    if (bullets[i].vel.x == 0) {
      bullets[i].pos.x = (int)(pPos.x);
      bullets[i].pos.y = (int)(pPos.y);
      PVector m = new PVector(mouseX, mouseY);
      bullets[i].vel = PVector.sub(m, bullets[i].pos).setMag(15);
      break;
    }
  }
}

void restart() {
  ball = new Ball();
  bot = new Bot();
  for (int i = 0; i < numAsteroids; i++) {
    asteroids[i] = new Asteroid();
    asteroids[i].generateDisplacements();
  }
  for (int i = 0; i< bulletCap; i++) {
    bullets[i] = new Bullet();
  } 
  dead = false;
  win = false;
}

void mouseReleased() {
  shoot(ball.pos);
}