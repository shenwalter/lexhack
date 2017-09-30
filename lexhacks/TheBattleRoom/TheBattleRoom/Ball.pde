class Ball {

  int x = 1;
  int y = 1;
  
  boolean xon = false;
  boolean yon = false;
  
  void draw() {
    ellipse(x, y, 10, 10);
  }
  
  void update(float dt) {
    if (xon) {
      x += dt;
    }
    if (yon) {
      y += dt;
    }    
  }
}