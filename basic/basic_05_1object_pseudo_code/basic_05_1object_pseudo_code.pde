/*
created 2016.09.15.
by Wool(wool@wool.pe.kr)
ref : https://www.processing.org/tutorials/objects/
*/

color c = color(0); 
float x = 0; 
float y = 100; 
float speed = 1; 

void setup() { 
  size(200,200); 
} 

void draw() { 
  background(255); 
  move(); 
  display(); 
} 

void move() { 
  x = x + speed; 
  if (x > width) { 
    x = 0; 
  } 
} 

void display() { 
  fill(c); 
  rect(x,y,30,10); 
}