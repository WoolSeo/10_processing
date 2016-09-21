import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_01hello_world extends PApplet {

//made by wool@wool.pe.kr
//date : 2016.09.12
//ref : https://www.processing.org/tutorials/overview/

//The setup() block runs once
public void setup() {
   //sets the window size to 400 x 400 pixels
  background(192,64,0); //sets the background color R,G,B value
  stroke(255);               // sets the stroke color to white
  //stroke(255, 255, 255);     // identical to the line above
  //stroke(255, 128, 0);       // bright orange (red 255, green 128, blue 0)
  //stroke(#FF8000);           // bright orange as a web color
  //stroke(255, 128, 0, 128);  // bright orange with 50% transparency
  
}

//the draw() block runs repeatedly
public void draw() {
  //line(15, 25, 70, 90); // line from coordinate (15, 25) to (70, 90)
  //background(192,64,0); //reflash background
  line(150, 25, mouseX, mouseY); //single line that follows the mouse
}

//when the mouse is pressed, the screen is cleared via the background() function:
public void mousePressed() {
  background(192,64,0);
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_01hello_world" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
