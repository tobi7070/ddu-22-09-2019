player p;

void setup(){
  size(640,360);
  p = new player();
}
  void draw(){
    background(255);
    
p.display();
p.control();  
  }
