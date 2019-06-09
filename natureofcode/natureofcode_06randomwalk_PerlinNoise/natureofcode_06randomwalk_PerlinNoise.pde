/*
nature of code

06. random walk PerlinNoise

created 2017.2.2.
by Wool(wool@wool.pe.ksr)

reference - Daniel Shiffman, The Nature of Code(2012)
*/
class Walker {
  float x, y;
  
  float tx, ty;
  
  Walker() {
    tx = 0;
    ty = 100;
  }
  
  void display() {
    stroke(5);
    ellipse(x,y, 5,5);
  }
  
  void step() {
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);
    
    tx += 0.01;
    ty += 0.01;
  }
}

Walker w;

void setup() {
  size(800, 800);
  
  w = new Walker();
  
  background(255);
}

void draw() {
  w.step();
  w.display();
}