/*
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
    spots[i] = new Spot(x, y, M, xs, ys, i);
  }
  noStroke();
}
void draw() {
  frameRate(60);
  fill(0);
  rect(0, 0, width, height);
  for (Spot spot : spots) {
    spots.move();
    spots.display();
  }
}
class Spot {
  PVector position;
  PVector velocity;
  
  
  int id;
  //float x, y;
  float mass, diameter;
  //float xspeed,yspeed;
  boolean dis, tmpdis;
  float R,G,B;
  Spot(float xpos, float ypos, float ma, float xs, float ys, int idin) {
    position = new PVector(xpos, ypos);
    velocity = new PVector(xs, ys);
    mass=ma;
    diameter=sqrt(mass);
    dis=true;
    id = idin;
    do{
    R=random(0.0,256.0);
    G=random(0.0,256.0);
    B=random(0.0,256.0);
    }while(R+G+B>512);
  }
  void move() {
    
    //check collision
    for(int i=id+1;i<numSpots;i++){
      if(!dis||!spots[id].dis)continue; //?? what??
      //float dx=x-spots[i].x;
      //float dy=y-spots[i].y;
      //float r=sqrt(dx*dx+dy*dy);
      float tmp_dist;
      tmp_dist = PVector.dist(spots[id].position, spots[i].position);
      if(tmp_dist==0)continue;
      if(2*tmp_dist<spots[id].diameter+spots[i].diameter){
          if(spots[id].mass<spots[i].mass){
            R=spots[i].R;
            G=spots[i].G;
            B=spots[i].B;
          }
          spots[id].position = (spots[id].position*spots[id].diameter+spots[i].position*spots[i].diameter)/(spots[id].diameter+spots[i].diameter);
          
          //x=(x*diameter+spots[i].x*spots[i].diameter)/(diameter+spots[i].diameter);
          //y=(y*diameter+spots[i].y*spots[i].diameter)/(diameter+spots[i].diameter);
          spots[id].velocity = (spots[id].velocity*spots[id].mass+spots[i].velocity*spots[i].mass)/(spots[id].mass+spots[i].mass);
          //xspeed=(xspeed*mass+spots[i].xspeed*spots[i].mass)/(mass+spots[i].mass);
          //yspeed=(yspeed*mass+spots[i].yspeed*spots[i].mass)/(mass+spots[i].mass);
          spots[id].mass+=spots[i].mass;
          spots[id].diameter = sqrt(spots[id].mass);
          spots[i].dis=false;
          continue;
        }
      float f=F*(spots[id].mass*spots[i].mass)/(tmp_dist*tmp_dist);
      spots[id].velocity.x = spots[id].velocity.x - (spots[id].position.x-spots[i].position.x)/tmp_dist*f/spots[id].mass*T*T;
      spots[id].velocity.y = spots[id].velocity.y - (spots[id].position.y-spots[i].position.y)/tmp_dist*f/spots[id].mass*T*T;
      
  
    }
    spots[id].position += T*spots[id].velocity;
    
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
    ellipse(position.x, position.y, diameter, diameter);
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