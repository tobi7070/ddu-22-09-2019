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
  // Collision
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
  
  // Supper-duper secret cheat
  if (keyPressed == true && key == 32) {
    int i = es.enemies.size();
    if (i > 0) {
      es.enemies.get(i - 1).lifespan = 0;
    }
  }
  
  // Set High-Score!
  /*
  if (es.round > highscore) {
    highscore = es.round;
  }
  */
  
  // Game Over
  if (p.isDead()) {
    noStroke();
    fill(0, 200);
    rect(0,0,width,height);
    
    textSize(20);
    textAlign(CENTER);
    fill(255);
    text("Game Over!", width/2, height/2);
    fill(200);
    text("Game is restarting...", width/2, height/2 + 40);
    
    // Implement better timer
    if (frameCount % 300 == 0) {
      reset();
    }
  }
}
// Reset
void reset() {
  setup();
}

// Controls
void keyPressed() {
  if (key == 'a')  p.left = true;
  if (key == 'd')  p.right = true;
  if (key == 's')  p.backward = true;
  if (key == 'w')  p.forward = true;
  if (key == ENTER) p.isAttacking = true;
}

void keyReleased() {
  if (key == 'a') p.left = false;
  if (key == 'd')  p.right = false;
  if (key == 's')  p.backward = false;
  if (key == 'w')  p.forward = false;
  if (key == ENTER) p.isAttacking = false;
}
