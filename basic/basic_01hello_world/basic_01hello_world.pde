/*
created 2016.09.12.
by Wool(wool@wool.pe.kr)
date : 2016.09.12
ref : https://www.processing.org/tutorials/overview/
*/

//The setup() block runs once
void setup() {
  size(400, 400); //sets the window size to 400 x 400 pixels
  background(192,64,0); //sets the background color R,G,B value
  stroke(255);               // sets the stroke color to white
  //stroke(255, 255, 255);     // identical to the line above
  //stroke(255, 128, 0);       // bright orange (red 255, green 128, blue 0)
  //stroke(#FF8000);           // bright orange as a web color
  //stroke(255, 128, 0, 128);  // bright orange with 50% transparency
  
}

//the draw() block runs repeatedly
void draw() {
  //line(15, 25, 70, 90); // line from coordinate (15, 25) to (70, 90)
  //background(192,64,0); //reflash background
  line(150, 25, mouseX, mouseY); //single line that follows the mouse
  saveFrame("output-####.png");
}

//when the mouse is pressed, the screen is cleared via the background() function:
void mousePressed() {
  background(192,64,0);
}