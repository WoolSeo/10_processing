/*
created 2016.09.12.
by Wool(wool@wool.pe.kr)
ref : https://www.processing.org/tutorials/overview/
      https://processing.org/reference/libraries/pdf/
*/

//To use the PDF library in a project, 
//choose Sketch → Import Library → pdf. 
import processing.pdf.*;

void setup() {
  size(400, 400, PDF, "single_frame.pdf");
}

void draw() {
  // Draw something good here
  line(0, 0, width/2, height);

  // Exit the program 
  println("Finished.");
  exit();
}