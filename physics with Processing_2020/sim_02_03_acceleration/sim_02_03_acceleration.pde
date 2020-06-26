int s, v, a;

void setup() {
  size(1280, 720);
  s = 0; 
  v = 0; 
  a = 2; 
}

void draw() {
  ellipse(s, height/2, 10, 10);
  v = v + a;
  s = s + v;
}
