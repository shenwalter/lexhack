class Ball {
  PVector pos = new PVector(width/2, height/2);
  PVector vel = new PVector(0, 0);
  int r = 10;
  int speed = 3;
  
  void show() {
    ellipse(pos.x, pos.y, 2*r, 2*r);
  }
  
  void keyReaction(float dt) {
    if (key=='w') {
      vel.y = -1;
      if (pos.y - r - speed*dt < 0) {
        vel.y = 0;
      }
    }
    else if (key=='s') {
      vel.y = 1;
      if (pos.y + r > height + speed*dt) {
        vel.y = 0;
      }
    }
    if (key=='a') {
      vel.x = -1;
      if (pos.x - r < -speed*dt) {
        vel.x = 0;
      }
    }
    else if (key=='d') {
      vel.x = 1;
      if (pos.x + r + dt*speed > width) {
        vel.x = 0;
      } 
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