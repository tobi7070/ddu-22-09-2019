class Player {

  float a = 0.0;
  float aspeed = 0.1;
  float speed = 2;
  boolean forward = false;
  boolean backward = false;
  boolean left = false;
  boolean right = false;
  boolean isAttacking = false;
  PVector velocity = new PVector(0, 0);
  
  PVector location, size, direction;
  float lifespan, damage, magnitude;
  
  Player(PVector l) {
    velocity = new PVector(0, 0);
    location = l.get();
    size = new PVector(16, 16);
    lifespan = 200;
    damage = 10;
    magnitude = 2;
  }
  
  void run() {
    update();
    // If player exists display
    if (isDead() == false) {
      display();
    }
  }
  
  void turnangle() {
    if (left == true ) {
      a = a - aspeed;
    }
    if (right == true) {
      a = a + aspeed;
    }
    if (a > 2*PI) {
      a = 0;
    }
    if (a < (2*PI)* -1) {
      a = 0;
    }
  }
  
  /*
  void attack() {
    direction = new PVector(-1 * cos(a) * magnitude, -1 * sin(a) * magnitude);
    if (isAttacking == true && frameCount % 30 == 0) {
         // bs.addBullet(location, direction, damage, "P");
    }
  }
  */
  
  void update() {
    turnangle();
    if (forward) {
      velocity.set(speed, 0);
      velocity.rotate(a);
      location.add(velocity);
    }
    if (backward) {
      velocity.set(-speed, 0);
      velocity.rotate(a);
      location.add(velocity);
    }
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    println(a);
    rectMode(CENTER);
    fill(100);
    rotate(a);
    rect(0, 0, 30, 20);
    popMatrix(); 
  }
  
  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
}
