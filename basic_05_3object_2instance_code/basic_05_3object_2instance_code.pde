/*
created 2016.09.17.
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
  
  //functionality method
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


// Step 1. Declare an object.
Car myCar;

void setup()  {    
  // Step 2. Initialize object.
  myCar = new Car();   
}    

void draw()  {    
  background(255);  
  // Step 3. Call methods on the object. 
  myCar.drive();   
  myCar.display();   
}      