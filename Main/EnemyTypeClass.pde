class EasyEnemy extends Enemy {

  EasyEnemy(PVector l, float f) {
    super(l);
    damage = 5 * f;
  }

  void display() {
    fill(170, lifespan);
    stroke(0, lifespan);
    rect(location.x, location.y, size.x, size.y);
  }
}

class NormalEnemy extends Enemy {

  NormalEnemy(PVector l, float f) {
    super(l);
    damage = 10 * f;
  }

  void display() {
    fill(85, lifespan);
    stroke(0, lifespan);
    rect(location.x, location.y, size.x, size.y);
  }
}

class HardEnemy extends Enemy {

  HardEnemy(PVector l, float f) {
    super(l);
    damage = 15 * f;
  }

  void display() {
    fill(0, lifespan);
    stroke(0, lifespan);
    rect(location.x, location.y, size.x, size.y);
  }
}
