/*
physics simulation
drop the ball - constant velocity

created 2016.09.20.
by Wool(wool@wool.pe.kr)
ref : https://www.processing.org/tutorials/pvector/
*/

PVector location;
PVector velocity;

void setup() {
  size(500,500);
  
  location = new PVector(width/2,10);
  velocity = new PVector(0,1);
}


void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  location.add(velocity);
  
  stroke(0);
  fill(175);
  ellipse(location.x, location.y, 10,10);
}