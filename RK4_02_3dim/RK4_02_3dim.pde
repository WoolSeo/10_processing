/*
physics simulation
3 dimention motion with resistence

created 2018.06.03.
by Wool(wool@wool.pe.kr)
*/

float g = 9.8;
float c = 0.1;
float w = 0.1;

float t = 0;
float vel_x_1 = 30; 
float vel_z_1 = -120; 
float vel_x_2 = 30; 
float vel_y_2 = -20;
float vel_z_2 = -1510; 
float dt = 0.01;

float x_1, z_1;
float x_2, y_2, z_2; 

PFont f;

void setup() {
  size(1000,700);
  //fill(255,3);
  //rect(0,0,width,height/2);
  //fill(255,3);
  //rect(0,height/2,width,height);
  line(0,height/2,width,height/2);
  
  fill(255,255,0);
  rect(width-10,50,10,80);
  
  fill(255,0,255);
  rect(width-10,430,10,80);
  
  f = createFont("Arial",13,true); 
  textFont(f,16);                  
  fill(0);                         
  text("x-y plane",20,25);
  text("x-z plane",20,height/2+25);
  
  line(0,650,width,650);
  //x_1 = 30;
  //z_1 = 750;
  
  x_2 = 30;
  y_2 = height/4;
  z_2 = 650;

}

void draw() {
  //noStroke();
  //fill(255,3);
  //rect(0,0,width,height);
  
   
  t = t + dt;
  

  /*vel_z_1 = vel_z_1 + g*t;
  z_1 = z_1 + vel_z_1*t;
  x_1 = x_1 + vel_x_1*t;*/
  
  vel_y_2 = 10-RungeKutta_y_r(vel_y_2);
  y_2 = y_2 + vel_y_2*t;
  
  if(vel_z_2 < 0) {
    vel_z_2 = 10 + RungeKutta_z_up(vel_z_2);
    vel_x_2 = RungeKutta_x(vel_x_2);
    z_2 = z_2 + vel_z_2*t;
    x_2 = x_2 + vel_x_2*t;
  }
  else {
    println("-");
    vel_z_2 = RungeKutta_z_down(vel_z_2);
    vel_x_2 = RungeKutta_x(vel_x_2);
    z_2 = z_2 + vel_z_2*t;
    x_2 = x_2 + vel_x_2*t;
  }
  print(t);
  print(", ");
  println(vel_z_2);
  
  
  stroke(0);
  //fill(175);
  //ellipse(x_1, z_1, 10,10);
  
  fill(100);
  ellipse(x_2, y_2, 10,10);
  
  fill(100);
  ellipse(x_2, z_2, 10,10);
  
  if(t > 1.5) {
    noLoop();
  }
}


float func_x(float v){
  return -1*c*v*v;
  
}

float func_y_r(float v){
  return 1*c*v*v + 0.5*c*w*v*v;
}

float func_z_up(float v){
  return -g + c*v*v;
}

float func_z_down(float v){
  return +g - c*v*v;
}



//RungeKutta 4th
float RungeKutta_z_up(float v){
  float k1 = dt*func_z_up(v);
  float k2 = dt*func_z_up(v + 0.5*k1);
  float k3 = dt*func_z_up(v + 0.5*k2);
  float k4 = dt*func_z_up(v + k3);
  return v + (k1 + 2*k2 + 2*k3 + k4)/6;
}
float RungeKutta_z_down(float v){
  float k1 = dt*func_z_down(v);
  float k2 = dt*func_z_down(v + 0.5*k1);
  float k3 = dt*func_z_down(v + 0.5*k2);
  float k4 = dt*func_z_down(v + k3);
  return v + (k1 + 2*k2 + 2*k3 + k4)/6;
}
float RungeKutta_y_r(float v){
  float k1 = dt*func_y_r(v);
  float k2 = dt*func_y_r(v + 0.5*k1);
  float k3 = dt*func_y_r(v + 0.5*k2);
  float k4 = dt*func_y_r(v + k3);
  return v + (k1 + 2*k2 + 2*k3 + k4)/6;
}

float RungeKutta_x(float v){
  float k1 = dt*func_x(v);
  float k2 = dt*func_x(v + 0.5*k1);
  float k3 = dt*func_x(v + 0.5*k2);
  float k4 = dt*func_x(v + k3);
  return v + (k1 + 2*k2 + 2*k3 + k4)/6;
}
