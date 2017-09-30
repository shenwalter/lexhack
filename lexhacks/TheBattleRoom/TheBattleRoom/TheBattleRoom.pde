// The Battle Room

Ball ball;
Asteroid Asteroids[];
float dt = 1;

void setup() {
  size(640, 360);
  ball = new Ball();
}

void draw() {
  background(255);
  ball.update(dt);
  ball.draw();
}

void keyTyped() {
  ball.keyReaction();
}

void keyReleased() {
  if (key=='a' || key=='w' || key=='s' || key=='d') {
    ball.vel.x = 0;
    ball.vel.y = 0;
  }
}