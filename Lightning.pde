int[] x = new int[10];
int[] y = new int[10];
int[] prevX = new int[10];
int[] prevY = new int[10];
color[] lineColor = new color[10];
int numLines = 1;
int mode = 1;

void setup() {
  size(500,500);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 0);
  x[0] = 250;
  y[0] = 250;
  lineColor[0] = randomColor();
}


void draw() {
  //strokeWeight(3);
  for (int i = 0; i < numLines; i++){
    stroke(lineVariation(lineColor[i]));
    prevX[i] = x[i];
    prevY[i] = y[i];
    x[i] += (int)(Math.random()*11)-5;
    y[i] += (int)(Math.random()*11)-5;
    line(prevX[i], prevY[i], x[i], y[i]);
  }
}

void mouseClicked() {
  if (mode == 1) {
    if (lineColor[9] == 0) {
      lineColor[numLines] = randomColor();
      x[numLines] = 250;
      y[numLines] = 250;
      numLines ++;
    }
  }
}

color randomColor() {
  int h = (int)(Math.random() * 151+ 180);
  int s = (int)(Math.random() * 101 + 15);
  int b = (int)(Math.random() * 6 + 95);
  return color(h, s, b);
}

color lineVariation(color c){
  int h = (int)(Math.random() * 40 +(hue(c)-20));
  int s = (int)(Math.random() * 15 +(saturation(c)-7.5));
  int b = (int)brightness(c);
  return color(h, s, b);
}
