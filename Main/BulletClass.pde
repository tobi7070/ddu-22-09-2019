class Bullet extends GameObject {
  PVector location;
  PVector velocity;
  float lifespan;
  
  Bullet(PVector l) {
    velocity = new PVector(random(-1,1), random(-1,1));
    location = l.get();
    lifespan = 255.0;
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    location.add(velocity);
    lifespan -= 2.0;
  }
  
  void display() {
    noStroke();
    fill(0, lifespan);
    ellipse(location.x, location.y, 8, 8);
  }
  
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}
