import java.util.Iterator;
class EnemySystem {
  ArrayList<Enemy> enemies;
  PVector origin;

  EnemySystem(PVector location) {
    origin = location.get();
    enemies = new ArrayList<Enemy>();
  }

  // To Do: Do not replace dead enemy
  void addEnemy() {
    float r = random(1);
    if (enemies.size() < 10) {
      if (r < 0.5) {
        enemies.add(new Enemy(origin));
      } else {
        enemies.add(new Type1(origin));
      }
    }
  }

  void run() {
    addEnemy();
    Iterator<Enemy> it = enemies.iterator();
    while (it.hasNext()) {
      Enemy e = it.next();
      e.run();
      if (e.isDead()) {
        it.remove();
      }
    }
  }
}
