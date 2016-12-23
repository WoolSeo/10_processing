/*
imageprocessing

live cam - color tracking

created 2016.12.21.
by Wool(wool@wool.pe.kr)

ref : processing video library example 'Brightness Tracking' by Golan Levin. 
*/

import processing.video.*;

Capture video;

//target color
int colorR = 255;
int colorG = 255;
int colorB = 255;

int color_gab = 10;

//target postion
int targetX = 0;
int targetY = 0;


void setup() {
  size(640, 480);
  video = new Capture(this, width, height);
  video.start();  
  noStroke();
  smooth();
  
  colorMode(RGB, 100);
}

void draw() {
  if (video.available()) {
    video.read();
    image(video, 0, 0, width, height); // Draw the webcam video onto the screen
    video.loadPixels();
    
    if(mousePressed == true) {
      color c = get(mouseX, mouseY);
      colorR = c >> 020 & 0xFF;
      colorG = c >> 010 & 0xFF;
      colorB = c & 0xFF;
    }
    
    for(int y = 0; y < height; y++) {
      for(int x = 0; x < width; x++) {
        color temp = get(x,y);
        int temp_R = temp >> 020 & 0xFF;
        if( temp_R > ( colorR - color_gab) && temp_R < ( colorR + color_gab) ) {
          int temp_G = temp >> 010 & 0xFF;
          if( temp_G > ( colorG - color_gab) && temp_G < ( colorG + color_gab) ) {
            int temp_B = temp & 0xFF;
            if( temp_B > ( colorB - color_gab) && temp_B < ( colorB + color_gab) ) {
              targetX = x;
              targetY = y;
            }
          }
        }
      }
    }
    
    fill(colorR, colorG, colorB);
    ellipse(targetX, targetY, 20, 20);
    
    print("targetX : " + targetX + "  targetY : " + targetY );
    println("   R : " + colorR +" G : " + colorG +" B : " + colorB );
  }
}