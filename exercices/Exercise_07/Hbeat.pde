// A class to describe a "hbeat" (really a button)
class Hbeat {
  // Location and size
  float x;
  float y;
  float r;
  SoundFile sound;

  // Create the hbeat
  Hbeat(float x_, float y_, float r_, String filename_, PApplet sketch) {
    x = x_;
    y = y_;
    r = r_;
    sound = new SoundFile(sketch, filename_);
  }

  // Is a point inside the hbeat? (used for mouse rollover, etc.)
  boolean contains(float mx, float my) {
    if (dist(mx, my, x, y) < r/2) {
      return true;
    } else {
      return false;
    }
  }

  void ring() {
    sound.play();
  }

  // Show the hbeat (hardcoded colors, could be improved)
  void display(float mx, float my) {
    if (contains(mx, my)) {
      fill(100);
    } else {
      fill(175);
    }
    noStroke();
    //stroke(0);
    //strokeWeight(1);
    ellipse(x, y,60, 20);
  }
}