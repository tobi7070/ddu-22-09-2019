class Collision {
  Collision() {
  }
  
  boolean hasCollided(PVector a, float aw, PVector b, float bw) {
    PVector distance = PVector.sub(a, b);
    float touch = aw + bw;

    if (distance.mag() < touch) {
      return true;
    } else {
      return false;
    }
  }
}
