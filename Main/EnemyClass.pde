class Enemy {
  PVector location;
  PVector velocity;
  float lifespan;
  float damage;
  
  boolean temp = true;
  
  Enemy(PVector l) {
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
    damage = 10.0;
  }
  
  void run() {
    checkEdges();
    update();
    display();
  }
  
  void checkEdges() {
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  }
  
  void update() {
    location.add(velocity);
  }
  
  void display() {
    noStroke();
    fill(0, lifespan);
    rect(location.x, location.y, 8, 8);
  }
  
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean isVisible() {
    if (temp == true) {
      return true;
    } else {
      return false;
    }
  }
}
