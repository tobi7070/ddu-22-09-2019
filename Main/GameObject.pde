class GameObject {
  ArrayList GameObject;
  Player p;
  Enemy e;
  EnemySystem es;
  Bullet b;
  
  GameObject() {
    GameObject = new ArrayList();
    GameObject.add(p);
    GameObject.add(e);
    GameObject.add(es);
    GameObject.add(b);
  }
  
 void run() {
   p.run();
   e.run();
   es.run();
   b.run();
 }
}
