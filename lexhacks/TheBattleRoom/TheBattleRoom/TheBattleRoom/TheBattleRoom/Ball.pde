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
        ball.vel.y = 0;
      }
    }
    if (key=='s') {
      ball.vel.y = 1;
      if (pos.y + r > height + speed*dt) {
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