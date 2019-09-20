Player p;

void setup() {
  size(640, 360);
  p = new Player(new PVector(width/2, height/2));
}

// Controls
void keyPressed() {
  if (key == 'a')  p.left = true;
  if (key == 'd')  p.right = true;
  if (key == 's')  p.backward = true;
  if (key == 'w')  p.forward = true;
  if (key == 32) p.isAttacking = true;
}

void keyReleased() {
  if (key == 'a') p.left = false;
  if (key == 'd')  p.right = false;
  if (key == 's')  p.backward = false;
  if (key == 'w')  p.forward = false;
  if (key == 32) p.isAttacking = false;
}

void draw() {
  background(255);
  p.run();
}
