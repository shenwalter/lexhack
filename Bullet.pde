class Bullet {
  PVector pos = new PVector(-200, -100);
  PVector vel = new PVector(0, 0);
  int r = 10;
  int speed = 3;
  
  void show() {
    fill(0, 255, 0);
    ellipse(pos.x, pos.y, r, r);
  }
 
   void offScreenHandler() {
    if (pos.x - r < 0) {
      vel.x = 0;
    }
    if (pos.x + r > width) {
      vel.x = 0;
    }    
    if (pos.y + r < 0) {
      vel.y = 0;
    }
    if (pos.y - r > height) {
      vel.y = 0;
    }
  }
 
  void update(float dt) {
    offScreenHandler();
    pos.add(PVector.mult(vel, dt*speed));
  }
  
}