int backgroundColor = 180;

void setup() {
  size(500, 300);
  strokeWeight(4);
  strokeCap(SQUARE);
  noLoop();
}


void draw() {
  background(backgroundColor);
  int padding = 10;
  for (int h=padding; h<=(height - padding*1.5); h+=padding) {
    stroke(blendColors(color(0, 255-h), color(backgroundColor)));
    jaggedLine(padding, h, width-padding*2, h);
    stroke(color(255, 255, 0));
    jaggedLine(padding, h+4, width-padding*2, h+4);
  }
}

void jaggedLine(float x1, float y1, float x2, float y2) {
  float dist = sqrt(sq(x2-x1) + sq(y2-y1));
  float lastX = x1;
  float lastY = y1;

  int sparsity = 15;
  for (int i = 0; i <=dist; i+=sparsity) {
    float x = lerp(x1, x2, i/dist);
    float y = lerp(y1, y2, i/dist);
    y += random(5.0);
    line(lastX, lastY, x, y);
    lastX = x;
    lastY = y;
    strokeCap(ROUND);
  }
  strokeCap(SQUARE);
  line(lastX, lastY, x2, y2);
}

void dottedLine(float x1, float y1, float x2, float y2) {
  float dist = sqrt(sq(x2-x1) + sq(y2-y1));
  strokeCap(ROUND);
  //line(x1, y1, x2, y2);
  int sparsity = 15;
  for (int i = 0; i <= dist; i+=sparsity) {
    float x = lerp(x1, x2, i/dist);//+40;
    float y = lerp(y1, y2, i/dist);
    point(x, y+random(5.0));
  }
}

color blendColors(color col, color bg) {
  float blendR = ((1.0 - (alpha(col)/255.0))*red(bg)/255.0) + (alpha(col)/255.0*red(col)/255.0);
  float blendG = ((1.0 - (alpha(col)/255.0))*green(bg)/255.0) + (alpha(col)/255.0*green(col)/255.0);
  float blendB = ((1.0 - (alpha(col)/255.0))*blue(bg)/255.0) + (alpha(col)/255.0*blue(col)/255.0);

  color blended = color(int(blendR*255), int(blendG*255), int(blendB*255));
  return blended;
}

import processing.pdf.*;
 
