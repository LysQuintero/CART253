

class Smiley {
 
  PImage smileyimg;
  float xpos, ypos;

  Smiley() {
    smileyimg = loadImage("smiley.png");
  }

  void update(float x, float y) {
    xpos = x;
    ypos = y;
  }

  void display() {
    image(smileyimg, xpos, ypos);
  }
}