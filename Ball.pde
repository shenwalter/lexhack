class Ball {
  int r = 10;
  PVector pos = new PVector(width/2-2*r, height/2);
  PVector vel = new PVector(0, 0);
  int speed = 3;
  
  void show() {
    fill(255, 255, 25);
    ellipse(pos.x, pos.y, 2*r, 2*r);
  }
  
  void keyReaction(float dt) {
    if (key=='w') {
      vel.y = -1;
      if (pos.y + r + speed*dt < 0) {
        pos.y = height + r + speed*dt;
      }
    }
    else if (key=='s') {
      vel.y = 1;
      if (pos.y - r - speed*dt > height) {
        pos.y = -r - speed*dt;
      }
    }
    if (key=='a') {
      vel.x = -1;
      if (pos.x + r + speed*dt < 0) {
        pos.x = width + r + speed*dt;
      }
    }
    else if (key=='d') {
      vel.x = 1;
      if (pos.x - r - dt*speed > width) {
        pos.x = -r - speed*dt;
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