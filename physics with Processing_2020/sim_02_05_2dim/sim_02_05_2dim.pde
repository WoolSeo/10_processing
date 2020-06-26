int x, y, v_x, v_y, a_y;

void setup() {
  size(1000, 500);
  x = 0;
  y = 350;
  v_x = 2;
  v_y = 2;
  a_y = 1;
}

void draw() {
  ellipse(x, y, 10, 10);
  x = x + v_x;
  v_y = v_y + a_y;
  y = y + v_y; 
}
