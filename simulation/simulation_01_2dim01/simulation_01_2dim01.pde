/*
physics simulation
motion in two dimensions at constant y-acceleration

created 2016.09.21.
by Wool(wool@wool.pe.kr)
ref : https://www.processing.org/tutorials/pvector/
*/

PVector location;
PVector velocity;
PVector acceleration;

void setup() {
  size(500,500);
  frameRate(10); // frame per seconds
  
  location = new PVector(10,490); //initial position(x,y)
  velocity = new PVector(2.5,-9.0); //initial velocity(v_x,v_y), upward is negative
  acceleration = new PVector(0,0.1); //initial acceleration(a_x, a_y)
}

void draw() { 
  //show the path
  noStroke();
  fill(255,5);
  rect(0,0,width,height);
  
  //vector sum
  velocity.add(acceleration);
  location.add(velocity);
  
  //draw a ball
  stroke(0);
  fill(175);
  ellipse(location.x, location.y, 10,10);
}