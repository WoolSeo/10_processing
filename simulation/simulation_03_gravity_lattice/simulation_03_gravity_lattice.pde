/*
physics simulation
gravity - lattice

created 2016.10.15.
by Seung Min Jeong(Gyeonggi Science High School 34th), Wool(wool@wool.pe.kr)

*/
Spot[] spots;
int numSpots=81;//no more than 25000, seriously
float F=0.5;//change!
float T=0.5;//change!
int M = 36;
int cnt = 0;
void setup() {
  size(800, 800);//change!
  spots = new Spot[numSpots];
  for(int i = 1; i<=9; i++) {
    for(int j =1; j<=9; j++) {
      float x = width/10 * i;//random(0, width);
      float y = height/10 * j;//random(0, height);
      float xs = random(-1, 1);
      float ys = random(-1, 1);
      spots[cnt] = new Spot(x, y, M, xs, ys);
      cnt++;
    }
  }
    
  /*for (int i = 0; i < spots.length; i++) {
    
    float x = width/numSpots * i;//random(0, width);
    float y = height/numSpots * i;//random(0, height);
    float xs = 0;//random(-2.0, 2.0);
    float ys = 0;//random(-2.0, 2.0);
    spots[i] = new Spot(x, y, M, xs, ys);
  }*/
  noStroke();
}
void draw() {
  frameRate(60);
  fill(0);
  rect(0, 0, width, height);
  for (int i=0; i < spots.length; i++) {
    spots[i].move();
    spots[i].display();
  }
}
class Spot {
  float x, y;
  float mass, diameter;
  float xspeed,yspeed;
  boolean dis, tmpdis;
  float R,G,B;
  Spot(float xpos, float ypos, float ma, float xs, float ys) {
    x = xpos;
    y = ypos;
    mass=ma;
    diameter=sqrt(mass);
    xspeed=xs;
    yspeed=ys;
    dis=true;
    do{
    R=random(0.0,256.0);
    G=random(0.0,256.0);
    B=random(0.0,256.0);
    }while(R+G+B>512);
  }
  void move() {
    if(mouseButton==LEFT){
    x = random(0, width);
    y = random(0, height);
    xspeed = random(-2.0, 2.0);
    yspeed = random(-2.0, 2.0);
    mass=M;
    diameter=sqrt(mass);
    dis=true;
    return;
    }
    for(int i=0;i<numSpots;i++){
      if(!dis||!spots[i].dis)continue;
      float dx=x-spots[i].x;
      float dy=y-spots[i].y;
      float r=sqrt(dx*dx+dy*dy);
      if(r==0)continue;
      if(2*r<diameter+spots[i].diameter){
          if(mass<spots[i].mass){
            R=spots[i].R;
            G=spots[i].G;
            B=spots[i].B;
          }
          x=(x*diameter+spots[i].x*spots[i].diameter)/(diameter+spots[i].diameter);
          y=(y*diameter+spots[i].y*spots[i].diameter)/(diameter+spots[i].diameter);
          xspeed=(xspeed*mass+spots[i].xspeed*spots[i].mass)/(mass+spots[i].mass);
          yspeed=(yspeed*mass+spots[i].yspeed*spots[i].mass)/(mass+spots[i].mass);
          mass+=spots[i].mass;
          diameter=sqrt(mass);
          spots[i].dis=false;
          continue;
        }
      double f=F*(mass*spots[i].mass)/(r*r);
      xspeed-=(dx/r)*f/mass*T*T;
      yspeed-=(dy/r)*f/mass*T*T;
    }
    x += xspeed*T;
    y += yspeed*T;
    //Reflection
    /*if (x > (width - diameter/2)){ 
      xspeed*=-1;
      x=width-diameter/2;
    } 
    if(x < diameter/2){
      xspeed*=-1;
      x=diameter/2;
    }
    if (y > (height - diameter/2)){ 
      yspeed*=-1; 
      y=height-diameter/2;
    } 
    if(y < diameter/2){
      yspeed*=-1;
      y=diameter/2;
    }*/
  }
  void display() {
    if(!dis)return;
    fill(R,G,B);
    ellipse(x, y, diameter, diameter);
    fill(0);
    textAlign(CENTER);
    textSize(diameter/4);
    if(mass<100000)text((int)mass,x,y+diameter/8);
    else{
      textSize(diameter/7);
      text("ENORMOUS!",x,y+diameter/14);
    }
  }
}