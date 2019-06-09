/*
physics simulation

n-particle collide at xy-plain using object
- 9x9 particle
- 1 particle with high velocity
- add mass
- conserve momentum

created 2016.10.15.
by Wool(wool@wool.pe.kr)

ref : https://www.processing.org/examples/circlecollision.html
      https://www.processing.org/tutorials/objects/
      https://www.processing.org/examples/bouncybubbles.html
*/

//PVector gravity_a;

int numBalls = 81;

Ball[] balls = new Ball[numBalls];


void setup() 
{
  size(500, 500);
  
  //gravity_a = new PVector(0,1);
  
  //parameter : position x, position y, velocity vx, velocity vy, ball Color, ball ID
  //balls[0] = new Ball(25,25,1,2,100, 0);
  
  int i = 0;
  
  for(int j = 1; j < 10; j++) {
    for(int k = 1; k < 10; k++) {    
      balls[i] = new Ball( 50*j , 50*k, random(-1,1), random(-1,1),random(150,250), i);
      i++;
    }
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
  float m;
  int id;
  float ballColor;
  
  Ball(float x, float y, float vx, float vy, float ballColorin, int idin) {
    position = new PVector(x, y);
    velocity = new PVector(vx, vy);
    r = random(2.0, 3.0);
    m = r*0.1;
    ballColor = ballColorin;
    id = idin;
  }
  
  
  
  void update(){
    //balls[id].velocity.add(gravity_a);
    balls[id].position.add(balls[id].velocity);
  }
  
  void checkCollide() {
    for(int i = id+1; i < numBalls; i++) {
      /*PVector temp = new PVector();
      float temp_dist;
      
      temp_dist = PVector.dist(balls[id].position, balls[i].position);
      
      //conservation momentum
      if(temp_dist <= (balls[id].r + balls[i].r) ) {
        //temp_vel = balls[id].velocity.copy();
        //balls[id].velocity = balls[i].velocity.copy();
        //balls[i].velocity = temp_vel.copy();
        temp = PVector.add(PVector.mult(balls[id].velocity, (balls[id].mass-balls[i].mass)/(balls[id].mass+balls[i].mass)),
                                         PVector.mult(balls[i].velocity, (2*balls[i].mass)/(balls[id].mass+balls[i].mass)));
        balls[i].velocity = PVector.add(PVector.mult(balls[id].velocity, (2*balls[id].mass)/(balls[id].mass+balls[i].mass)),
                                         PVector.mult(balls[i].velocity, (balls[i].mass-balls[id].mass)/(balls[id].mass+balls[i].mass)));
        balls[id].velocity = temp.copy();
      }*/
      
      
      // get distances between the balls components
    PVector bVect = PVector.sub(balls[i].position, balls[id].position);

    // calculate magnitude of the vector separating the balls
    float bVectMag = bVect.mag();

    if (bVectMag < balls[id].r + balls[i].r) {
      // get angle of bVect
      float theta  = bVect.heading();
      // precalculate trig values
      float sine = sin(theta);
      float cosine = cos(theta);

      /* bTemp will hold rotated ball positions. You 
       just need to worry about bTemp[1] position*/
      PVector[] bTemp = {
        new PVector(), new PVector()
        };

        /* this ball's position is relative to the other
         so you can use the vector between them (bVect) as the 
         reference point in the rotation expressions.
         bTemp[0].position.x and bTemp[0].position.y will initialize
         automatically to 0.0, which is what you want
         since b[1] will rotate around b[0] */
        bTemp[1].x  = cosine * bVect.x + sine * bVect.y;
        bTemp[1].y  = cosine * bVect.y - sine * bVect.x;

      // rotate Temporary velocities
      PVector[] vTemp = {
        new PVector(), new PVector()
        };

      vTemp[0].x  = cosine * balls[id].velocity.x + sine * balls[id].velocity.y;
      vTemp[0].y  = cosine * balls[id].velocity.y - sine * balls[id].velocity.x;
      vTemp[1].x  = cosine * balls[i].velocity.x + sine * balls[i].velocity.y;
      vTemp[1].y  = cosine * balls[i].velocity.y - sine * balls[i].velocity.x;

      /* Now that velocities are rotated, you can use 1D
       conservation of momentum equations to calculate 
       the final velocity along the x-axis. */
      PVector[] vFinal = {  
        new PVector(), new PVector()
        };

      // final rotated velocity for b[0]
      vFinal[0].x = ((balls[id].m - balls[i].m) * vTemp[0].x + 2 * balls[i].m * vTemp[1].x) / (balls[id].m + balls[i].m);
      vFinal[0].y = vTemp[0].y;

      // final rotated velocity for b[0]
      vFinal[1].x = ((balls[i].m - balls[id].m) * vTemp[1].x + 2 * balls[id].m * vTemp[0].x) / (balls[id].m + balls[i].m);
      vFinal[1].y = vTemp[1].y;

      // hack to avoid clumping
      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;

      /* Rotate ball positions and velocities back
       Reverse signs in trig expressions to rotate 
       in the opposite direction */
      // rotate balls
      PVector[] bFinal = { 
        new PVector(), new PVector()
        };

      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      // update balls to screen position
      balls[i].position.x = balls[id].position.x + bFinal[1].x;
      balls[i].position.y = balls[id].position.y + bFinal[1].y;

      balls[id].position.add(bFinal[0]);

      // update velocities
      balls[id].velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      balls[id].velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      balls[i].velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      balls[i].velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;// get distances between the balls components
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