player p;

void setup() {
  size(640, 360);
  p = new player();
}

void keyPressed() {
  if (key == 'a')  p.left = true;
  if (key == 'd')  p.right = true;
  if (key == 's')  p.backward = true;
  if (key == 'w')  p.forward = true;
}
void keyReleased() {
  if (key == 'a') p.left = false;
  if (key == 'd')  p.right = false;
  if (key == 's')  p.backward = false;
  if (key == 'w')  p.forward = false;
}

void draw() {
  background(255);
  p.display();
  p.turnangle();
}
