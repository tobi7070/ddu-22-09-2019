BulletSystem bs;
EnemySystem es;
Player p;
Collision c;

void setup() {
  size(640,360);
  bs = new BulletSystem(new PVector(width/2, height/2));
  es = new EnemySystem(new PVector(random(width), random(height)));
  p = new Player(new PVector(width/2, height/2));
  c = new Collision();
}

void draw() {
  background(255);
  es.run();
  p.run();
  
  // If player exists run bullets and check for collision
  if (p.isDead() == false) {
    bs.run();
    for (int i = bs.bullets.size() - 1; i >= 0; i--) {
      if (c.hasCollided(bs.bullets.get(i).location, bs.bullets.get(i).size.x, p.location, p.size.x / 2) && bs.bullets.get(i) instanceof EnemyBullet) {
        println("Player has been hit!");
        bs.bullets.get(i).lifespan = 0;
        p.lifespan -= bs.bullets.get(i).damage;
        println("Damage taken: " + bs.bullets.get(i).damage);
      }
      for (int e = es.enemies.size() - 1; e >= 0; e--) {
        if (c.hasCollided(bs.bullets.get(i).location, bs.bullets.get(i).size.x, es.enemies.get(e).location, es.enemies.get(e).size.x / 2) && bs.bullets.get(i) instanceof PlayerBullet) {
          println("Enemy has been hit!");
          bs.bullets.get(i).lifespan = 0;
          es.enemies.get(e).lifespan -= bs.bullets.get(i).damage;
          println("Damage given: " + bs.bullets.get(i).damage);
        }
      }
    }
  }
}

// Reset method
void reset() {
  bs = new BulletSystem(new PVector(width/2, height/2));
  es = new EnemySystem(new PVector(random(width), random(height)));
  p = new Player(new PVector(width/2, height/2));
}
