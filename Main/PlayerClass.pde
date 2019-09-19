<<<<<<< HEAD
class Player {
=======
class Player extends GameObject {
>>>>>>> 577b7f2d5ffae71e919b1ef013d48cb9ed2dc3dc
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
