int s, v, a;
void setup() {
  size(500,300);
  s = 0;
  v = 1;
  a = 1;
}
void draw() {
  ellipse(s,height/2,100,100);
  s = s + v;
  v = v + a;
}
