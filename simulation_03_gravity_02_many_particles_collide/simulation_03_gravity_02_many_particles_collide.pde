/*
physics simulation
 
 n-particle collide at xy-plain using object
 - 9x9 particle
 - 1 particle with high velocity
 - add mass
 - conserve momentum
 - gravity
 
 created 2016.10.17.
 by Wool(wool@wool.pe.kr)
 
 ref : https://www.processing.org/examples/circlecollision.html
 https://www.processing.org/tutorials/objects/
 https://www.processing.org/examples/bouncybubbles.html
 */

//PVector gravity_a;
//import com.hamoid.*;

//VideoExport videoExport;


float CONST_G = 0.0001;//gravity constant
float RANDOM_V = 0.01;
float R_size = 2;

int lattice_size = 50;
int numBalls = (lattice_size-1)*(lattice_size-1);

Ball[] balls = new Ball[numBalls];

boolean[] ballstable = new boolean[numBalls];

void setup() 
{
  size(1000, 1000);
  //frameRate(1);
  //videoExport = new VideoExport(this, "./basic.mp4");
  //gravity_a = new PVector(0,1);

  //parameter : position x, position y, velocity vx, velocity vy, ball Color, ball ID
  //balls[0] = new Ball(25,25,0,0,100, 0);

  int i = 0;
  
  for(int j = 0; j<numBalls;j++) {
     ballstable[j] = true;
  }
  
  for (int j = 1; j < lattice_size; j++) {
    for (int k = 1; k < lattice_size; k++) {    
      balls[i] = new Ball( (width/2)/lattice_size*j+250, (height/2)/lattice_size*k+250, random(-RANDOM_V,RANDOM_V), random(-RANDOM_V,RANDOM_V), random(150, 250), i);
      i++;
    }
  }
}

void draw() 
{
  background(50);

  for (Ball ball : balls) {
    ball.checkGravity();
    ball.checkCollide();
    //ball.checkBoundary();
    ball.update();
    ball.display();
  }
  //videoExport.saveFrame();
}

class Ball {
  PVector position;
  PVector velocity;
  PVector acc;

  float r;
  float m;
  int id;
  float ballColor;

  Ball(float x, float y, float vx, float vy, float ballColorin, int idin) {
    position = new PVector(x, y);
    velocity = new PVector(vx, vy);
    acc = new PVector(0,0);
    r = random(R_size, R_size+3);
    m = 0.01*r*r;
    ballColor = ballColorin;
    id = idin;
  }



  void update() {
    //balls[id].velocity.add(gravity_a);
    balls[id].position.add(balls[id].velocity);
  }

  void checkGravity() {    
    float gravity_mag;
    
    for (int i = 0; i < numBalls; i++) {
      if( id == i || ballstable[i] == false || ballstable[id] == false) continue;
      else {
        PVector bVect = PVector.sub(balls[i].position, balls[id].position);
        PVector gravity_force = new PVector(0,0);
      
        gravity_force = bVect.normalize();
        
        gravity_mag = CONST_G * balls[i].m; //bVect.x*bVect.x
      
        gravity_force.mult(gravity_mag);
      
        balls[id].velocity.add(gravity_force);

      }
    }

  }


  void checkCollide() {
    for (int i = 0; i < numBalls; i++) {
      PVector bVect = PVector.sub(balls[i].position, balls[id].position);
      
      if( id == i || ballstable[i] == false || ballstable[id] == false) continue;
      else if ( bVect.magSq() < (balls[id].r + balls[i].r)/2) {
          balls[id].m = balls[id].m + balls[i].m;
          balls[id].r = balls[id].m*balls[id].m;
          balls[id].velocity.x = (balls[id].m * balls[id].velocity.x + balls[i].m * balls[i].velocity.x) / (balls[id].m +balls[i].m);
          balls[id].velocity.y = (balls[id].m * balls[id].velocity.y + balls[i].m * balls[i].velocity.y) / (balls[id].m +balls[i].m);
          balls[i].r = 0;
          balls[i].m = 0;
          ballstable[i] = false;
        }
     }
  }

  void checkBoundary() {
    if (balls[id].position.x > width - balls[id].r) {
      balls[id].position.x = width - balls[id].r;
      balls[id].velocity.x *= -1;
    } else if (balls[id].position.x < balls[id].r) {
      balls[id].position.x = r;
      balls[id].velocity.x *= -1;
    }
    if (balls[id].position.y > height - balls[id].r) {
      balls[id].position.y = height - balls[id].r;
      balls[id].velocity.y *= -1;
    } else if (balls[id].position.y < balls[id].r) {
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