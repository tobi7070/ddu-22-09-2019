class EasyEnemy extends Enemy {

  EasyEnemy(PVector l) {
    super(l);
    damage = 5;
  }

  void display() {
    fill(0, lifespan);
    stroke(0, lifespan);
    rect(location.x, location.y, size.x, size.y);
  }
}

class NormalEnemy extends Enemy {

  NormalEnemy(PVector l) {
    super(l);
    damage = 10;
  }

  void display() {
    fill(0, lifespan);
    stroke(0, lifespan);
    rect(location.x, location.y, size.x, size.y);
  }
}

class HardEnemy extends Enemy {

  HardEnemy(PVector l) {
    super(l);
    damage = 15;
  }

  void display() {
    fill(0, lifespan);
    stroke(0, lifespan);
    rect(location.x, location.y, size.x, size.y);
  }
}
