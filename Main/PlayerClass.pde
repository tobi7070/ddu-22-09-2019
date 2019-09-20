class Player {
  PVector location, size;
  float lifespan, damage;
  
  Player(PVector l) {
    location = l.get();
    size = new PVector(16, 16);
    lifespan = 200;
    damage = 10;
  }
  
  void run() {
    update();
    // If player exists display
    if (isDead() == false) {
      display();
    }
  }
  
  void attack() {
    // bs.addBullet(location, direction, damage, "P");
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
