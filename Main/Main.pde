BulletSystem bs;
EnemySystem es;
Player p;

void setup() {
  size(640,360);
  bs = new BulletSystem(new PVector(width/2, height/2));
  es = new EnemySystem(new PVector(random(width), random(height)));
  p = new Player(new PVector(width/2, height/2));
}

void draw() {
  background(255);
  bs.run();
  es.run();
  p.run();
  
  // for(Bullet b : es.getBullets()) 
  
}
