
Ball bob = new Ball();
float dt = 1;

void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  if (keyPressed) {
    if (key=='a') {
      bob.xon = true;
    }
    if (key=='b') {
      bob.yon = true;
    }
  }
  bob.update(dt);
  bob.draw();
}

void keyTyped() {
  println(key);
}

void keyReleased() {
  if (key=='a' || key=='b') {
    bob.xon = false;
    bob.yon = false;
  }
}