/*
physics simulation
free fall with 1st resistence

created 2018.06.03.
by Wool(wool@wool.pe.kr)
ref : http://saegil-lab.kr/?p=332
*/

float g = 10;
float c = 0.1;

float t = 0;
float vel_1 = 0; //free fall ball velocity
float vel_2 = 0; //ball with 1st resistence 
float h = 0.01;

float x_1, y_1;
float x_2, y_2; //ball with 1st resistence 

void setup() {
  size(500,800);
  
  //free fall ball initial postion
  x_1 = width/4;
  y_1 = 10;
  
  //resistence ball initial position
  x_2 = width*3/4;
  y_2 = 10;
}

void draw() {
  noStroke();
  fill(255,3);
  rect(0,0,width,height);
  
  
  t = t + h;
  
  //free fall
  vel_1 = vel_1 + g*t;
  y_1 = y_1 + vel_1*t;
  
  
  //resistance
  vel_2 = RungeKutta(vel_2);
  y_2 = y_2 + vel_2*t;
  
  stroke(0);
  fill(175);
  ellipse(x_1, y_1, 10,10);
  ellipse(x_2, y_2, 10,10);
  
  if(t > 1.5) {
    noLoop();
  }
}

float func(float v){
  return g - c*v;
}

//RungeKutta 4th
float RungeKutta(float v){
  float k1 = h*func(v);
  float k2 = h*func(v + 0.5*k1);
  float k3 = h*func(v + 0.5*k2);
  float k4 = h*func(v + k3);
  return v + (k1 + 2*k2 + 2*k3 + k4)/6;
}
