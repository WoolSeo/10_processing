PVector s, v, a;

void setup() {
  size(500,300);
  
  s = new PVector(0,300);
  v = new PVector(10,-24);
  a = new PVector(0,+1);
}

void draw() { 
  ellipse(s.x, s.y, 10,10);
  s.add(v);
  v.add(a);
}
