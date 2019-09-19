class Player {
  PVector location, size;
  float lifespan;
  
  Player(PVector l) {
    location = l.get();
    size = new PVector(16, 16);
    lifespan = 200;
  }
  
  void run() {
    update();
    // If player exists display
    if (isDead() == false) {
      display();
    }
  }
  
  void update() {
  }
  
  void display() {
    noStroke();
    fill(175);
    ellipse(location.x,location.y, size.x, size.y);
  }
  
  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
}
