int[] x1 = new int[10];
int[] y1 = new int[10];
int[] prevX1 = new int[10];
int[] prevY1 = new int[10];
color[] lineColor1 = new color[10];
int x2 = 0;
int y2 = 0;
int prevX2;
int prevY2;
double rot2 = 0;
color lineColor2;
int numLines = 1;
int mode = 2;

void setup() {
  size(500,500);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 0);
  x1[0] = 250;
  y1[0] = 250;
  lineColor1[0] = randomColor();
  lineColor2 = randomColor();
  rot2 = Math.random()*(PI*2);
}


void draw() {
  //strokeWeight(3);
  if (mode == 1) {
    for (int i = 0; i < numLines; i++){
      stroke(lineVariation(lineColor1[i]));
      prevX1[i] = x1[i];
      prevY1[i] = y1[i];
      x1[i] += (int)(Math.random()*11)-5;
      y1[i] += (int)(Math.random()*11)-5;
      line(prevX1[i], prevY1[i], x1[i], y1[i]);
    }
  } else if (mode == 2) {
     pushMatrix();
     translate(250,250);
     rotate((float)rot2);
     while (x2 < 250){
      stroke(lineVariation(lineColor2));
      prevX2 = x2;
      prevY2 = y2;
      x2 += (int)(Math.random()*11)-3;
      y2 += (int)(Math.random()*11)-3;
      line(prevX2, prevY2, x2, y2);
    }
    popMatrix();
  }
}

void mouseClicked() {
  if (mode == 1) {
    if (lineColor1[9] == 0) {
      lineColor1[numLines] = randomColor();
      x1[numLines] = 250;
      y1[numLines] = 250;
      numLines ++;
    }
  } else if (mode == 2) {
    lineColor2 = randomColor();
    x2 = 0;
    y2 = 0;
    rot2 = Math.random()*(PI*2);
  }
}

void keyPressed() {
  if (key == '1')
    mode = 1;
    fill(0,0,0);
    stroke(0,0,0);
    rect(0,0,500,500);
    
    for (int i = 0; i < 10; i++) {
      lineColor1[i] = 0;
    }
    
    x1[0] = 250;
    y1[0] = 250;
    lineColor1[0] = randomColor();
    numLines = 0;
    
  if (key == '2')
    mode = 2;
    fill(0,0,0);
    stroke(0,0,0);
    rect(0,0,500,500);
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
