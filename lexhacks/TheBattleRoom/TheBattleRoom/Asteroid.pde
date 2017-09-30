class Asteroid {
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0); 
  int numSpikes = (int) (10*Math.random());
  PVector[] displacements;
  
  void generateDisplacements() {
    println(numSpikes);
    for (int i = 0; i < 10; i++) {
      displacements[i] = PVector.random2D();
    }
  }
  
  void update(float dt) {
    pos.add(PVector.mult(vel, dt));
    vel.add(PVector.mult(acc, dt));
  }

  void show() {
    beginShape(POINTS);
      for (int i = 0; i < numSpikes;  i++) {
        vertex(pos.x + displacements[i].x, pos.y + displacements[i].y);
      }
    endShape();
  }

}