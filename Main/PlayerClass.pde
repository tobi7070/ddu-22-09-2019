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
  
  void attack() {
    direction = new PVector(cos(angle) * magnitude, sin(angle) * magnitude);
    if (isAttacking == true) {
       bs.addBullet(location, direction, damage, "P");
    }
  }
  
  void checkEdges() {
    if ((location.x > width - size.x) || (location.x < 0 + size.x)) {
      angle = angle + PI/2;
    }
    if ((location.y > height - size.y) || (location.y < 0 + size.y)) {
      angle = angle + PI/2;
    }
  }
  
  void update() {
    checkEdges();
    attack();
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
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    stroke(0);
    fill(100);
    rect(0, 0, size.x, size.y); 
    popMatrix(); 
    rectMode(CORNER);
    // Health
    noStroke();
    fill(10, 230, 105, 200);
    rect(location.x - 8, location.y - 16, lifespan/200 * 16, 4);
    stroke(0);
    noFill();
    rect(location.x - 8, location.y - 16, 16, 4);
  }
  
  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
}
