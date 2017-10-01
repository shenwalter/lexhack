class Bullet {
   PVector pos = new PVector(-200, -100);
   PVector vel = new PVector(0, 0);
   int r = 10;
   float speed = 0.5;
  
  
   void show(color co) {
     fill(co);
     ellipse(pos.x, pos.y, r, r);
   }
   
   void offScreenHandler() {
    if (pos.x - r < 0) {
      vel.x = 0;
      pos.x = -width;
    }
    if (pos.x + r > width) {
      vel.x = 0;
      pos.x = 2*width;
    }    
    if (pos.y + r < 0) {
      vel.y = 0;
      pos.y = -height;
    }
    if (pos.y - r > height) {
      vel.y = 2*height;
    }
  }
 
  void update(float dt) {
    offScreenHandler();
    pos.add(PVector.mult(vel, dt*speed));
  }
  
}