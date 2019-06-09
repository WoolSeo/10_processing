float s_1, v_1;
float r = 50; 
void setup() {
  size(500,300);
  s_1 = width/2; 
  v_1 = 20; 
}
void draw() {
  fill(170);
  rect(0, 0, width, height);
  if(s_1 > width) {
    v_1 = v_1 * (-1);
  }
  fill(100);
  ellipse(s_1, height/2, r*2, r*2);
  s_1 = s_1 + v_1;
}
