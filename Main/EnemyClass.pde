class Enemy {
  PVector location, velocity, size, distance, direction;
  float lifespan, damage, range, angle, magnitude;
  
  Enemy(PVector l) {
    velocity = new PVector(random(-1,1),random(-1,1));
    location = l.get();
    lifespan = 255.0;
    damage = 10.0;
    range = 120;
    magnitude = 5;
    size = new PVector(8, 8);
  }
  
  void run() {
    attack(p.location);
    checkEdges();
    update();
    display();
  }
  
  void checkEdges() {
    if ((location.x > width - size.x) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height - size.y) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  }
  
  void attack(PVector p) {
    if (inRange(p)) {
      angle = atan2(distance.y, distance.x);
      direction = new PVector(-1 * cos(angle) * magnitude, -1 * sin(angle) * magnitude);
      println("Player in range!");
      if (frameCount % 45 == 0) {
          bs.addBullet(location, direction);
      }
    }
  }
  
  void update() {
    location.add(velocity);
  }
  
  void display() {
    noStroke();
    fill(0, lifespan);
    rect(location.x, location.y, size.x, size.y);
  }
  
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean inRange(PVector p) {
    distance = PVector.sub(location, p);
    if (distance.mag() < range) {
      return true;
    } else {
      return false;
    }
  }
}
