class Button {
  
  int rectX, rectY;      // Position of square button

int rectSize = 90;     // Diameter of rect

color rectColor,  baseColor;
color rectHighlight;
color currentColor;
boolean rectOver = false;


void setup() {
  size(640, 360);
  rectColor = color(30);
  rectHighlight = color(51);
  
  
  baseColor = color(102);
  currentColor = baseColor;
  
  
  rectX = width/2-rectSize-10;
  rectY = height/2-rectSize/2;
  ellipseMode(CENTER);
}

void draw() {
  
  background(currentColor);
  
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  stroke(255);
  rect(rectX, rectY, rectSize, rectSize);
  
  
}

void mousePressed() {
  
  if (rectOver) {
    currentColor = rectColor;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

  
}