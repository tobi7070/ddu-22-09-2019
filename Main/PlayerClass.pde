class Player extends GameObject {
  PVector location;
  
  Player(PVector l) {
    location = l.get();
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
  }
  
  void display() {
    noStroke();
    fill(175);
    ellipse(location.x,location.y,16,16);
  }
}
