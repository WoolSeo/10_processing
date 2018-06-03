/*
physics simulation
2 dimention motion with resistence

created 2018.06.03.
by Wool(wool@wool.pe.kr)
*/

float g = 10;
float c = 0.1;

float t = 0;
float vel_x_1 = 30; 
float vel_y_1 = -120; 
float vel_x_2 = 30; 
float vel_y_2 = -120; 
float dt = 0.01;

float x_1, y_1;
float x_2, y_2; 

PFont f;

void setup() {
  size(1000,800);

  f = createFont("Arial",13,true); 
  
  
  
  
  textFont(f,16);                  
  fill(0);                         
  text("no",90,15);
  text("1st",290,15);
  text("2nd",490,15);

  x_1 = 30;
  y_1 = 750;
  
  x_2 = 30;
  y_2 = 750;

}

void draw() {
  noStroke();
  fill(255,3);
  rect(0,0,width,height);
  
  
  t = t + dt;
  

  vel_y_1 = vel_y_1 + g*t;
  y_1 = y_1 + vel_y_1*t;
  x_1 = x_1 + vel_x_1*t;
  
  if(vel_y_2 < 0) {
    vel_y_2 = RungeKutta_y_p(vel_y_2);
    vel_x_2 = RungeKutta_x(vel_x_2);
    y_2 = y_2 + vel_y_2*t;
    x_2 = x_2 + vel_x_2*t;
  }
  else {
    println("-");
    vel_y_2 = RungeKutta_y_m(vel_y_2);
    vel_x_2 = RungeKutta_x(vel_x_2);
    y_2 = y_2 + vel_y_2*t;
    x_2 = x_2 + vel_x_2*t;
  }
  print(t);
  print(", ");
  println(vel_y_2);
  
  
  stroke(0);
  fill(175);
  ellipse(x_1, y_1, 10,10);
  ellipse(x_2, y_2, 10,10);
  
  if(t > 3.0) {
    noLoop();
  }
}

float func_y_p(float v){
  return -g + c*v*v;
}
float func_y_m(float v){
  return +g - c*v*v;
}

float func_x(float v){
  return -1*c*v*v;
  
}

//RungeKutta 4th
float RungeKutta_y_p(float v){
  float k1 = dt*func_y_p(v);
  float k2 = dt*func_y_p(v + 0.5*k1);
  float k3 = dt*func_y_p(v + 0.5*k2);
  float k4 = dt*func_y_p(v + k3);
  return v + (k1 + 2*k2 + 2*k3 + k4)/6;
}
float RungeKutta_y_m(float v){
  float k1 = dt*func_y_m(v);
  float k2 = dt*func_y_m(v + 0.5*k1);
  float k3 = dt*func_y_m(v + 0.5*k2);
  float k4 = dt*func_y_m(v + k3);
  return v + (k1 + 2*k2 + 2*k3 + k4)/6;
}
float RungeKutta_x(float v){
  float k1 = dt*func_x(v);
  float k2 = dt*func_x(v + 0.5*k1);
  float k3 = dt*func_x(v + 0.5*k2);
  float k4 = dt*func_x(v + k3);
  return v + (k1 + 2*k2 + 2*k3 + k4)/6;
}
