/*
nature of code

03. random walke

created 2017.1.22.
by Wool(wool@wool.pe.ksr)

reference - Daniel Shiffman, The Nature of Code(2012)
*/
class Walker {
  int x;
  int y;
  
  Walker() {
    x = width / 2;
    y = height / 2;
  }
  
  void display() {
    stroke(0);
    point(x,y);
  }
  
  void step() {
    float r = random(1);
    if (r<0.4) {
      x++;
    }
    else if (r<0.6) {
      x--;
    }
    else if (r<0.8) {
      y++;
    }
    else {
      y--;
    }
  }
}

Walker w;

void setup() {
  size(640, 360);
  
  w = new Walker();
  
  background(255);
}

void draw() {
  w.step();
  w.display();
}