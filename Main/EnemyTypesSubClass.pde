class Type1 extends Enemy {

  Type1(PVector l) {
    super(l);
  }

  void display() {
    fill(0, lifespan);
    stroke(0, lifespan);
    rect(location.x, location.y,8,8);
  }
}

class Type2 extends Enemy {

  Type2(PVector l) {
    super(l);
  }

  void display() {
    fill(0, lifespan);
    stroke(0, lifespan);
    rect(location.x, location.y,8,8);
  }
}

class Type3 extends Enemy {

  Type3(PVector l) {
    super(l);
  }

  void display() {
    fill(0, lifespan);
    stroke(0, lifespan);
    rect(location.x, location.y,8,8);
  }
}
