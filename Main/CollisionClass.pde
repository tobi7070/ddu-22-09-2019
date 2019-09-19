class Collision {
  
  Collision() {
  }
  
  boolean hasCollided(PVector a, PVector b) {
    if (a.x < b.x) {
      return true;
    } else {
      return false;
    }
  }
}
