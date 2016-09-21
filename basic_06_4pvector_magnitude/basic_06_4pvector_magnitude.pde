/*
created 2016.09.17.
by Wool(wool@wool.pe.kr)
ref : https://www.processing.org/tutorials/pvector/
*/
//Example: Vector magnitude

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  background(255);
  
  PVector mouse = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
  mouse.sub(center);

  // The magnitude (i.e. length) of a vector can be accessed via the mag() function.  
  // Here it is used as the width to a rectangle drawn at the top of the window.
  float m = mouse.mag();
  fill(0);
  rect(0,0,m,10);
  
  translate(width/2,height/2);
  line(0,0,mouse.x,mouse.y);
  
}