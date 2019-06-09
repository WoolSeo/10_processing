float x, y, vx, vy, r;
float bar_x, bar_y, bar_size;
void setup() {
  size(1280,720);
  x = width/2; 
  y = height/2; 
  vx = 10; 
  vy = 10;
  r = 50; 
  
  bar_x = width/2;
  bar_y = height-100;
  bar_size = 300;
}

void draw() {
  fill(170);
  rect(0, 0, width, height);
  
  if( x > width-r || x < r) {
    vx = vx * (-1);
  }
  if( y > height-r || y < r ) {
    vy = vy * (-1);
  }
   
  if (key == CODED) { 
    if (keyCode == LEFT) {
      bar_x = bar_x - 10;
      if(bar_x < 0){
        bar_x = 0;
      }
    } else if (keyCode == RIGHT) {
      bar_x = bar_x + 10;
      if(bar_x > width-bar_size){
        bar_x = width-bar_size;
      }
    }
  }
  
  if( x > bar_x ) {
    if( x < bar_x + bar_size ) {
      if( y > bar_y - r ) {
        if( y < bar_y + 20) {
          vy = vy * (-1);
        }
      }
    }
  }

  fill(120);
  rect(bar_x, bar_y, bar_size, 20);
  
  fill(100);
  ellipse(x, y, r*2, r*2);
  x = x + vx;
  y = y + vy;
}
