/*
created 2016.09.17.
by Wool(wool@wool.pe.kr)
ref : https://www.processing.org/tutorials/pvector/
*/

//Example: Normalizing a Vector

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  background(255);
  
  PVector mouse = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
  mouse.sub(center);
  
  // In this example, after the vector is normalized it is 
  // multiplied by 50 so that it is viewable onscreen.  
  // Note that no matter where the mouse is, the vector will 
  // have same length (50), due to the normalization process.
  mouse.normalize();
  mouse.mult(50);

  translate(width/2,height/2);
  line(0,0,mouse.x,mouse.y);
  
}