import java.util.Iterator;
class EnemySystem {
  ArrayList<Enemy> enemies;
  PVector origin;
  int total, round;
  float difficulty;
  
  EnemySystem(PVector location) {
    origin = location.get();
    enemies = new ArrayList<Enemy>();
    total = 10;
    round = 1;
    difficulty = 1;
  }

  void addEnemy() {
    float r = random(1);
    if (enemies.size() < total) {
      if (r < 0.33) {
        enemies.add(new EasyEnemy(origin, difficulty));
      } else if (r < 0.66) {
        enemies.add(new NormalEnemy(origin, difficulty));
      } else {
        enemies.add(new HardEnemy(origin, difficulty));
      }
    }
  }
  
  void update() {
    addEnemy();
    if (total == 0) {
      difficulty += 0.2;
      total = 10;
      round++;
      p.lifespan = 200;
      p.location = new PVector();
    }
  }
  
  void display() {
    textSize(20);
    textAlign(CENTER);
    fill(0);
    text("Wave: " + round, width/2, 20);
  }

  void run() {
    update();
    display();
    Iterator<Enemy> it = enemies.iterator();
    while (it.hasNext()) {
      Enemy e = it.next();
      e.run();
      if (e.isDead()) {
        total--;
        it.remove();
      }
    }
  } //<>//
}
