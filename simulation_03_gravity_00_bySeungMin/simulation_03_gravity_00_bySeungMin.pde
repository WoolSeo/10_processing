/*
 CCC  OOO  PPPP  Y   Y RRRR   III   GGGG H   H TTTTT 
C    O   O P   P  YYY  R   R   I   G     H   H   T
C    O   O PPPP    Y   RRRRR   I   G  GG HHHHH   T
C    O   O P       Y   R R     I   G   G H   H   T
 CCC  OOO  P       Y   R  RR  III   GGG  H   H   T
 
 SSSS EEEEE U   U N   N  GGGG       M   M  III  N   N
S     E     U   U NN  N G           MM MM   I   NN  N
 SSS  EEEEE U   U N N N G  GG       M M M   I   N N N
    S E     U   U N  NN G   G       M   M   I   N  NN
SSSS  EEEEE  UUU  N   N  GGG        M   M  III  N   N

JJJJJ EEEEE  OOO  N   N  GGGG
  J   E     O   O NN  N G
  J   EEEEE O   O N N N G  GG
  J   E     O   O N  NN G   G
JJ    EEEEE  OOO  N   N  GGG

Copyright(C) Seung Min Jeong, Gyeonggi Science High School 34th
For Educational use only!

for Wool Seo

*/
Spot[] spots;
int numSpots=3500;//no more than 25000, seriously
float F=0.5;//change!
float T=0.5;//change!
int M = 36;
void setup() {
  size(1500, 800);//change!
  spots = new Spot[numSpots];
  for (int i = 0; i < spots.length; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float xs = random(-2.0, 2.0);
    float ys = random(-2.0, 2.0);
    spots[i] = new Spot(x, y, M, xs, ys);
  }
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