int s, v;

void setup() {
  size(1000, 500);
  s = 0; 
  v = 20;
}

void draw() {
  ellipse(s, height/2, 10, 10);
  s = s + v;
}
