import java.util.Iterator;
class BulletSystem {
  ArrayList<Bullet> bullets;
  PVector origin;

  BulletSystem(PVector location) {
    origin = location.get();
    bullets = new ArrayList<Bullet>();
  }
  
  void addBullet(PVector l, PVector v, float d, String t) {
    if (t == "E") {
      bullets.add(new EnemyBullet(l, v, d));
    }
    if (t == "P") {
      bullets.add(new PlayerBullet(l, v, d));
    }
  } 

  void run() {
    Iterator<Bullet> it = bullets.iterator();
    while (it.hasNext()) {
      Bullet b = it.next();
      b.run();
      if (b.isDead()) {
        it.remove();
      }
    }
  }
}
