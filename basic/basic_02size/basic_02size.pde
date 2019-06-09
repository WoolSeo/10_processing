/*
created 2016.09.12.
by Wool(wool@wool.pe.kr)
date : 2016.09.12
ref : https://www.processing.org/tutorials/overview/
*/

//The setup() block runs once
void setup() {
  size(500, 400); //sets the window size to 400 x 400 pixels
}

//the draw() block runs repeatedly
void draw() {
  // The wrong way to specify the middle of the screen
  ellipse(200, 200, 50, 50);

  // Always the middle, no matter how the size() line changes
  //ellipse(width/2, height/2, 50, 50);
}