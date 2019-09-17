EnemySystem es;
Player p;
 
void setup() {
  size(640,360);
  es = new EnemySystem(new PVector(random(width)/2,random(height)/2));
  p = new Player(new PVector(width/2, height/2));
}
 
void draw() {
  background(255);
  es.addEnemy();
  es.run();
  p.run();
}
