/*
physics simulation
electric fields - one source q

created 2016.09.20.
by Wool(wool@wool.pe.kr)
ref : https://www.processing.org/tutorials/pvector/
*/

int q_0 = 1;


PVector location;
PVector field;

void setup() {
  size(500,500);
  translate(width/2,height/2);
   
  ellipse(0,0,5,5);
}


void draw() {
   
  location = new PVector(mouseX-width/2,mouseY-height/2);
  
  float mag_squre = location.mag() * location.mag();
  
  field = new PVector(mag_squre,mag_squre);
  
  stroke(0);
  fill(175);
  line(location.x, location.y, field.x,field.y);
}