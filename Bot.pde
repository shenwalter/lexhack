class Bot {
  int r = 10;
  PVector pos = new PVector(width/2+2*r, height/2);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  int speed = 3;
  int shootCt = 0;
  
  void repelAsteroids(PVector[] asteroidPoses) {
    PVector suggestedAcc = new PVector(0, 0);
    for (int i = 0; i < asteroidPoses.length; i++) {
      PVector diff = PVector.sub(pos, asteroidPoses[i]);
      if (diff.mag() < 30*r) {
        suggestedAcc.add(diff);
      }
    }
    acc = suggestedAcc.setMag(1);
  }
  
  void show() {
    fill(0, 0, 0);
    ellipse(pos.x, pos.y, 2*r, 2*r);
  }
  
  void update(float dt) {
    pos.add(PVector.mult(vel, dt*speed));
    vel.add(PVector.mult(acc, dt));
    vel.limit(speed);
    if (pos.y + r + speed*dt < 0) {
      pos.y = height + r + speed*dt;
    }
    if (pos.y - r - speed*dt > height) {
      pos.y = -r - speed*dt;
    }
    if (pos.x + r + speed*dt < 0) {
      pos.x = width + r + speed*dt;
    }
    if (pos.x - r - dt*speed > width) {
      pos.x = -r - speed*dt;
    } 
  }
  
  void shot() {
    if(shootCt == 100) {
      shootCt = 0;
      shoot(pos);
    }
    shootCt += 1;
  }
  
}