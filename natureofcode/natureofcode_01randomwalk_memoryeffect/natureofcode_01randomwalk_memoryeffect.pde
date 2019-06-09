/*
nature of code

01. random walke

created 2017.1.22.
by Wool(wool@wool.pe.kr)

reference - Daniel Shiffman, The Nature of Code(2012)
*/
float p = 0.2;
float q = 0.1;
int target_t = 100000;
int t = 0;
int[] x;
int[] memo;
int X_0 = 500;

void setup() {
  size(1000, 360);
  frameRate(30);
  
  ellipseMode(CENTER);
  x = new int[target_t+100];
  memo = new int[target_t+100];
  x[0] = X_0;
  println(x[0]);
  float r = random(1);
  if( r < q ) {
    memo[0] = +1;
  }
  else {
    memo[0] = -1;
  }
  x[0] = X_0 + memo[0];
  println(t, r,  memo[0], x[t]);
  t++;
  
  r = random(1);
  int rr = (int)random(0,2);
  if( r < p  ) {
    memo[1] = memo[rr];
  }
  else {
    memo[1] = -memo[rr];
  }
  x[1] = x[0] + memo[1];
  println(t, r, rr, x[t]);
  t++;
  background(255);
  
  fill(255,255,0);
  ellipse(X_0, height/2, 50,50);
  fill(10,10,10);
  ellipse(x[0],height/2, 20,20);
  //ellipse(x[1],height/2, 20,20);
}

void draw() {
    noStroke();
    fill(255,1);
    rect(0,0,width,height);

    float r = random(1);
    int rr = (int)random(0, t);
    
    
    if( r < p ) {
      memo[t] = memo[rr];
    }
    else {
      memo[t] = -memo[rr];
    }
    x[t] = x[t-1] + memo[t];
    println(t, r, rr, x[t]);
    
    
    //delay(500);
    stroke(0);
    //point(x,y);
    ellipse(x[t],height/2,20,20);
    t++;
}