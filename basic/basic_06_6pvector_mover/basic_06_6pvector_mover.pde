/*
created 2016.09.17.
by Wool(wool@wool.pe.kr)
ref : https://www.processing.org/tutorials/pvector/
*/

//Example: Motion 101 (velocity)

// Declare Mover object
Mover mover;

void setup() {
  size(200,200);
  smooth();
  background(255);
  // Make Mover object
  mover = new Mover(); 
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  // Call functions on Mover object.
  mover.update();
  mover.checkEdges();
  mover.display(); 
}

class Mover {

  // Our object has two PVectors: location and velocity
  PVector location;
  PVector velocity;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2),random(-2,2));
  }

  void update() {
    // Motion 101: Locations changes by velocity.
    location.add(velocity);
  }

  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,16,16);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }

  }

}