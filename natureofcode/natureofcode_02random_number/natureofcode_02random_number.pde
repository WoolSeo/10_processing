/*
nature of code

02. random numbers

created 2017.1.22.
by Wool(wool@wool.pe.kr)
s
reference - Daniel Shiffman, The Nature of Code(2012)
*/
int[] randomCounts;

void setup() {
  size(640, 240);
  randomCounts = new int[20];
}

void draw() {
  background(255);
  
  int index = int(random(randomCounts.length));
  randomCounts[index]++;
  
  stroke(0);
  fill(175);
  int w = width / randomCounts.length;
  
  for(int x = 0; x < randomCounts.length; x++) {
    rect(x*w, height-randomCounts[x], w-1, randomCounts[x]);
  }
}