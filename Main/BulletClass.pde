class Bullet {
  PVector location, velocity, size;
  float lifespan;
  String type;
  
  Bullet(PVector l, PVector v) {
    velocity = v.get();
    location = l.get();
    lifespan = 255.0;
    size = new PVector(8, 8);
  }
  
  void run() {
    checkEdges();
    update();
    display();
  }
  
  void checkEdges() {
    if ((location.x > width - size.x) || (location.x < 0)) {
      lifespan = 0;
    }
    if ((location.y > height - size.y) || (location.y < 0)) {
      lifespan = 0;
    }
  }
  
  void update() {
    location.add(velocity);
    lifespan -= 2.0;
  }
  
  void display() {
    noStroke();
    fill(0, lifespan);
    ellipse(location.x, location.y, size.x, size.y);
  }
  
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}
