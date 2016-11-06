/*
created 2016.09.17.
by Wool(wool@wool.pe.kr)
ref : https://www.processing.org/tutorials/pvector/
*/

//Example: Vector subtraction

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  background(255);
  
  // Two PVectors, one for the mouse location and one for the center of the window.
  PVector mouse = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
  
  // PVector subtraction!
  mouse.sub(center);
  
  // Draw a line to represent the vector.
  translate(width/2,height/2); // translate origin
  line(0,0,mouse.x,mouse.y);
  
}