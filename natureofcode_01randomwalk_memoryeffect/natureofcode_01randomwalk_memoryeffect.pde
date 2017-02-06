/*
nature of code

01. random walke

created 2017.1.22.
by Wool(wool@wool.pe.kr)

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
    
    int choice = int(random(4));
    if (choice == 0) {
      x++;
    }
    else if (choice == 1) {
      x--;
    }
    else if (choice == 2) {
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
  //noStroke();
  //fill(255,1);
  //rect(0,0,width,height);
  
  w.step();
  w.display();
}