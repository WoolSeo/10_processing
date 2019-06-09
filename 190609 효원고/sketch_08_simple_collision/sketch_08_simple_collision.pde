int s_1, v_1, s_2, v_2;
int r = 50;
void setup() {
  size(500,300);
  s_1 = 0; 
  v_1 = 20;
  s_2 = width/2; 
  v_2 = 0;
}
void draw() {
  if(s_2 - s_1 < r) {
    v_2 = v_1;
    v_1 = 0;
  }
  fill(100);
  ellipse(s_1, height/2, r*2, r*2);
  fill(250);
  ellipse(s_2, height/2, r*2, r*2);
  s_1 = s_1 + v_1;
  s_2 = s_2 + v_2;
}
