/*
created 2016.09.15.
by Wool(wool@wool.pe.kr)
ref : https://www.processing.org/tutorials/objects/
*/

class Car { // the class name
  
  //data
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  
  //constructor
  Car() {
    c = color(255);
    xpos = width/2;
    ypos = height/2;
    xspeed = 1;
  }
  
  //functionality
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10);
  }
  
  void drive() {
    xpos = xpos + xspeed;
    if( xpos > width) {
      xpos = 0;
    }
  }
  
}