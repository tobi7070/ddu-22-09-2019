class Player {

  boolean forward = false;
  boolean backward = false;
  boolean left = false;
  boolean right = false;
  boolean isAttacking = false;
  
  PVector location, velocity, size, direction;
  float lifespan, damage, magnitude, angle, angleVel, vel;
  
  Player(PVector l) {
    velocity = new PVector(0, 0);
    location = l.get();
    size = new PVector(16, 16);
    lifespan = 200;
    damage = 10;
    magnitude = 2;
    angle = 0.0;
    angleVel = 0.1;
    vel = 2;
  }
  
  void run() {
    update();
    if (isDead() == false) {
      display();
    }
  }
  
  void turnangle() {
    if (left == true ) {
      angle = angle - angleVel;
    }
    if (right == true) {
      angle = angle + angleVel;
    }
    if (angle > 2*PI) {
      angle = 0;
    }
    if (angle < (2*PI)* -1) {
      angle = 0;
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
      velocity.set(+ vel, 0);
      velocity.rotate(angle);
      location.add(velocity);
    }
    if (backward) {
      velocity.set(- vel, 0);
      velocity.rotate(angle);
      location.add(velocity);
    }
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    println(angle);
    rectMode(CENTER);
    fill(100);
    rotate(angle);
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
