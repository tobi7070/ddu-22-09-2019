import java.util.Iterator;
class BulletSystem {
  ArrayList<Bullet> bullets;
  PVector origin;

  BulletSystem(PVector location) {
    origin = location.get();
    bullets = new ArrayList<Bullet>();
  }

 void addBullet(PVector l, PVector v) {
    bullets.add(new Bullet(l, v));
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
