int x, y, v_x, v_y, a_y;

void setup() {
  size(500, 300);
  x = 0;
  y = 300;
  v_x = 10;
  v_y = -24;
  a_y = +1;
}

void draw() {
  ellipse(x, y, 10, 10);
  x = x + v_x;
  v_y = v_y + a_y;
  y = y + v_y; 
}
