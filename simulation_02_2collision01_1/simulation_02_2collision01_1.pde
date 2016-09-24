/*
physics simulation

n-particle collide at x-axis using object
- ball exchage velocity


created 2016.09.23.
by Wool(wool@wool.pe.kr)

ref : https://www.processing.org/examples/circlecollision.html
      https://www.processing.org/tutorials/objects/
      https://www.processing.org/examples/bouncybubbles.html
*/

int numBalls = 5;

Ball[] balls = new Ball[numBalls];


void setup() 
{
  size(640, 360);
  
  for(int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width),height/2,random(0,5),0,random(150,250), i);
  }
}

void draw() 
{
  background(50);
  
  for(Ball ball : balls) {
    ball.checkCollide();
    ball.checkBoundary();
    ball.update();
    ball.display();
  }
}

class Ball {
  PVector position;
  PVector velocity;
  
  float r;
  float mass;
  int id;
  float ballColor;
  
  Ball(float x, float y, float vx, float vy, float ballColorin, int idin) {
    position = new PVector(x, y);
    velocity = new PVector(vx, vy);
    r = 10;
    ballColor = ballColorin;
    id = idin;
  }
  
  
  
  void update(){
    balls[id].position.add(velocity);
  }
  
  void checkCollide() {
    for(int i = id+1; i < numBalls; i++) {
      
      PVector temp_vel = new PVector();
      float temp_dist;
      
      
      temp_dist = PVector.dist(balls[id].position, balls[i].position);
      
      //exchage velocity
      if(temp_dist < (balls[id].r + balls[i].r) ) {
        temp_vel = balls[id].velocity.copy();
        balls[id].velocity = balls[i].velocity.copy();
        balls[i].velocity = temp_vel.copy();
      }   
    }
  }
  
  void checkBoundary() {
    if(balls[id].position.x > width - balls[id].r) {
      balls[id].position.x = width - balls[id].r;
      balls[id].velocity.x *= -1;
    }
    else if(balls[id].position.x < balls[id].r) {
      balls[id].position.x = r;
      balls[id].velocity.x *= -1;
    }
    if(balls[id].position.y > height - balls[id].r) {
      balls[id].position.y = height - balls[id].r;
      balls[id].velocity.y *= -1;
    }
    else if(balls[id].position.y < balls[id].r) {
      balls[id].position.y = balls[id].r;
      balls[id].velocity.y *= -1;
    }
  }
  
  void display() {
    noStroke();
    fill(balls[id].ballColor);
    ellipse(balls[id].position.x, balls[id].position.y, balls[id].r*2, balls[id].r*2);
  }
}