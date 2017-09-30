// The Battle Room

Ball ball;
Asteroid Asteroids[] = new Asteroid[10];
float dt = 1;
int bulletCap = 10;
Bullet[] bullets = new Bullet[bulletCap];

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
}

void draw() {
  background(255);
  ball.update(dt);
  ball.show();
  for (int i = 0; i < Asteroids.length; i++) {
    Asteroids[i].show();
  }
  for (int i = 0; i < bulletCap; i++) {
    bullets[i].update(dt);
    bullets[i].show();
  }
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