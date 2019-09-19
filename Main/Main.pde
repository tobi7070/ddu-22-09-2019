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
  bs.run();
  es.run();
  p.run();
  for (int i = bs.bullets.size() - 1; i >= 0; i--) {
    if (c.hasCollided(bs.bullets.get(i).location, bs.bullets.get(i).size.x, p.location, p.size.x / 2)) {
      // println("Player has been hit!");
      bs.bullets.get(i).lifespan = 0;
    }
    
    /* offset bullets
    for (int e = es.enemies.size() - 1; e >= 0; e--) {
      if (c.hasCollided(bs.bullets.get(i).location, bs.bullets.get(i).size.x, es.enemies.get(e).location, es.enemies.get(e).size.x / 2)) {
        // println("Enemy has been hit!");
        bs.bullets.get(i).lifespan = 0;
      }
    }
    */
  }
}
