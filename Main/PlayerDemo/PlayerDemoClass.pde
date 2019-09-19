class player{

float a = 0.0;
boolean forward = false;
boolean backward = false;
PVector movement = new PVector();
PVector location = new PVector(width/2,height/2);

void control(){
   if (keyPressed == true && key == 'a'){
    a = a -0.2;
 }
  if (keyPressed == true && key == 'd'){
    a = a + 0.2;
 }
  if (keyPressed == true && key == 'w'){  
    forward = true;
 } else{ forward = false;}
  if (keyPressed == true && key == 's'){  
    backward = true;
 } else{ backward = false;}
 
}

void display(){
  if(forward){
  movement.set(5,0);
movement.rotate(a);
location.add(movement);
  }
  if(backward){
  movement.set(-5,0);
movement.rotate(a);
location.add(movement);
  }
translate(location.x,location.y);

rectMode(CENTER);
fill(100);
rotate(a);
rect(0,0,64,36);
  }

}
