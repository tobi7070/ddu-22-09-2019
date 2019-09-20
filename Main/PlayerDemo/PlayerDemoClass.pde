class player {

  float a = 0.0;
  boolean forward = false;
  boolean backward = false;
  boolean left = false;
  boolean right = false;
  PVector movement = new PVector();
  PVector location = new PVector(width/2, height/2);


  void turnangle() {
    if (left == true ) {
      a = a -0.2;
    }
    if (right == true) {
      a = a + 0.2;
    }
    if (a > 2*PI) {
      a = 0;
    }
    if (a < (2*PI)* -1) {
      a = 0;
    }
  }

  void display() {
    if (forward) {
      movement.set(5, 0);
      movement.rotate(a);
      location.add(movement);
    }
    if (backward) {
      movement.set(-5, 0);
      movement.rotate(a);
      location.add(movement);
    }
    translate(location.x, location.y);
    println(a);
    rectMode(CENTER);
    fill(100);
    rotate(a);
    rect(0, 0, 30, 20);
  }
}
