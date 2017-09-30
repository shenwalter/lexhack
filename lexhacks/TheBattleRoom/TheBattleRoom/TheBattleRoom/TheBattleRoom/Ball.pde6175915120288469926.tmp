class Ball {
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  int r = 10;
  int speed = 3;
  
  void draw() {
    ellipse(pos.x, pos.y, r, r);
  }
  
  void keyReaction() {
    if (key=='a') {
      vel.x = -1;
      if (pos.x + r < 0) {
        vel.x = 0;
      }
    }
    if (key=='d') {
      vel.x = 1;
      if (pos.x - r > width) {
        vel.x = 0;
      } 
    }
    if (key=='w') {
      ball.vel.y = -1;
      if (pos.y + r < 0) {
        ball.vel.y = 0;
      }
    }
    if (key=='s') {
      ball.vel.y = 1;
      if (pos.y - r > height) {
        ball.vel.y = 0;
      }
    }
    if (key=='e') {
      exit();
    }
    if (key=='f') {
      ball.speed = 10;
    }
    if (key=='l') {
      ball.speed = 3;
    }
  }
  
  void update(float dt) {
    pos.add(PVector.mult(vel, dt*speed));
  }
  
}