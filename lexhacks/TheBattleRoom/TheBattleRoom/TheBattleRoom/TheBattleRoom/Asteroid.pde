class Asteroid {
  PVector pos = new PVector((int)(Math.random()*width), (int)(Math.random()*height));
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0); 
  int numSpikes = (int)(10*(0.3+Math.random()));
  PVector displacements[] = new PVector[numSpikes];
  int avgRadius = (int)(4*(1+Math.random()));
  
  void generateDisplacements() {
    for (int i = 0; i < numSpikes; i++) {
      float th = (float)(2*Math.PI*i/numSpikes);
      int cr = (int)(avgRadius + 2*(10.3+Math.random()));
      int cx = (int)(cr*Math.cos(th));
      int cy = (int)(cr*Math.sin(th));
      displacements[i] = new PVector(cx, cy);
    }
  }
  
  void update(float dt) {
    pos.add(PVector.mult(vel, dt));
    vel.add(PVector.mult(acc, dt));
  }

  void show() {
    println(displacements.length);
    beginShape();
      for (int i = 0; i < numSpikes;  i++) {
        vertex(pos.x + displacements[i].x, pos.y + displacements[i].y);
      }
    endShape(CLOSE);
  }

}