/*
physics simulation
collision 2 : 1-particle using object

created 2016.09.23.
by Wool(wool@wool.pe.kr)

ref : https://www.processing.org/examples/circlecollision.html
      https://www.processing.org/tutorials/objects/
*/


Balls ball;

void setup() 
{
  size(640, 360);
  ball = new Balls(20,20,5,0);
  
}

void draw() 
{
  background(102);
  
  ball.update();
  ball.display();
  ball.checkBoundary();
}

class Balls {
  PVector position;
  PVector velocity;
  
  float r;
  float mass;
  
  Balls(float x, float y, float vx, float vy) {
    position = new PVector(x, y);
    velocity = new PVector(vx, vy);
    r = 10;
  }
  
  void update(){
    position.add(velocity);
  }
  
  void checkBoundary() {
    if(position.x > width - r) {
      position.x = width - r;
      velocity.x *= -1;
    }
    else if(position.x < r) {
      position.x = r;
      velocity.x *= -1;
    }
    if(position.y > height - r) {
      position.y = height - r;
      velocity.y *= -1;
    }
    else if(position.y < r) {
      position.y = r;
      velocity.y *= -1;
    }
  }
  
  void display() {
    noStroke();
    fill(204);
    ellipse(position.x, position.y, r*2, r*2);
  }
}