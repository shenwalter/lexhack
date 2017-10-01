class Asteroid {
  PVector pos = new PVector((int)(Math.random()*width), (int)(Math.random()*height));
  PVector vel = PVector.random2D();
  PVector acc = new PVector(0, 0); 
  int numSpikes = (int)(10*(0.3+Math.random()));
  PVector displacements[] = new PVector[numSpikes];
  int avgRadius = (int)(4*(1+Math.random()));
  float defaultRAdd = 10.3; 
  int maxRadius = (int)(avgRadius + 2*(defaultRAdd+1));
  
  void generateDisplacements() {
    for (int i = 0; i < numSpikes; i++) {
      float th = (float)(2*Math.PI*i/numSpikes);
      int cr = (int)(avgRadius + 2*(defaultRAdd+Math.random()));
      int cx = (int)(cr*Math.cos(th));
      int cy = (int)(cr*Math.sin(th));
      displacements[i] = new PVector(cx, cy);
    }
  }
  
  void update(float dt) {
    pos.add(PVector.mult(vel, dt));
    vel.add(PVector.mult(acc, dt));
    if (pos.x - maxRadius > width) {
       pos.x = -maxRadius;
    }
    if (pos.x + maxRadius < 0) {
       pos.x = width + maxRadius;
    }
    if (pos.y - maxRadius > height) {
       pos.y = -maxRadius;
    }
    if (pos.y + maxRadius < 0) {
       pos.y = height + maxRadius;
    }
  }

  

  void show() {
    fill(255);
    beginShape();
      for (int i = 0; i < numSpikes;  i++) {
        vertex(pos.x + displacements[i].x, pos.y + displacements[i].y);
      }
    endShape(CLOSE);
  }
  
  boolean collide(PVector otherPos) {
    return (PVector.sub(pos, otherPos)).mag() < maxRadius;
  }

}