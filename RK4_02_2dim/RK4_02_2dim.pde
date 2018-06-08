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
float vel_z_1 = -120; 
float vel_x_2 = 30; 
float vel_z_2 = -1000; 
float dt = 0.01;

float x_1, z_1;
float x_2, z_2; 

PFont f;

void setup() {
  size(1000,800);

  /*f = createFont("Arial",13,true); 
  textFont(f,16);                  
  fill(0);                         
  text("no",90,15);
  text("1st",290,15);
  text("2nd",490,15);*/
  
  line(0,750,width,750);
  x_1 = 30;
  z_1 = 750;
  
  x_2 = 30;
  z_2 = 750;

}

void draw() {
  //noStroke();
  //fill(255,3);
  //rect(0,0,width,height);
  
   
  t = t + dt;
  

  vel_z_1 = vel_z_1 + g;
  z_1 = z_1 + vel_z_1;
  x_1 = x_1 + vel_x_1;
  
  if(vel_z_2 < 0) {
    vel_z_2 = 10 + RungeKutta_z_up(vel_z_2);
    vel_x_2 = RungeKutta_x(vel_x_2);
    z_2 = z_2 + vel_z_2;
    x_2 = x_2 + vel_x_2;
  }
  else {
    println("-");
    vel_z_2 = RungeKutta_z_down(vel_z_2);
    vel_x_2 = RungeKutta_x(vel_x_2);
    z_2 = z_2 + vel_z_2;
    x_2 = x_2 + vel_x_2;
  }
  print(t);
  print(", ");
  println(vel_z_2);
  
  
  stroke(0);
  fill(175);
  //ellipse(x_1, z_1, 10,10);
  fill(100);
  ellipse(x_2, z_2, 10,10);
  
  if(t > 1.5) {
    noLoop();
  }
}

float func_z_up(float v){
  return -g + c*v*v;
}
float func_z_down(float v){
  return +g - c*v*v;
}

float func_x(float v){
  return -1*c*v*v;
  
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
float RungeKutta_x(float v){
  float k1 = dt*func_x(v);
  float k2 = dt*func_x(v + 0.5*k1);
  float k3 = dt*func_x(v + 0.5*k2);
  float k4 = dt*func_x(v + k3);
  return v + (k1 + 2*k2 + 2*k3 + k4)/6;
}
