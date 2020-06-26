int size = 1;
void setup() {
  size(500, 400);
  frameRate(60);
}

void draw() {
  ellipse(width/2, height/2, size, size);
  size = size + 1;
}
