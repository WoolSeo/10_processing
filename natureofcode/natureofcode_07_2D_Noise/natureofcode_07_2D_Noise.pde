/*
nature of code

07. 2D Noise

created 2017.2.2.
by Wool(wool@wool.pe.ksr)

reference - Daniel Shiffman, The Nature of Code(2012)
*/
float t = 0;

void setup() {
  size(400,400);
}
void draw() {
  //Random noise
  /*
  loadPixels();
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      float bright = random(255);
      pixels[x+y*width] = color(bright);
    }
  }
  updatePixels();*/
  float xoff = 0.0;
  loadPixels();
  for(int x = 0; x < width; x++) {
    float yoff= 0.0;
    for(int y = 0; y < height; y++) {
      float bright = map(noise(xoff,yoff), 0, 1, 0, 255);
      pixels[x+y*width] = color(bright);
      yoff += 0.1;
    }
  }
  updatePixels();
  xoff += 0.1;
}